CREATE TABLE Khoa (
    MAKHOA VARCHAR(10) PRIMARY KEY,
    TENKHOA NVARCHAR(50) NOT NULL,
    DTKHOA VARCHAR(20)
);

CREATE TABLE Giaovien (
    MAGV VARCHAR(10) PRIMARY KEY,
    HOTEN NVARCHAR(100) NOT NULL,
    DTGV VARCHAR(20),
    MAKHOA VARCHAR(10) REFERENCES Khoa(MAKHOA)
);

CREATE TABLE Lop (
    MALOP VARCHAR(10) PRIMARY KEY,
    TENLOP NVARCHAR(50) NOT NULL,
    SISO INT,
    MAKHOA VARCHAR(10) REFERENCES Khoa(MAKHOA)
);

CREATE TABLE Monhoc (
    MAMH VARCHAR(10) PRIMARY KEY,
    TENMH NVARCHAR(100) NOT NULL
);

CREATE TABLE Phonghoc (
    SOPHONG VARCHAR(10) PRIMARY KEY,
    CHUCNANG NVARCHAR(50)
);

CREATE TABLE Lichbaogiang (
    MALICH VARCHAR(10) PRIMARY KEY,
    NGAYDAY DATE,
    MAGV VARCHAR(10) REFERENCES Giaovien(MAGV)
);

CREATE TABLE Dongbaogiang (
    MALICH VARCHAR(10) REFERENCES Lichbaogiang(MALICH),
    TUTIET INT,
    DENTIET INT,
    BAIDAY NVARCHAR(150),
    GHICHU NVARCHAR(150),
    MAMH VARCHAR(10) REFERENCES Monhoc(MAMH),
    LYTHUYET BIT, -- 1: Lý thuyết, 0: Thực hành
    MALOP VARCHAR(10) REFERENCES Lop(MALOP),
    SOPHONG VARCHAR(10) REFERENCES Phonghoc(SOPHONG),
    PRIMARY KEY (MALICH, TUTIET)
);


-- ==========================================
-- 3. CHÈN DỮ LIỆU GIẢ (DUMMY DATA)
-- ==========================================

-- Khoa (Có khoa CNTT)
INSERT INTO Khoa VALUES 
('CNTT', N'Công nghệ thông tin', '0243.111'),
('KT', N'Kế toán', '0243.222');

-- Giaovien (Có giáo viên mã TH3A040 thuộc khoa CNTT)
INSERT INTO Giaovien VALUES 
('TH3A040', N'Nguyễn Minh Trí', '0912345', 'CNTT'),
('GV02', N'Trần Thị Hồng', '0987654', 'CNTT'),
('GV03', N'Lê Văn Nam', '0901234', 'KT');

-- Lop
INSERT INTO Lop VALUES 
('LH01', N'Cao đẳng Tin học 1', 40, 'CNTT'),
('LH02', N'Cao đẳng Kế toán 1', 35, 'KT');

-- Monhoc
INSERT INTO Monhoc VALUES 
('MH01', N'Cơ sở dữ liệu'),
('MH02', N'Lập trình Web');

-- Phonghoc
INSERT INTO Phonghoc VALUES 
('P301', N'Phòng Lý Thuyết'),
('PM02', N'Phòng Máy Tính');

-- Lichbaogiang (Có ngày nằm trong khoảng 16/09/2002 -> 23/09/2002)
INSERT INTO Lichbaogiang VALUES 
('L01', '2002-09-18', 'TH3A040'), -- Thỏa câu a
('L02', '2002-09-23', 'GV02'),    -- Thỏa câu b (GV khoa CNTT dạy ngày 23/09/2002)
('L03', '2002-09-23', 'GV03');    -- Không thỏa câu b vì thuộc khoa KT

-- Dongbaogiang
INSERT INTO Dongbaogiang VALUES 
('L01', 1, 3, N'Chương 1: Tổng quan CSDL', N'Dạy bù', 'MH01', 1, 'LH01', 'P301'),
('L02', 4, 6, N'Bài tập HTML/CSS', N'Đầy đủ thiết bị', 'MH02', 0, 'LH01', 'PM02'),
('L03', 1, 3, N'Kế toán doanh nghiệp', N'', 'MH01', 1, 'LH02', 'P301');

SELECT Giaovien.MAGV, HOTEN, TENLOP, TENMH, Phonghoc.SOPHONG, NGAYDAY, TUTIET, DENTIET, BAIDAY, GHICHU
FROM Giaovien, Lop, Monhoc, Phonghoc, Lichbaogiang, Dongbaogiang
WHERE Giaovien.MAGV = 'TH3A040' and NGAYDAY BETWEEN '2002-09-16' AND '2002-09-23'
  and Giaovien.MAGV = Lichbaogiang.MAGV
  and Phonghoc.SOPHONG = Dongbaogiang.SOPHONG
  and Monhoc.MAMH = Dongbaogiang.MAMH
  and Dongbaogiang.MALICH = Lichbaogiang.MALICH
  and Lop.MALOP = Dongbaogiang.MALOP;
-- Use join
SELECT GV.MAGV, HOTEN, TENLOP, TENMH, PH.SOPHONG, NGAYDAY, TUTIET, DENTIET, BAIDAY, GHICHU
FROM Giaovien GV
    JOIN Lichbaogiang LBG ON LBG.MAGV = GV.MAGV
    JOIN Dongbaogiang DBG ON DBG.MALICH = LBG.MALICH
    JOIN Lop ON Lop.MALOP = DBG.MALOP
    JOIN Monhoc MH ON MH.MAMH = DBG.MAMH
    JOIN Phonghoc PH ON PH.SOPHONG = DBG.SOPHONG
WHERE GV.MAGV = 'TH3A040' and NGAYDAY BETWEEN '2002-09-16' AND '2002-09-23';

SELECT Giaovien.MAGV, HOTEN, TENLOP, TENMH, Phonghoc.SOPHONG, NGAYDAY, TUTIET, DENTIET, BAIDAY, GHICHU
FROM Giaovien, Lop, Monhoc, Phonghoc, Lichbaogiang, Dongbaogiang
WHERE NGAYDAY = '2002-09-23' and Giaovien.MAKHOA = 'CNTT'
  and Giaovien.MAGV = Lichbaogiang.MAGV
  and Phonghoc.SOPHONG = Dongbaogiang.SOPHONG
  and Monhoc.MAMH = Dongbaogiang.MAMH
  and Dongbaogiang.MALICH = Lichbaogiang.MALICH
  and Lop.MALOP = Dongbaogiang.MALOP;

SELECT GV.MAGV, HOTEN, TENLOP, TENMH, PH.SOPHONG, NGAYDAY, TUTIET, DENTIET, BAIDAY, GHICHU
FROM Giaovien GV
    JOIN Lichbaogiang LBG ON LBG.MAGV = GV.MAGV
    JOIN Dongbaogiang DBG ON DBG.MALICH = LBG.MALICH
    JOIN Lop ON Lop.MALOP = DBG.MALOP
    JOIN Monhoc MH ON MH.MAMH = DBG.MAMH
    JOIN Phonghoc PH ON PH.SOPHONG = DBG.SOPHONG
WHERE NGAYDAY = '2002-09-23' and GV.MAKHOA = 'CNTT';

SELECT TENKHOA, COUNT(Giaovien.MAKHOA) AS SOLUONGGV
FROM Khoa, Giaovien
WHERE Khoa.MAKHOA = Giaovien.MAKHOA
GROUP BY Khoa.MAKHOA, TENKHOA
ORDER BY TENKHOA ASC;

SELECT TENKHOA, COUNT(GV.MAKHOA) AS SOLUONGGV
FROM Khoa KH, Giaovien GV
WHERE KH.MAKHOA = GV.MAKHOA
GROUP BY KH.MAKHOA, TENKHOA
ORDER BY TENKHOA ASC;