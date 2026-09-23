-- XÓA CSDL CŨ ĐỂ CHẠY LẠI TỪ ĐẦU
DROP DATABASE IF EXISTS QuanLySinhVien;

-- BÀI 1
CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;

SHOW DATABASES;


-- BÀI 2
CREATE TABLE Khoa (
    MaKhoa VARCHAR(10) PRIMARY KEY,
    TenKhoa VARCHAR(100) NOT NULL,
    DienThoai VARCHAR(15)
);

DESCRIBE Khoa;


-- BÀI 3
CREATE TABLE Lop (
    MaLop VARCHAR(10) PRIMARY KEY,
    TenLop VARCHAR(100) NOT NULL,
    MaKhoa VARCHAR(10) NOT NULL,

    CONSTRAINT Foreignkey_Lop_Khoa
        FOREIGN KEY (MaKhoa)
        REFERENCES Khoa(MaKhoa)
);

DESCRIBE Lop;


-- BÀI 4
CREATE TABLE SinhVien (
    MaSV VARCHAR(10) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh VARCHAR(10) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    MaLop VARCHAR(10) NOT NULL,

    CONSTRAINT Unique_quality_SinhVien_Email
        UNIQUE (Email),

    CONSTRAINT Check_SinhVien_GioiTinh
        CHECK (GioiTinh IN ('Nam', 'Nu')),

    CONSTRAINT Foreignkey_SinhVien_Lop
        FOREIGN KEY (MaLop)
        REFERENCES Lop(MaLop)
);

DESCRIBE SinhVien;


-- BÀI 5
CREATE TABLE MonHoc (
    MaMH VARCHAR(10) CONSTRAINT Primarykey_MonHoc PRIMARY KEY,
    TenMH VARCHAR(100) NOT NULL,
    SoTinChi INT NOT NULL,
    SoTiet INT NOT NULL,

    CONSTRAINT Unique_MonHoc_Ten
        UNIQUE (TenMH),

    CONSTRAINT Check_MonHoc_SoTinChi
        CHECK (SoTinChi > 0),

    CONSTRAINT Check_MonHoc_SoTiet
        CHECK (SoTiet > 0)
);

DESCRIBE MonHoc;


-- BÀI 6
ALTER TABLE SinhVien
ADD COLUMN SoDienThoai VARCHAR(15);

ALTER TABLE SinhVien
ADD COLUMN DiaChi VARCHAR(200);

ALTER TABLE SinhVien
MODIFY COLUMN HoTen VARCHAR(150);

ALTER TABLE SinhVien
RENAME COLUMN SoDienThoai TO DienThoai;

DESCRIBE SinhVien;


-- BÀI 7
CREATE TABLE MonHoc_ThuNghiem (
    MaMH VARCHAR(10) PRIMARY KEY,
    TenMH VARCHAR(100) NOT NULL,
    SoTinChi INT NOT NULL,
    SoTiet INT NOT NULL
);

ALTER TABLE MonHoc_ThuNghiem
ADD CONSTRAINT CK_MonHocTN_SoTinChi
CHECK (SoTinChi > 0);

ALTER TABLE MonHoc_ThuNghiem
ADD CONSTRAINT CK_MonHocTN_SoTiet
CHECK (SoTiet > 0);

ALTER TABLE MonHoc_ThuNghiem
ADD CONSTRAINT UQ_MonHocTN_Ten
UNIQUE (TenMH);

DESCRIBE MonHoc_ThuNghiem;


-- BÀI 8
CREATE TABLE PhongHoc (
    MaPhong VARCHAR(10) PRIMARY KEY,
    TenPhong VARCHAR(100) NOT NULL,
    SoCho INT NOT NULL,
    LoaiPhong VARCHAR(30) NOT NULL,

    CONSTRAINT CK_PhongHoc_SoCho
        CHECK (SoCho > 0),

    CONSTRAINT CK_PhongHoc_LoaiPhong
        CHECK (LoaiPhong IN ('LyThuyet', 'MayTinh', 'PhongThi'))
);

DESCRIBE PhongHoc;


-- BÀI 9
CREATE TABLE TestSinhVien (
    MaSV VARCHAR(10),
    HoTen VARCHAR(100)
);

INSERT INTO TestSinhVien
VALUES
    ('SV01', 'Nguyen Van A'),
    ('SV02', 'Tran Thi B');

SELECT * FROM TestSinhVien;

TRUNCATE TABLE TestSinhVien;

SELECT * FROM TestSinhVien;

DESCRIBE TestSinhVien;

DROP TABLE TestSinhVien;

SHOW TABLES;