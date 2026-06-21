-- 1. THÊM 3 ĐƠN VỊ (Để có tổng 5 đơn vị: DV01 -> DV05)
INSERT INTO DonVi (MsDV, TenDV, NgayBatDau) VALUES
('DV03', N'Phòng Kế Toán', '2025-05-01'),
('DV04', N'Phòng Marketing', '2025-06-10'),
('DV05', N'Phòng Kỹ Thuật Hệ Thống', '2025-09-01');

-- 2. THÊM NHÂN VIÊN NAM VÀ NỮ
INSERT INTO NhanVien VALUES
-- Nhân viên nữ mới
('NV07', N'Phạm Hải', N'Yến', '1993-07-15', N'22 Lý Tự Trọng, HCMC', N'Nữ', 14000000, 'NV01', 'DV03'),
-- Nhân viên nam mới (Sẽ phân công vào đơn vị 5)
('NV08', N'Nguyễn Hoàng', N'Long', '1989-12-05', N'88 Trần Hưng Đạo, HCMC', N'Nam', 22000000, 'NV01', 'DV05');

-- Cập nhật Quản lý cho đơn vị mới nếu cần (Tùy chọn)
UPDATE DonVi SET MsNQL = 'NV08' WHERE MsDV = 'DV05';

-- 3. THÊM DỰ ÁN CHO ĐƠN VỊ 5 (Để có dự án mà phân công)
INSERT INTO DuAn VALUES
('DA03', N'Bảo Trì Server Trung Tâm', N'Phòng Server Tầng 5', 'DV05');

-- 4. PHÂN CÔNG NHÂN VIÊN NAM (NV08) VÀO DỰ ÁN CỦA ĐƠN VỊ 5
INSERT INTO PhanCong VALUES
('NV08', 'DA03', 35.5);