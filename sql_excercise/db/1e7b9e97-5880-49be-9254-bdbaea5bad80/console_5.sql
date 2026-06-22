-- ==========================================
-- TẠO BẢNG CƠ SỞ DỮ LIỆU
-- ==========================================

CREATE TABLE Khoa (
    MAKHOA VARCHAR(10) PRIMARY KEY,
    TENKHOA NVARCHAR(50) NOT NULL
);

CREATE TABLE Lop (
    MALOP VARCHAR(10) PRIMARY KEY,
    TENLOP NVARCHAR(50) NOT NULL,
    MAKHOA VARCHAR(10) REFERENCES Khoa(MAKHOA)
);

CREATE TABLE Sinhvien (
    MASV VARCHAR(10) PRIMARY KEY,
    HOTENSV NVARCHAR(100) NOT NULL,
    NU BIT, -- 1: Nữ, 0: Nam
    NGAYSINH DATE,
    NOISINH NVARCHAR(100),
    TINH NVARCHAR(50),
    MALOP VARCHAR(10) REFERENCES Lop(MALOP)
);

CREATE TABLE Monhoc (
    MAMH VARCHAR(10) PRIMARY KEY,
    TENMH NVARCHAR(100) NOT NULL,
    DONVIHT INT
);

CREATE TABLE Giangvien (
    MAGV VARCHAR(10) PRIMARY KEY,
    HOTENGV NVARCHAR(100) NOT NULL,
    HOCVI NVARCHAR(50),
    CHUYENNGANH NVARCHAR(100),
    MAKHOA VARCHAR(10) REFERENCES Khoa(MAKHOA)
);

CREATE TABLE Ketqua (
    MASV VARCHAR(10) REFERENCES Sinhvien(MASV),
    MAMH VARCHAR(10) REFERENCES Monhoc(MAMH),
    LANTHI INT,
    DIEMTHI DECIMAL(4,2),
    PRIMARY KEY (MASV, MAMH, LANTHI)
);

CREATE TABLE Phancong (
    MALOP VARCHAR(10) REFERENCES Lop(MALOP),
    MAMH VARCHAR(10) REFERENCES Monhoc(MAMH),
    MAGV VARCHAR(10) REFERENCES Giangvien(MAGV),
    PRIMARY KEY (MALOP, MAMH, MAGV)
);


-- ==========================================
-- CHÈN DỮ LIỆU GIẢ (DUMMY DATA)
-- ==========================================

-- Khoa
INSERT INTO Khoa VALUES
('CNTT', N'Công nghệ thông tin'),
('CK', N'Cơ khí');

-- Lop (Có lớp CDTH2A)
INSERT INTO Lop VALUES
('CDTH2A', N'Cao đẳng Tin học 2A', 'CNTT'),
('CDCK1', N'Cao đẳng Cơ khí 1', 'CK');

-- Sinhvien (Có tỉnh Long An, có lớp CDTH2A)
INSERT INTO Sinhvien VALUES
('SV01', N'Nguyễn Văn An', 0, '2006-05-12', N'Tân An', N'LONG AN', 'CDTH2A'), -- Thỏa câu 1, 2
('SV02', N'Trần Thị Bình', 1, '2006-08-20', N'Bến Lức', N'LONG AN', 'CDCK1'), -- Thỏa câu 1
('SV03', N'Lê Minh Cường', 0, '2005-11-02', N'HCMC', N'TPHCM', 'CDTH2A');    -- Thỏa câu 2

-- Monhoc (Có môn mã 896)
INSERT INTO Monhoc VALUES
('869', N'Cơ sở dữ liệu', 3),
('102', N'Lập trình C', 4);

-- Giangvien (Có Thạc sỹ khoa CNTT)
INSERT INTO Giangvien VALUES
('GV01', N'Phạm Minh Tuấn', N'THAC SY', N'Hệ thống thông tin', 'CNTT'), -- Thỏa câu 3
('GV02', N'Nguyễn Thị Lan', N'TIEN SY', N'Khoa học máy tính', 'CNTT'),
('GV03', N'Vũ Hoàng Nam', N'THAC SY', N'Chế tạo máy', 'CK');

-- Ketqua (Có điểm thi lần 1 môn 896)
INSERT INTO Ketqua VALUES
('SV01', '869', 1, 8.5), -- Thỏa câu 4
('SV01', '869', 2, 9.0),
('SV03', '869', 1, 7.0), -- Thỏa câu 4
('SV02', '102', 1, 6.0);

-- Phancong (Giảng viên dạy lớp CDTH2A)
INSERT INTO Phancong VALUES
('CDTH2A', '869', 'GV01'), -- GV01 dạy lớp CDTH2A môn 869 -> Thỏa câu 5
('CDTH2A', '102', 'GV02');

SELECT MASV, HOTENSV, NGAYSINH, TENLOP FROM Sinhvien, Lop
WHERE TINH = 'LONG AN' and Lop.MALOP = Sinhvien.MALOP;

SELECT MASV, HOTENSV,NGAYSINH, TINH
FROM Sinhvien
WHERE MALOP = 'CDTH2A';

SELECT MAGV, HOTENGV, CHUYENNGANH
FROM Giangvien
WHERE HOCVI = 'THAC SY' and MAKHOA = 'CNTT';

SELECT Sinhvien.MASV, HOTENSV, DIEMTHI
FROM Sinhvien, Ketqua
WHERE Sinhvien.MASV = Ketqua.MASV and MAMH = '869' and LANTHI = 1;

SELECT Giangvien.MAGV, HOTENGV, TENKHOA, HOCVI, TENMH
FROM Giangvien, Khoa, Phancong, Monhoc
WHERE MALOP = 'CDTH2A'
  and Monhoc.MAMH = Phancong.MAMH
  and Phancong.MAGV = Giangvien.MAGV
  and Khoa.MAKHOA = Giangvien.MAKHOA;

SELECT GV.MAGV, HOTENGV, TENKHOA, HOCVI, TENMH
FROM Giangvien GV
     join Khoa KH ON KH.MAKHOA = GV.MAKHOA
     join Phancong PC ON PC.MAGV = GV.MAGV
     join Monhoc MH ON MH.MAMH = PC.MAMH
WHERE MALOP = 'CDTH2A';