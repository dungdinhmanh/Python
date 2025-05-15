import os
import sys
import cv2
import multiprocessing
from concurrent.futures import ProcessPoolExecutor, as_completed
import time # Import time module for time parsing

def _print_progress_bar(iteration, total, prefix='', suffix='', decimals=1, bar_length=100):
    str_format = "{0:." + str(decimals) + "f}"
    percents = str_format.format(100 * (iteration / float(total)))
    filled_length = int(round(bar_length * iteration / float(total)))
    bar = '#' * filled_length + '-' * (bar_length - filled_length)
    sys.stdout.write('\r%s |%s| %s%s %s' % (prefix, bar, percents, '%', suffix))
    sys.stdout.flush()
    if iteration == total:
        sys.stdout.write('\n')

def _convert_time_string_to_seconds(time_str):
    if '.' in time_str:
        main_part, ms_part = time_str.split('.')
        ms = float('0.' + ms_part)
    else:
        main_part = time_str
        ms = 0.0

    parts = list(map(int, main_part.split(':')))

    seconds = 0
    if len(parts) == 3: # HH:MM:SS
        seconds = parts[0] * 3600 + parts[1] * 60 + parts[2]
    elif len(parts) == 2: # MM:SS
        seconds = parts[0] * 60 + parts[1]
    elif len(parts) == 1: # SS
        seconds = parts[0]
    else:
        raise ValueError(f"Định dạng thời gian không hợp lệ: {time_str}")

    return seconds + ms

def _process_frame_chunk(video_path, frames_dir, overwrite, start_frame, end_frame, every):
    capture = cv2.VideoCapture(video_path)
    capture.set(cv2.CAP_PROP_POS_FRAMES, start_frame)
    frame_index = start_frame
    saved_count = 0
    video_filename = os.path.split(video_path)[1]
    output_subdir_for_chunk = os.path.join(frames_dir, video_filename)

    os.makedirs(output_subdir_for_chunk, exist_ok=True)

    while frame_index < end_frame:
        ret, image = capture.read()

        if not ret or image is None:
            frame_index += 1
            continue

        if frame_index % every == 0:
            save_path = os.path.join(output_subdir_for_chunk, "{:010d}.png".format(frame_index))

            if not os.path.exists(save_path) or overwrite:
                cv2.imwrite(save_path, image)
                saved_count += 1

        frame_index += 1

    capture.release()
    return saved_count

def extract_frames_from_single_interval(video_path, frames_dir, start_time_str, end_time_str, overwrite=False, every=1, chunk_size=1000):
    video_path = os.path.normpath(video_path)
    frames_dir = os.path.normpath(frames_dir)
    video_filename = os.path.split(video_path)[1]
    output_subdir = os.path.join(frames_dir, video_filename)

    print(f"Bắt đầu trích xuất khung hình từ: {video_path}")

    if not os.path.exists(video_path):
        print(f"Lỗi: Không tìm thấy tệp video tại {video_path}")
        return None

    os.makedirs(output_subdir, exist_ok=True)

    capture = cv2.VideoCapture(video_path)
    fps = capture.get(cv2.CAP_PROP_FPS)
    total_frames = int(capture.get(cv2.CAP_PROP_FRAME_COUNT))
    capture.release()

    if total_frames < 1 or fps <= 0:
        print("Lỗi: Không thể đọc thuộc tính video (khung hình hoặc FPS).")
        return None

    print(f"Video FPS: {fps}, Tổng số khung hình: {total_frames}")

    try:
        start_seconds = _convert_time_string_to_seconds(start_time_str)
        end_seconds = _convert_time_string_to_seconds(end_time_str)

        start_frame = int(start_seconds * fps)
        end_frame = int(end_seconds * fps)

        start_frame = max(0, start_frame)
        end_frame = min(total_frames, end_frame)

        if start_frame >= end_frame:
            print(f"Cảnh báo: Khoảng thời gian không hợp lệ hoặc rỗng '{start_time_str}' đến '{end_time_str}' dẫn đến phạm vi khung hình từ {start_frame} đến {end_frame}. Bỏ qua.")
            return None

        print(f"Khoảng thời gian '{start_time_str}' đến '{end_time_str}' tương ứng với khung hình từ {start_frame} đến {end_frame}")

    except ValueError as e:
        print(f"Lỗi khi phân tích cú pháp khoảng thời gian '{start_time_str}' đến '{end_time_str}': {e}. Bỏ qua.")
        return None
    except Exception as e:
        print(f"Đã xảy ra lỗi không mong muốn khi xử lý khoảng thời gian '{start_time_str}' đến '{end_time_str}': {e}. Bỏ qua.")
        return None

    # Chia khoảng khung hình thành các đoạn nhỏ
    frame_chunks = [[i, min(i + chunk_size, end_frame)] for i in range(start_frame, end_frame, chunk_size)]

    if not frame_chunks:
        print("Không có khung hình hợp lệ để trích xuất trong khoảng thời gian này. Thoát.")
        return None

    prefix_str = f"Trích xuất khung hình từ {video_filename}"

    # Thiết lập multiprocessing
    start_method = 'spawn' if sys.platform.startswith('win') else 'fork'
    try:
        if multiprocessing.get_start_method(allow_none=True) is None:
             multiprocessing.set_start_method(start_method, force=True)
        elif multiprocessing.get_start_method() != start_method:
             print(f"Cảnh báo: Phương thức khởi động multiprocessing là '{multiprocessing.get_start_method()}' (đã được đặt trước đó). Khuyến nghị là '{start_method}'.")
    except RuntimeError:
         print(f"Cảnh báo: Không thể đặt phương thức khởi động multiprocessing thành '{start_method}'. Sử dụng mặc định.")
         pass

    print(f"Tổng số đoạn khung hình cần xử lý: {len(frame_chunks)}")

    # Thực thi sử dụng ProcessPoolExecutor
    with ProcessPoolExecutor(max_workers=multiprocessing.cpu_count()) as executor:
        futures = []
        for start_frame_chunk, end_frame_chunk in frame_chunks:
            futures.append(executor.submit(
                _process_frame_chunk,
                video_path,
                frames_dir,
                overwrite,
                start_frame_chunk,
                end_frame_chunk,
                every
            ))

        # Xử lý kết quả và hiển thị tiến trình
        total_chunks = len(frame_chunks)
        for i, future in enumerate(as_completed(futures)):
            try:
                # Có thể lấy kết quả nếu worker trả về (ví dụ: số khung hình đã lưu)
                # result = future.result()
                pass
            except Exception as exc:
                print(f'\nĐoạn khung hình gặp lỗi: {exc}')
            finally:
                # Cập nhật thanh tiến trình dựa trên các đoạn đã hoàn thành
                _print_progress_bar(i + 1, total_chunks, prefix=prefix_str, suffix='Hoàn thành')

    print("\nTrích xuất khung hình hoàn tất cho khoảng thời gian đã chỉ định.")
    return output_subdir

if __name__ == '__main__':
    test_video_path = 'arya.mp4' # ĐẢM BẢO TỆP VIDEO NÀY TỒN TẠI ĐỂ KIỂM TRA!
    test_output_dir = 'test_single_interval_frames_output'

    single_time_interval_to_extract = ('0:10.5', '0:15') 

    extracted_directory = extract_frames_from_single_interval(
        video_path=test_video_path,
        frames_dir=test_output_dir,
        start_time_str=single_time_interval_to_extract[0],
        end_time_str=single_time_interval_to_extract[1],
        overwrite=False,     
        every=5,           
        chunk_size=500    
    )
