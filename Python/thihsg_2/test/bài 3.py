def find_original_string(x, k):
    n = len(x)
    first_char = (ord(x[0]) - ord('a') + k) % 26 + ord('a')
    original_string = chr(first_char)
    current_index = 0
    for _ in range(n - 1):
        next_index = (current_index + k) % n
        next_char = (ord(x[next_index]) - ord('a') + k) % 26 + ord('a')
        original_string += chr(next_char)
        current_index = next_index
    
    return original_string

x = input("Nhập xâu x: ")
k = int(input("Nhập số k: "))
print("Xâu S ban đầu là:", find_original_string(x, k))
