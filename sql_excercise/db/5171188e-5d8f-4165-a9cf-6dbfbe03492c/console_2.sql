CREATE TABLE tblKhoa
(makhoa char(5) NOT NULL,
tenkhoa nvarchar(30) NOT NULL,
dienthoai int,
primary key (makhoa));

CREATE TABLE tblSinhVien
(mssv INT NOT NULL,
hoten nvarchar(30) not null,
makhoa char(5) not null,
ns int,
que char(30),
primary key (mssv),
foreign key (makhoa) references tblKhoa);

INSERT into tblKhoa
VALUES ( 'K1', 'Cong nghe thong tin', 855413),
       ('K2', 'Kinh te chinh tri', 9887546),
       ('K3', 'An toan thong tin', 5873653),
       ('K4', 'Co khi', 847395);

INSERT into tblSinhVien VALUES
(1, 'Nguyễn Văn An', 'K1', 1995, 'Hà Nội '),
(2, 'Hoàng Thị Xuân', 'K2', 1994, 'HCM'),
(3, 'Hoàng Văn Hùng', 'K3', 1995, 'Hà Nội'),
(4, 'Nguyễn Văn Linh', 'K4', 1995, 'Phú Thọ'),
(5, 'Nguyễn Thị Thu', 'K5', 1995, 'HCM');

select hoten,que
from tblSinhVien;

select mssv,hoten
from tblSinhVien
where ns=1994;

select mssv, hoten
from tblSinhVien
where que = 'HCM' and ns = 1995;

select hoten, que
from tblSinhVien
where ns=1994 and ns=1992;

select * from tblSinhVien where que <> 'Nghe An';
select dienthoai from tblKhoa where tenkhoa = 'CNTT';
select * from tblSinhVien where que = 'Nghệ An' and que = 'Thanh Hoá';
select * from tblSinhVien where ns=1990 and que = 'Hà Tĩnh';

