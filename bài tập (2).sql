-- Bài 10

-- Tạo CSDL
DROP DATABASE IF EXISTS QuanLyDaoTao;
CREATE DATABASE QuanLyDaoTao;

USE QuanLyDaoTao;


-- Tạo bảng Khoa
CREATE TABLE Khoa (
    MaKhoa VARCHAR(10) PRIMARY KEY,
    TenKhoa VARCHAR(100) NOT NULL,

    CONSTRAINT Unique_Khoa_Ten
        UNIQUE (TenKhoa)
);


-- Tạo bảng Lop
CREATE TABLE Lop (
    MaLop VARCHAR(10) PRIMARY KEY,
    TenLop VARCHAR(100) NOT NULL,
    MaKhoa VARCHAR(10) NOT NULL,

    CONSTRAINT ForeignKey_Lop_Khoa
        FOREIGN KEY (MaKhoa)
        REFERENCES Khoa(MaKhoa)
);


-- Tạo bảng SinhVien
CREATE TABLE SinhVien (
    MaSV VARCHAR(10) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL,
    Email VARCHAR(100) NOT NULL,
    MaLop VARCHAR(10) NOT NULL,

    CONSTRAINT Unique_SinhVien_Email
        UNIQUE (Email),

    CONSTRAINT ForeignKey_SinhVien_Lop
        FOREIGN KEY (MaLop)
        REFERENCES Lop(MaLop)
);


-- Tạo bảng MonHoc
CREATE TABLE MonHoc (
    MaMH VARCHAR(10) PRIMARY KEY,
    TenMH VARCHAR(100) NOT NULL,
    SoTinChi INT NOT NULL,

    CONSTRAINT Unique_MonHoc_Ten
        UNIQUE (TenMH),

    CONSTRAINT Check_MonHoc_SoTinChi
        CHECK (SoTinChi > 0)
);


-- Tạo bảng DangKy
CREATE TABLE DangKy (
    MaSV VARCHAR(10) NOT NULL,
    MaMH VARCHAR(10) NOT NULL,
    HocKy VARCHAR(20) NOT NULL,
    NamHoc VARCHAR(20) NOT NULL,

    CONSTRAINT PrimaryKey_DangKy
        PRIMARY KEY (MaSV, MaMH, HocKy, NamHoc),

    CONSTRAINT ForeignKey_DangKy_SinhVien
        FOREIGN KEY (MaSV)
        REFERENCES SinhVien(MaSV),

    CONSTRAINT ForeignKey_DangKy_MonHoc
        FOREIGN KEY (MaMH)
        REFERENCES MonHoc(MaMH),

    CONSTRAINT Check_DangKy_HocKy
        CHECK (HocKy IN ('Hoc ky 1', 'Hoc ky 2', 'Hoc ky he'))
);


-- Kiểm tra cấu trúc toàn bộ các bảng
DESCRIBE Khoa;
DESCRIBE Lop;
DESCRIBE SinhVien;
DESCRIBE MonHoc;
DESCRIBE DangKy;


-- Thay đổi cấu trúc bảng SinhVien
ALTER TABLE SinhVien
ADD COLUMN SoDienThoai VARCHAR(15);

DESCRIBE SinhVien;