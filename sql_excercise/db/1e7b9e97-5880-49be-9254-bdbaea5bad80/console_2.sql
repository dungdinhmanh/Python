
CREATE TABLE DonVi (
    MsDV VARCHAR(10) PRIMARY KEY,
    TenDV NVARCHAR(50) NOT NULL,
    MsNQL VARCHAR(10), -- Mã số người quản lý (Khóa ngoại tham chiếu vòng lại NhanVien)
    NgayBatDau DATE
);

-- Bảng NhanVien
CREATE TABLE NhanVien (
    MsNV VARCHAR(10) PRIMARY KEY,
    HoLot NVARCHAR(30),
    Ten NVARCHAR(20) NOT NULL,
    NgaySinh DATE,
    DiaChi NVARCHAR(150),
    GioiTinh NVARCHAR(10),
    Luong DECIMAL(18,2),
    MsNGS VARCHAR(10) REFERENCES NhanVien(MsNV), -- Người giám sát (Khóa ngoại đệ quy)
    MsDV VARCHAR(10) REFERENCES DonVi(MsDV)       -- Thuộc đơn vị
);

-- Thêm khóa ngoại MsNQL cho bảng DonVi sau khi đã có bảng NhanVien
ALTER TABLE DonVi
ADD CONSTRAINT FK_DonVi_NhanVien FOREIGN KEY (MsNQL) REFERENCES NhanVien(MsNV);

-- Bảng DuAn
CREATE TABLE DuAn (
    MsDA VARCHAR(10) PRIMARY KEY,
    TenDA NVARCHAR(100) NOT NULL,
    DiaDiemDA NVARCHAR(150),
    MsDV VARCHAR(10) REFERENCES DonVi(MsDV)
);

-- Bảng PhanCong (Khóa chính phức hợp gồm MsNV và MsDA)
CREATE TABLE PhanCong (
    MsNV VARCHAR(10) REFERENCES NhanVien(MsNV),
    MsDA VARCHAR(10) REFERENCES DuAn(MsDA),
    SoGio DECIMAL(5,1),
    PRIMARY KEY (MsNV, MsDA)
);

-- Bảng ThanNhan (Khóa chính yếu dựa vào MsNV và Ten của thân nhân)
CREATE TABLE ThanNhan (
    MsNV VARCHAR(10) REFERENCES NhanVien(MsNV),
    HoLot NVARCHAR(30),
    Ten NVARCHAR(20),
    GioiTinh NVARCHAR(10),
    NgaySinh DATE,
    QuanHe NVARCHAR(30),
    PRIMARY KEY (MsNV, Ten)
);

-- Bảng DiaDiemDV (Khóa chính gồm MsDV và DiaDiem)
CREATE TABLE DiaDiemDV (
    MsDV VARCHAR(10) REFERENCES DonVi(MsDV),
    DiaDiem NVARCHAR(150),
    PRIMARY KEY (MsDV, DiaDiem)
);


-- ==========================================
-- 2. CHÈN DỮ LIỆU GIẢ (DUMMY DATA)
-- ==========================================

-- Chèn phòng ban trước (MsNQL để tạm thời là NULL)
INSERT INTO DonVi (MsDV, TenDV, NgayBatDau) VALUES
('DV01', N'Phòng Nghiên Cứu', '2025-01-01'),
('DV02', N'Phòng Điều Hành', '2025-03-15');

-- Chèn dữ liệu nhân viên
INSERT INTO NhanVien VALUES
('NV01', N'Nguyễn Thúy', N'Hằng', '1985-04-12', N'123 Lê Lợi, HCMC', N'Nữ', 35000000, NULL, 'DV02'), -- Sếp tổng/Quản lý
('NV02', N'Trần Minh', N'Tâm', '1990-08-23', N'456 Nguyễn Huệ, HCMC', N'Nam', 25000000, 'NV01', 'DV01'),
('NV03', N'Lê Thị', N'Bình', '1995-11-02', N'789 Cách Mạng T8, HCMC', N'Nữ', 18000000, 'NV02', 'DV01');

INSERT INTO NhanVien VALUES
('NV04', N'Lê Văn', N'Hùng', '1970-05-15', N'456 Hải Phòng, Đà Nẵng', N'Nam', 15000000, 'NV01', 'DV01'), -- Sinh 1970, Lương 15tr (>12tr)
('NV05', N'Nguyễn Thị', N'Mai', '1968-10-20', N'789 Lê Duẩn, Hà Nội', N'Nữ', 13500000, 'NV01', 'DV02'),   -- Sinh 1968, Lương 13.5tr (>12tr)
('NV06', N'Trần Hoàng', N'Bách', '1974-02-01', N'101 Nguyễn Trãi, HCMC', N'Nam', 9500000, 'NV02', 'DV01'); -- Sinh 1974, Lương 9.5tr

-- Cập nhật người quản lý (MsNQL) cho bảng DonVi
UPDATE DonVi SET MsNQL = 'NV02' WHERE MsDV = 'DV01';
UPDATE DonVi SET MsNQL = 'NV01' WHERE MsDV = 'DV02';

-- Chèn dữ liệu địa điểm đơn vị
INSERT INTO DiaDiemDV VALUES
('DV01', N'Tòa nhà A - Quận 1'),
('DV01', N'Tòa nhà B - Quận 3'),
('DV02', N'Tòa nhà A - Quận 1');

-- Chèn dữ liệu dự án
INSERT INTO DuAn VALUES
('DA01', N'Hệ Thống Giao Hàng Tự Động', N'Khu Công Nghệ Cao', 'DV01'),
('DA02', N'Số Hóa Quy Trình Vận Chuyển', N'Tòa nhà A - Quận 1', 'DV02');

-- Chèn phân công công việc
INSERT INTO PhanCong VALUES
('NV02', 'DA01', 20.5),
('NV03', 'DA01', 40.0),
('NV03', 'DA02', 15.0);

-- Chèn dữ liệu thân nhân
INSERT INTO ThanNhan VALUES
('NV02', N'Trần Minh', N'An', N'Nam', '2018-05-20', N'Con trai'),
('NV03', N'Phạm Văn', N'Hùng', N'Nam', '1993-02-14', N'Chồng');



SELECT *
FROM NhanVien;

select MsNV, HoLot, Ten, NgaySinh
from NhanVien
where NgaySinh > '1975-04-20' and Luong > 12000000;

SELECT MsNV, HoLot, Ten, Luong, NV.MsDV
FROM NhanVien NV, DonVi DV
WHERE NV.MsDV = DV.MsDV
    and TenDV = 'DV01'
SELECT MsNV, HoLot, Ten
FROM NhanVien
WHERE GioiTinh = 'Nam' and MsDV = 5;