-- 1. Bảng CHUCVU
CREATE TABLE Chucvu (
    MACV VARCHAR(10) PRIMARY KEY,
    TENCV NVARCHAR(50) NOT NULL,
    LUONGTHAPNHAT DECIMAL(18,2),
    LUONGCAONHAT DECIMAL(18,2)
);

-- 2. Bảng PHONGBAN (Tạo trước Nhanvien nhưng chưa tạo Khóa ngoại MANVPHUTRACH ngay để tránh lỗi vòng lặp)
CREATE TABLE Phongban (
    MAPB VARCHAR(10) PRIMARY KEY,
    TENPB NVARCHAR(50) NOT NULL,
    TRUSO NVARCHAR(150),
    MANVPHUTRACH VARCHAR(10), -- Sẽ thêm Khóa ngoại sau
    KINHPHI DECIMAL(18,2),
    DOANHTHU DECIMAL(18,2)
);

-- 3. Bảng NHANVIEN
CREATE TABLE Nhanvien (
    MANV VARCHAR(10) PRIMARY KEY,
    HOTEN NVARCHAR(100) NOT NULL,
    NU BIT, -- 1: Nữ, 0: Nam (hoặc dùng kiểu dữ liệu khác tùy bạn thích)
    NGAYSINH DATE,
    LUONG DECIMAL(18,2),
    MAPB VARCHAR(10) REFERENCES Phongban(MAPB),
    MACV VARCHAR(10) REFERENCES Chucvu(MACV)
);

-- Thêm khóa ngoại MANVPHUTRACH cho bảng Phongban sau khi đã có bảng Nhanvien
ALTER TABLE Phongban
ADD CONSTRAINT FK_Phongban_Nhanvien FOREIGN KEY (MANVPHUTRACH) REFERENCES Nhanvien(MANV);


-- --- DỮ LIỆU GIẢ ĐỂ TEST ---

-- Thêm Chức vụ
INSERT INTO Chucvu VALUES
('GD', N'Giám đốc', 30000000, 100000000),
('TP', N'Trưởng phòng', 15000000, 40000000),
('NV', N'Nhân viên', 7000000, 20000000);

-- Thêm Phòng ban (để trống MANVPHUTRACH trước)
INSERT INTO Phongban (MAPB, TENPB, TRUSO, KINHPHI, DOANHTHU) VALUES
('PB01', N'Phòng Kinh doanh', N'Tầng 2, Tòa nhà A', 50000000, 500000000),
('PB02', N'Phòng Nhân sự', N'Tầng 3, Tòa nhà A', 20000000, 0);

-- Thêm Nhân viên
INSERT INTO Nhanvien VALUES
('NV001', N'Nguyễn Văn Trưởng', 0, '1988-05-12', 25000000, 'PB01', 'TP'),
('NV002', N'Trần Thị Hoa', 1, '1995-08-20', 12000000, 'PB01', 'NV'),
('NV003', N'Lê Minh Tâm', 0, '1990-11-02', 18000000, 'PB02', 'TP');

-- Cập nhật Trưởng phòng (MANVPHUTRACH) cho các phòng ban
UPDATE Phongban SET MANVPHUTRACH = 'NV001' WHERE MAPB = 'PB01';
UPDATE Phongban SET MANVPHUTRACH = 'NV003' WHERE MAPB = 'PB02';

SELECT *
FROM Phongban;

SELECT HOTEN
FROM Nhanvien
WHERE month(NGAYSINH) = 10;

SELECT MANV, HOTEN,
       (LUONG * 12) AS LuongCaNam
FROM Nhanvien;

SELECT MAPB,TENPB
FROM Phongban
WHERE KINHPHI >= 150000000;

SELECT MAPB, HOTEN
FROM Nhanvien
WHERE MAPB = 'PB40';