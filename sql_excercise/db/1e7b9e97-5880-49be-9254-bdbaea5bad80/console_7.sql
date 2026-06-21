CREATE TABLE Docgia (
    MADG VARCHAR(10) PRIMARY KEY,
    HOTEN NVARCHAR(100) NOT NULL,
    NGAYSINH DATE,
    DIACHI NVARCHAR(150),
    NGHENGHIEP NVARCHAR(50)
);

CREATE TABLE Phieumuon (
    SOPM VARCHAR(10) PRIMARY KEY,
    NGAYMUON DATE NOT NULL,
    MADG VARCHAR(10) REFERENCES Docgia(MADG)
);

CREATE TABLE Sach (
    MASH VARCHAR(10) PRIMARY KEY,
    TENSACH NVARCHAR(150) NOT NULL,
    TACGIA NVARCHAR(100),
    NHAXB NVARCHAR(100),
    NAMXB INT
);

CREATE TABLE Dausach (
    MADAUSACH VARCHAR(10) PRIMARY KEY,
    BAN NVARCHAR(50),
    TAP NVARCHAR(20),
    MASH VARCHAR(10) REFERENCES Sach(MASH)
);

CREATE TABLE Chitietmuon (
    SOPM VARCHAR(10) REFERENCES Phieumuon(SOPM),
    MADAUSACH VARCHAR(10) REFERENCES Dausach(MADAUSACH),
    NGAYTRA DATE,
    PRIMARY KEY (SOPM, MADAUSACH)
);


-- ==========================================
-- 3. CHÈN DỮ LIỆU GIẢ (DUMMY DATA)
-- ==========================================

-- Thêm Sách
INSERT INTO Sach VALUES 
('S01', N'Nhập môn SQL cơ bản', N'Nguyễn Văn A', N'NXB Giáo Dục', 2020),
('S02', N'Cấu trúc dữ liệu và Giải thuật', N'Trần Thị B', N'NXB Trẻ', 2019),
('S03', N'Lập trình hướng đối tượng', N'Lê Văn C', N'NXB Thống Kê', 2021);

-- Thêm Đầu sách
INSERT INTO Dausach VALUES 
('DS01', N'Bản in thử', N'Tập 1', 'S01'),
('DS02', N'Bản chính thức', N'Tập 1', 'S01'),
('DS03', N'Bản đặc biệt', N'Tập 1', 'S02'),
('DS04', N'Bản phổ thông', N'Tập 2', 'S03');

-- Thêm Độc giả (Có ngày sinh khác nhau để test câu d - độc giả lớn tuổi nhất)
INSERT INTO Docgia VALUES 
('DG01', N'Phạm Minh Tuấn', '1980-05-12', N'123 Lê Lợi, HCMC', N'Kỹ sư'),      -- Người lớn tuổi nhất
('DG02', N'Nguyễn Thị Lan', '1995-08-20', N'456 Nguyễn Huệ, HCMC', N'Sinh viên'),
('DG03', N'Vũ Hoàng Nam', '2002-11-02', N'789 Cách Mạng T8, HCMC', N'Học sinh');

-- Thêm Phiếu mượn (Có mượn trong năm 2001 để test câu c, và ngày cụ thể '2001-05-15' làm biến d)
INSERT INTO Phieumuon VALUES 
('PM001', '2001-05-15', 'DG01'), -- Ngày d cố định, phiếu mượn x cố định luôn (PM001)
('PM002', '2001-05-15', 'DG02'), -- Cùng mượn ngày d
('PM003', '2001-09-20', 'DG01'), -- DG01 mượn lần 2 trong năm 2001
('PM004', '2002-03-10', 'DG03'); -- Mượn sang năm 2002

-- Thêm Chi tiết mượn
INSERT INTO Chitietmuon VALUES 
('PM001', 'DS01', '2001-05-25'),
('PM001', 'DS02', '2001-05-28'),
('PM002', 'DS03', '2001-05-30'),
('PM003', 'DS04', '2001-10-01'),
('PM004', 'DS01', '2002-03-20');

SELECT Docgia.MADG, HOTEN, DIACHI
FROM Docgia, Phieumuon
WHERE NGAYMUON = ''
  and Docgia.MADG = Phieumuon.MADG;

SELECT Sach.MASH, TENSACH, TACGIA, NGAYMUON, NGAYTRA
FROM Sach, Phieumuon, Chitietmuon
WHERE Phieumuon.SOPM = Chitietmuon.SOPM
GROUP BY MASH;

SELECT Docgia.MADG, HOTEN,COUNT(SOPM) AS SOLANMUON
FROM Phieumuon, Docgia
WHERE YEAR(NGAYMUON) = '2001'
  and Docgia.MADG = Phieumuon.MADG
GROUP BY Docgia.MADG;

SELECT Docgia.*
FROM Docgia, Phieumuon
WHERE DAY(NGAYMUON) = '15'
  and Docgia.MADG = Phieumuon.MADG
ORDER BY NGAYSINH ASC;