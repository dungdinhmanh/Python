CREATE DATABASE QL_SV;
SELECT QL_SV;
CREATE TABLE tblKhoa
(makhoa char(5) NOT NULL,
tenkhoa nvarchar(30) NOT NULL,
dienthoai int,
primary key (makhoa));