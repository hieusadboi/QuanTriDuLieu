use doanbackup;
CREATE TABLE Lop (
  l_maLop VARCHAR(10) NOT NULL,
  l_tenLop VARCHAR(45) NULL,
  l_nienKhoa VARCHAR(45) NULL,
  PRIMARY KEY (l_maLop)
);

CREATE TABLE GiaoVien (
    gv_maGV VARCHAR(10) PRIMARY KEY,
    gv_hoTen VARCHAR(50),
    gv_ngaySinh DATE,
    gv_diaChi VARCHAR(100),
    gv_sdt VARCHAR(15)
);

CREATE TABLE HocSinh (
    hs_maHS VARCHAR(10) PRIMARY KEY,
    hs_hoTen VARCHAR(50),
    hs_ngaySinh DATE,
    hs_diaChi VARCHAR(100),
    hs_sdtPhuHuynh VARCHAR(15),
    l_maLop VARCHAR(10),
    FOREIGN KEY (l_maLop) REFERENCES Lop(l_maLop)
);

CREATE TABLE ChuNhiem (
    gv_maGV VARCHAR(10),
    l_maLop VARCHAR(10),
    cn_namHoc VARCHAR(10),
    PRIMARY KEY (gv_maGV, l_maLop),
    FOREIGN KEY (gv_maGV) REFERENCES GiaoVien(gv_maGV),
    FOREIGN KEY (l_maLop) REFERENCES Lop(l_maLop)
);

CREATE TABLE PhongHoc (
    p_maPhong VARCHAR(10) PRIMARY KEY,
    p_soPhong INT,
    p_soChoToiDa INT
);

CREATE TABLE PhongLop (
    pl_maPhong VARCHAR(10),
    l_maLop VARCHAR(10),
    pl_hocKyNamHoc VARCHAR(20),
    PRIMARY KEY (pl_maPhong, l_maLop, pl_hocKyNamHoc),
    FOREIGN KEY (pl_maPhong) REFERENCES PhongHoc(p_maPhong),
    FOREIGN KEY (l_maLop) REFERENCES Lop(l_maLop)
);

CREATE TABLE MonHoc (
    mh_maMonHoc VARCHAR(10) PRIMARY KEY,
    mh_tenMonHoc VARCHAR(50),
    mh_khoi INT
);

-- Bảng Diem
CREATE TABLE Diem (
    hs_maHS VARCHAR(10),
    mh_maMonHoc VARCHAR(10),
    d_diemMieng FLOAT,
    d_diem15Phut FLOAT,
    d_diem1Tiet FLOAT,
    d_diemThi FLOAT,
    PRIMARY KEY (hs_maHS, mh_maMonHoc),
    FOREIGN KEY (hs_maHS) REFERENCES HocSinh(hs_maHS),
    FOREIGN KEY (mh_maMonHoc) REFERENCES MonHoc(mh_maMonHoc)
);


-- Insert sample data into Lop table
INSERT INTO Lop (l_maLop, l_tenLop, l_nienKhoa)
VALUES 
('10A1_2024', 'Lớp 10A1', '2023-2024'),
('10A2_2024', 'Lớp 10A2', '2023-2024'),
('11A1_2024', 'Lớp 11A1', '2023-2024'),
('11A2_2024', 'Lớp 11A2', '2023-2024'),
('12A1_2024', 'Lớp 12A1', '2023-2024'),
('12A2_2024', 'Lớp 12A2', '2023-2024'),
('12A3_2024', 'Lớp 12A3', '2023-2024'),
('12A4_2024', 'Lớp 12A4', '2023-2024'),
('12A5_2024', 'Lớp 12A5', '2023-2024'),
('12A6_2024', 'Lớp 12A6', '2023-2024');

-- Insert sample data into GiaoVien table
INSERT INTO GiaoVien (gv_maGV, gv_hoTen, gv_ngaySinh, gv_diaChi, gv_sdt)
VALUES 
('GV001', 'Nguyễn Văn A', '1980-05-10', 'Hà Nội', '0912345678'),
('GV002', 'Trần Thị B', '1985-03-20', 'Hà Nội', '0923456789'),
('GV003', 'Phạm Văn C', '1982-07-15', 'Hà Nội', '0934567890'),
('GV004', 'Lê Thị D', '1990-11-22', 'Hà Nội', '0945678901'),
('GV005', 'Ngô Văn E', '1975-09-10', 'Hà Nội', '0956789012'),
('GV006', 'Vũ Thị F', '1988-12-05', 'Hà Nội', '0967890123'),
('GV007', 'Bùi Văn G', '1983-01-15', 'Hà Nội', '0978901234'),
('GV008', 'Đỗ Thị H', '1979-02-25', 'Hà Nội', '0989012345'),
('GV009', 'Hoàng Văn I', '1981-06-17', 'Hà Nội', '0990123456'),
('GV010', 'Đinh Thị J', '1986-04-14', 'Hà Nội', '0901234567');

-- Insert sample data into HocSinh table
INSERT INTO HocSinh (hs_maHS, hs_hoTen, hs_ngaySinh, hs_diaChi, hs_sdtPhuHuynh, l_maLop)
VALUES 
('HS001', 'Nguyễn Công Minh', '2004-10-23', 'Vĩnh Long', '0901098432', '12A3_2024'),
('HS002', 'Lê Phức Hưng', '2004-04-30', 'Vĩnh Long', '0938903934', '12A3_2024'),
('HS003', 'Nguyễn Trọng Nguyên', '2004-12-13', 'Vĩnh Long', '0934123623', '12A3_2024'),
('HS004', 'Nguyễn Thị Minh Thư', '2004-11-20', 'Vĩnh Long', '0902345212', '12A3_2024'),
('HS005', 'Nguyễn Chánh Hào', '2004-12-08', 'Vĩnh Long', '0901014234', '12A3_2024'),
('HS006', 'Trần Chí Hiếu', '2004-01-05', 'Vĩnh Long', '0901036971', '12A3_2024'),
('HS007', 'Phạm Văn Khánh', '2005-02-12', 'Vĩnh Long', '0901123344', '12A2_2024'),
('HS008', 'Trần Thị Lan', '2005-03-08', 'Vĩnh Long', '0901145566', '12A2_2024'),
('HS009', 'Đặng Công Khoa', '2005-05-20', 'Vĩnh Long', '0901178899', '12A2_2024'),
('HS010', 'Phan Quang Dũng', '2005-06-25', 'Vĩnh Long', '0901199900', '12A2_2024');

-- Insert sample data into ChuNhiem table
INSERT INTO ChuNhiem (gv_maGV, l_maLop, cn_namHoc)
VALUES 
('GV001', '12A3_2024', '2023-2024'),
('GV002', '12A2_2024', '2023-2024'),
('GV003', '11A1_2024', '2023-2024'),
('GV004', '11A2_2024', '2023-2024'),
('GV005', '10A1_2024', '2023-2024'),
('GV006', '10A2_2024', '2023-2024'),
('GV007', '12A1_2024', '2023-2024'),
('GV008', '12A4_2024', '2023-2024'),
('GV009', '12A5_2024', '2023-2024'),
('GV010', '12A6_2024', '2023-2024');

-- Insert sample data into PhongHoc table
INSERT INTO PhongHoc (p_maPhong, p_soPhong, p_soChoToiDa)
VALUES 
('P101', 101, 40),
('P102', 102, 40),
('P103', 103, 40),
('P104', 104, 40),
('P105', 105, 40),
('P201', 201, 40),
('P202', 202, 40),
('P203', 203, 40),
('P204', 204, 40),
('P205', 205, 0);

-- Insert sample data into PhongLop table
INSERT INTO PhongLop (pl_maPhong, l_maLop, pl_hocKyNamHoc)
VALUES 
('P101', '12A3_2024', 'HK1_2023-2024'),
('P102', '12A2_2024', 'HK1_2023-2024'),
('P103', '11A1_2024', 'HK1_2023-2024'),
('P104', '11A2_2024', 'HK1_2023-2024'),
('P105', '10A1_2024', 'HK1_2023-2024'),
('P201', '10A2_2024', 'HK1_2023-2024'),
('P202', '12A1_2024', 'HK2_2023-2024'),
('P203', '12A4_2024', 'HK2_2023-2024'),
('P204', '12A5_2024', 'HK2_2023-2024'),
('P205', '12A6_2024', 'HK2_2023-2024');

-- Insert sample data into MonHoc table
INSERT INTO MonHoc (mh_maMonHoc, mh_tenMonHoc, mh_khoi)
VALUES 
('MH001', 'Toán', 10),
('MH002', 'Văn', 10),
('MH003', 'Lý', 10),
('MH004', 'Hóa', 11),
('MH005', 'Sinh', 11),
('MH006', 'Sử', 11),
('MH007', 'Địa', 12),
('MH008', 'Tiếng Anh', 12),
('MH009', 'GDCD', 12),
('MH010', 'Tin học', 12);

-- Insert sample data into Diem table
INSERT INTO Diem (hs_maHS, mh_maMonHoc, d_diemMieng, d_diem15Phut, d_diem1Tiet, d_diemThi)
VALUES 
('HS001', 'MH001', 8.0, 7.5, 8.0, 8.5),
('HS002', 'MH002', 6.5, 6.0, 7.0, 7.5),
('HS003', 'MH003', 7.0, 7.0, 7.5, 8.0),
('HS004', 'MH004', 8.5, 8.0, 8.5, 9.0),
('HS005', 'MH005', 9.0, 8.5, 9.0, 9.5),
('HS006', 'MH006', 6.0, 6.0, 6.5, 7.0),
('HS007', 'MH007', 8.0, 7.5, 8.0, 8.5),
('HS008', 'MH008', 9.0, 9.5, 9.0, 9.5),
('HS009', 'MH009', 7.5, 7.0, 8.0, 8.5),
('HS010', 'MH010', 8.5, 8.0, 8.5, 9.0);

-- các hàm thêm sửa xóa và in bảng 

-- Thêm lớp
DELIMITER //
CREATE PROCEDURE AddLop(
    IN p_maLop VARCHAR(10),
    IN p_tenLop VARCHAR(45),
    IN p_nienKhoa VARCHAR(45)
)
BEGIN
    INSERT INTO Lop (l_maLop, l_tenLop, l_nienKhoa) VALUES (p_maLop, p_tenLop, p_nienKhoa);
END //
DELIMITER ;

-- Sửa lớp
DELIMITER //
CREATE PROCEDURE UpdateLop(
    IN p_maLop VARCHAR(10),
    IN p_tenLop VARCHAR(45),
    IN p_nienKhoa VARCHAR(45)
)
BEGIN
    UPDATE Lop SET l_tenLop = p_tenLop, l_nienKhoa = p_nienKhoa WHERE l_maLop = p_maLop;
END //
DELIMITER ;

-- Xóa lớp
DELIMITER //
CREATE PROCEDURE DeleteLop(IN p_maLop VARCHAR(10))
BEGIN
    DELETE FROM Lop WHERE l_maLop = p_maLop;
END //
DELIMITER ;

-- In lớp
DELIMITER //
CREATE PROCEDURE PrintLop()
BEGIN
    SELECT * FROM Lop;
END //
DELIMITER ;

-- Thêm giáo viên
DELIMITER //
CREATE PROCEDURE AddGiaoVien(
    IN p_maGV VARCHAR(10),
    IN p_hoTen VARCHAR(50),
    IN p_ngaySinh DATE,
    IN p_diaChi VARCHAR(100),
    IN p_sdt VARCHAR(15)
)
BEGIN
    INSERT INTO GiaoVien (gv_maGV, gv_hoTen, gv_ngaySinh, gv_diaChi, gv_sdt) VALUES (p_maGV, p_hoTen, p_ngaySinh, p_diaChi, p_sdt);
END //
DELIMITER ;

-- Sửa giáo viên
DELIMITER //
CREATE PROCEDURE UpdateGiaoVien(
    IN p_maGV VARCHAR(10),
    IN p_hoTen VARCHAR(50),
    IN p_ngaySinh DATE,
    IN p_diaChi VARCHAR(100),
    IN p_sdt VARCHAR(15)
)
BEGIN
    UPDATE GiaoVien SET gv_hoTen = p_hoTen, gv_ngaySinh = p_ngaySinh, gv_diaChi = p_diaChi, gv_sdt = p_sdt WHERE gv_maGV = p_maGV;
END //
DELIMITER ;

-- Xóa giáo viên
DELIMITER //
CREATE PROCEDURE DeleteGiaoVien(IN p_maGV VARCHAR(10))
BEGIN
    DELETE FROM GiaoVien WHERE gv_maGV = p_maGV;
END //
DELIMITER ;

-- In giáo viên
DELIMITER //
CREATE PROCEDURE PrintGiaoVien()
BEGIN
    SELECT * FROM GiaoVien;
END //
DELIMITER ;

-- Thêm học sinh
DELIMITER //
CREATE PROCEDURE AddHocSinh(
    IN p_maHS VARCHAR(10),
    IN p_hoTen VARCHAR(50),
    IN p_ngaySinh DATE,
    IN p_diaChi VARCHAR(100),
    IN p_sdtPhuHuynh VARCHAR(15),
    IN p_maLop VARCHAR(10)
)
BEGIN
    INSERT INTO HocSinh (hs_maHS, hs_hoTen, hs_ngaySinh, hs_diaChi, hs_sdtPhuHuynh, l_maLop) VALUES (p_maHS, p_hoTen, p_ngaySinh, p_diaChi, p_sdtPhuHuynh, p_maLop);
END //
DELIMITER ;

-- Sửa học sinh
DELIMITER //
CREATE PROCEDURE UpdateHocSinh(
    IN p_maHS VARCHAR(10),
    IN p_hoTen VARCHAR(50),
    IN p_ngaySinh DATE,
    IN p_diaChi VARCHAR(100),
    IN p_sdtPhuHuynh VARCHAR(15),
    IN p_maLop VARCHAR(10)
)
BEGIN
    UPDATE HocSinh SET hs_hoTen = p_hoTen, hs_ngaySinh = p_ngaySinh, hs_diaChi = p_diaChi, hs_sdtPhuHuynh = p_sdtPhuHuynh, l_maLop = p_maLop WHERE hs_maHS = p_maHS;
END //
DELIMITER ;

-- Xóa học sinh
DELIMITER //
CREATE PROCEDURE DeleteHocSinh(IN p_maHS VARCHAR(10))
BEGIN
    DELETE FROM HocSinh WHERE hs_maHS = p_maHS;
END //
DELIMITER ;

-- In học sinh
DELIMITER //
CREATE PROCEDURE PrintHocSinh()
BEGIN
    SELECT * FROM HocSinh;
END //
DELIMITER ;

-- Thêm chủ nhiệm
DELIMITER //
CREATE PROCEDURE AddChuNhiem(
    IN p_maGV VARCHAR(10),
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    INSERT INTO ChuNhiem (gv_maGV, l_maLop, cn_namHoc) VALUES (p_maGV, p_maLop, p_namHoc);
END //
DELIMITER ;

-- Xóa chủ nhiệm
DELIMITER //
CREATE PROCEDURE DeleteChuNhiem(IN p_maGV VARCHAR(10), IN p_maLop VARCHAR(10))
BEGIN
    DELETE FROM ChuNhiem WHERE gv_maGV = p_maGV AND l_maLop = p_maLop;
END //
DELIMITER ;

-- Cập nhật chủ nhiệm
DELIMITER //
CREATE PROCEDURE UpdateChuNhiem(
    IN p_maGV VARCHAR(10),
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    UPDATE ChuNhiem SET cn_namHoc = p_namHoc WHERE gv_maGV = p_maGV AND l_maLop = p_maLop;
END //
DELIMITER ;

-- In chủ nhiệm
DELIMITER //
CREATE PROCEDURE PrintChuNhiem()
BEGIN
    SELECT * FROM ChuNhiem;
END //
DELIMITER ;

-- Thêm phòng học
DELIMITER //
CREATE PROCEDURE AddPhongHoc(
    IN p_maPhong VARCHAR(10),
    IN p_soPhong INT,
    IN p_soChoToiDa INT
)
BEGIN
    INSERT INTO PhongHoc (p_maPhong, p_soPhong, p_soChoToiDa) VALUES (p_maPhong, p_soPhong, p_soChoToiDa);
END //
DELIMITER ;

-- Sửa phòng học
DELIMITER //
CREATE PROCEDURE UpdatePhongHoc(
    IN p_maPhong VARCHAR(10),
    IN p_soPhong INT,
    IN p_soChoToiDa INT
)
BEGIN
    UPDATE PhongHoc SET p_soPhong = p_soPhong, p_soChoToiDa = p_soChoToiDa WHERE p_maPhong = p_maPhong;
END //
DELIMITER ;

-- Xóa phòng học
DELIMITER //
CREATE PROCEDURE DeletePhongHoc(IN p_maPhong VARCHAR(10))
BEGIN
    DELETE FROM PhongHoc WHERE p_maPhong = p_maPhong;
END //
DELIMITER ;

-- In phòng học
DELIMITER //
CREATE PROCEDURE PrintPhongHoc()
BEGIN
    SELECT * FROM PhongHoc;
END //
DELIMITER ;

-- Thêm môn học
DELIMITER //
CREATE PROCEDURE AddMonHoc(
    IN p_maMonHoc VARCHAR(10),
    IN p_tenMonHoc VARCHAR(50),
    IN p_khoi INT
)
BEGIN
    INSERT INTO MonHoc (mh_maMonHoc, mh_tenMonHoc, mh_khoi) VALUES (p_maMonHoc, p_tenMonHoc, p_khoi);
END //
DELIMITER ;

-- Xóa môn học
DELIMITER //
CREATE PROCEDURE DeleteMonHoc(IN p_maMonHoc VARCHAR(10))
BEGIN
    DELETE FROM MonHoc WHERE mh_maMonHoc = p_maMonHoc;
END //
DELIMITER ;

-- Cập nhật môn học
DELIMITER //
CREATE PROCEDURE UpdateMonHoc(
    IN p_maMonHoc VARCHAR(10),
    IN p_tenMonHoc VARCHAR(50),
    IN p_khoi INT
)
BEGIN
    UPDATE MonHoc SET mh_tenMonHoc = p_tenMonHoc, mh_khoi = p_khoi WHERE mh_maMonHoc = p_maMonHoc;
END //
DELIMITER ;

-- In môn học
DELIMITER //
CREATE PROCEDURE PrintMonHoc()
BEGIN
    SELECT * FROM MonHoc;
END //
DELIMITER ;

-- Thêm điểm
DELIMITER //
CREATE PROCEDURE AddDiem(
    IN p_maHS VARCHAR(10),
    IN p_maMonHoc VARCHAR(10),
    IN p_diemMieng FLOAT,
    IN p_diem15Phut FLOAT,
    IN p_diem1Tiet FLOAT,
    IN p_diemThi FLOAT
)
BEGIN
    INSERT INTO Diem (hs_maHS, mh_maMonHoc, d_diemMieng, d_diem15Phut, d_diem1Tiet, d_diemThi) VALUES (p_maHS, p_maMonHoc, p_diemMieng, p_diem15Phut, p_diem1Tiet, p_diemThi);
END //
DELIMITER ;

-- Sửa điểm
DELIMITER //
CREATE PROCEDURE UpdateDiem(
    IN p_maHS VARCHAR(10),
    IN p_maMonHoc VARCHAR(10),
    IN p_diemMieng FLOAT,
    IN p_diem15Phut FLOAT,
    IN p_diem1Tiet FLOAT,
    IN p_diemThi FLOAT
)
BEGIN
    UPDATE Diem SET d_diemMieng = p_diemMieng, d_diem15Phut = p_diem15Phut, d_diem1Tiet = p_diem1Tiet, d_diemThi = p_diemThi WHERE hs_maHS = p_maHS AND mh_maMonHoc = p_maMonHoc;
END //
DELIMITER ;

-- Xóa điểm
DELIMITER //
CREATE PROCEDURE DeleteDiem(IN p_maHS VARCHAR(10), IN p_maMonHoc VARCHAR(10))
BEGIN
    DELETE FROM Diem WHERE hs_maHS = p_maHS AND mh_maMonHoc = p_maMonHoc;
END //
DELIMITER ;

-- In điểm
DELIMITER //
CREATE PROCEDURE PrintDiem()
BEGIN
    SELECT * FROM Diem;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AddPhongLop(
    IN p_maPhongLop VARCHAR(10),
    IN p_maPhong VARCHAR(10),
    IN p_maLop VARCHAR(10)
)
BEGIN
    INSERT INTO PhongLop (pl_maPhongLop, p_maPhong, l_maLop) VALUES (p_maPhongLop, p_maPhong, p_maLop);
END //
DELIMITER ;

-- Sửa phòng lớp
DELIMITER //
CREATE PROCEDURE UpdatePhongLop(
    IN p_maPhongLop VARCHAR(10),
    IN p_maPhong VARCHAR(10),
    IN p_maLop VARCHAR(10)
)
BEGIN
    UPDATE PhongLop SET p_maPhong = p_maPhong, l_maLop = p_maLop WHERE pl_maPhongLop = p_maPhongLop;
END //
DELIMITER ;

-- Xóa phòng lớp
DELIMITER //
CREATE PROCEDURE DeletePhongLop(IN p_maPhongLop VARCHAR(10))
BEGIN
    DELETE FROM PhongLop WHERE pl_maPhongLop = p_maPhongLop;
END //
DELIMITER ;

-- In phòng lớp
DELIMITER //
CREATE PROCEDURE PrintPhongLop()
BEGIN
    SELECT * FROM PhongLop;
END //
DELIMITER ;


-- tìm danh sách lớp từ mã lớp 
DELIMITER //

CREATE PROCEDURE TimDSHS_TheoMaLop(IN maLop VARCHAR(10))
BEGIN
    -- Kiểm tra xem mã lớp có tồn tại trong bảng HocSinh hay không
    IF EXISTS (SELECT 1 FROM HocSinh WHERE l_maLop = maLop) THEN
        -- Nếu có mã lớp, trả về danh sách học sinh
        SELECT hs_maHS, hs_hoTen, hs_ngaySinh, hs_diaChi, hs_sdtPhuHuynh
        FROM HocSinh
        WHERE l_maLop = maLop;
    ELSE
        -- Nếu không có mã lớp, trả về thông báo
        SELECT 'Không có mã lớp này' AS ThongBao;
    END IF;
END //

DELIMITER ;

-- hs 
DELIMITER //

CREATE PROCEDURE TimHS_TheoMaHS(IN maHS VARCHAR(10))
BEGIN
    -- Kiểm tra xem mã học sinh có tồn tại trong bảng HocSinh hay không
    IF EXISTS (SELECT 1 FROM HocSinh WHERE hs_maHS = maHS) THEN
        -- Nếu có mã học sinh, trả về thông tin học sinh
        SELECT hs_maHS, hs_hoTen, hs_ngaySinh, hs_diaChi, hs_sdtPhuHuynh, l_maLop
        FROM HocSinh
        WHERE hs_maHS = maHS;
    ELSE
        -- Nếu không có mã học sinh, trả về thông báo
        SELECT 'Không có học sinh này' AS ThongBao;
    END IF;
END //

DELIMITER ;

-- hàm tính điểm trung bình của một môn
DELIMITER //

CREATE FUNCTION tinhDiemTrungBinh(
    diemMieng FLOAT,
    diem15Phut FLOAT,
    diem1Tiet FLOAT,
    diemThi FLOAT
) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE diemTrungBinh FLOAT;
    SET diemTrungBinh = (diemMieng + diem15Phut + diem1Tiet + diemThi) / 4;
    RETURN diemTrungBinh;
END //

DELIMITER ;

-- inDiemTrungBinhTheoNamHoc
DELIMITER //

CREATE PROCEDURE inDiemTrungBinhTheoNamHoc(
    IN p_hs_maHS VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    SELECT mh.mh_tenMonHoc AS MonHoc, 
           tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi) AS DiemTrungBinh
    FROM Diem d
    JOIN MonHoc mh ON d.mh_maMonHoc = mh.mh_maMonHoc
    JOIN HocSinh hs ON d.hs_maHS = hs.hs_maHS
    JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
    WHERE d.hs_maHS = p_hs_maHS
      AND cn.cn_namHoc = p_namHoc;
END //

DELIMITER ;

--

DELIMITER //

CREATE PROCEDURE tinhDiemTrungBinhCaNam(
    IN p_hs_maHS VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    DECLARE tongDiem FLOAT DEFAULT 0;
    DECLARE soMonHoc INT DEFAULT 0;
    DECLARE diemTrungBinhNamHoc FLOAT;

    -- Calculate total score and count of subjects
    SELECT SUM(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)), 
           COUNT(*)
    INTO tongDiem, soMonHoc
    FROM Diem d
    JOIN MonHoc mh ON d.mh_maMonHoc = mh.mh_maMonHoc
    JOIN HocSinh hs ON d.hs_maHS = hs.hs_maHS
    JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
    WHERE d.hs_maHS = p_hs_maHS
      AND cn.cn_namHoc = p_namHoc;

    -- Calculate average score for the year
    SET diemTrungBinhNamHoc = IF(soMonHoc > 0, tongDiem / soMonHoc, NULL);

    -- Display the result
    SELECT p_hs_maHS AS MaHocSinh, p_namHoc AS NamHoc, diemTrungBinhNamHoc AS DiemTrungBinhCaNam;
END //

DELIMITER ;

-- 
DELIMITER //

CREATE PROCEDURE inDanhSachXepLoaiCaNam(
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    DECLARE diemTrungBinhNamHoc FLOAT;
    
    -- Select list of students with their average score and classification
    SELECT hs.hs_maHS AS MaHocSinh,
           hs.hs_hoTen AS HoTen,
           ROUND(AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)), 2) AS DiemTrungBinhCaNam,
           CASE
               WHEN AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) >= 9 THEN 'Xuẩt Sắc'
                WHEN AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) >= 8 THEN 'Giỏi'
                WHEN AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) >= 6.5 THEN 'Khá'
                WHEN AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) >= 5 THEN 'Trung Bình'
                ELSE 'Yếu'
           END AS XepLoai
    FROM Diem d
    JOIN HocSinh hs ON d.hs_maHS = hs.hs_maHS
    JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
    WHERE hs.l_maLop = p_maLop
      AND cn.cn_namHoc = p_namHoc
    GROUP BY hs.hs_maHS;
END //

DELIMITER ;

-- hàm in tỷ lệ xếp loại
DELIMITER //

CREATE PROCEDURE thongKeTyLeXepLoai(
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    DECLARE totalStudents INT;

    -- Get the total number of students in the class and year
    SELECT COUNT(*) INTO totalStudents
    FROM HocSinh hs
    JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
    WHERE hs.l_maLop = p_maLop
      AND cn.cn_namHoc = p_namHoc;

    -- Calculate and display the percentage of students in each category
    SELECT XepLoai,
           COUNT(*) AS SoLuong,
           ROUND(COUNT(*) * 100 / totalStudents, 2) AS TyLePhanTram
    FROM (
        SELECT 
            CASE
                WHEN AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) >= 9 THEN 'Xuẩt Sắc'
                WHEN AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) >= 8 THEN 'Giỏi'
                WHEN AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) >= 6.5 THEN 'Khá'
                WHEN AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) >= 5 THEN 'Trung Bình'
                ELSE 'Yếu'
            END AS XepLoai
        FROM Diem d
        JOIN HocSinh hs ON d.hs_maHS = hs.hs_maHS
        JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
        WHERE hs.l_maLop = p_maLop
          AND cn.cn_namHoc = p_namHoc
        GROUP BY hs.hs_maHS
    ) AS XepLoaiTable
    GROUP BY XepLoai;
END //

DELIMITER ;



CALL thongKeTyLeXepLoai('12A2_2024', '2023-2024');


-- tìm mã lớp thông qua mã học sinh và năm học
DELIMITER //

CREATE PROCEDURE TimMaLopTheoMaHS(
    IN p_hs_maHS VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    DECLARE l_maLop VARCHAR(10);
    
    -- Select the class code based on student code and academic year
    SELECT hs.l_maLop
    INTO l_maLop
    FROM HocSinh hs
    JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
    WHERE hs.hs_maHS = p_hs_maHS AND cn.cn_namHoc = p_namHoc;

    -- Display the result
    SELECT l_maLop AS MaLop;
END //

DELIMITER ;

-- Tạo trigger khi thêm 1 học sinh mới vào lớp nhưng mà lớp đầy
DELIMITER //

CREATE TRIGGER preventStudentAdditionWhenRoomFull
BEFORE INSERT ON HocSinh
FOR EACH ROW
BEGIN
    DECLARE currentStudentCount INT;
    DECLARE roomCapacity INT;

    -- Get the current count of students in the class
    SELECT COUNT(*) INTO currentStudentCount
    FROM HocSinh
    WHERE l_maLop = NEW.l_maLop;

    -- Get the room capacity for the class
    SELECT p.p_soChoToiDa INTO roomCapacity
    FROM PhongLop pl
    JOIN PhongHoc p ON pl.pl_maPhong = p.p_maPhong
    WHERE pl.l_maLop = NEW.l_maLop;

    -- Check if the current number of students exceeds the room capacity
    IF currentStudentCount >= roomCapacity THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot add student: class room is full.';
    END IF;
END //

DELIMITER ;


-- triger thêm học sinh mà thiếu trường giá trị

DELIMITER //

CREATE TRIGGER preventIncompleteStudentInsertion
BEFORE INSERT ON HocSinh
FOR EACH ROW
BEGIN
    -- Check for NULL values in required fields
    IF NEW.hs_maHS IS NULL OR
       NEW.hs_hoTen IS NULL OR
       NEW.hs_ngaySinh IS NULL OR
       NEW.l_maLop IS NULL THEN

        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot add student: missing required fields.';
    END IF;
END //

DELIMITER ;



-- tạo bảng mới lưu hs bị xóa , lưu hs vào bảng 


CREATE TABLE DeletedStudentsLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    hs_maHS VARCHAR(10),
    hs_hoTen VARCHAR(50),
    deletion_time DATETIME
);


-- tạo form đăng ký 
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- thủ tục đăng ký

DELIMITER //

CREATE PROCEDURE RegisterUser(IN p_username VARCHAR(50), IN p_password VARCHAR(255))
BEGIN
    DECLARE user_count INT;

    -- Kiểm tra xem tên người dùng đã tồn tại chưa
    SELECT COUNT(*) INTO user_count FROM users WHERE username = p_username;

    IF user_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username already exists';
    ELSE
        -- Chèn người dùng mới vào bảng
        INSERT INTO users (username, password) VALUES (p_username, p_password);
    END IF;
END //

DELIMITER ;

-- tạo bản phiên làm việc
CREATE TABLE session (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- thủ tục đăng xuất 
DELIMITER //

CREATE PROCEDURE LogoutUser(IN p_user_id INT)
BEGIN
    -- Xóa phiên người dùng
    DELETE FROM session WHERE user_id = p_user_id;
END //

DELIMITER ;

-- thủ tục đăng nhập
DELIMITER //

CREATE PROCEDURE LoginUser(IN p_username VARCHAR(50), IN p_password VARCHAR(255))
BEGIN
    DECLARE user_id INT;

    -- Kiểm tra thông tin người dùng
    SELECT user_id INTO user_id
    FROM users
    WHERE username = p_username AND password = p_password; -- Không nên lưu mật khẩu dưới dạng plaintext!

    IF user_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid username or password';
    ELSE
        -- Thêm vào bảng session (giả sử bạn đã có bảng session)
        INSERT INTO session (user_id) VALUES (user_id);
    END IF;
END //

DELIMITER ;



-- nếu không đăng nhập thì không sd được

DELIMITER //

CREATE PROCEDURE SomeProtectedProcedure(IN p_user_id INT)
BEGIN
    DECLARE session_count INT;

    -- Kiểm tra xem người dùng có phiên không
    SELECT COUNT(*) INTO session_count FROM session WHERE user_id = p_user_id;

    IF session_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User is not logged in';
    ELSE
        call timdshd_theomalop('12A3_2024');
    END IF;
END //

DELIMITER ;

-- để đăng nhập đăng ký ở đây nó bị sai gì rồi



-- các triger 


DELIMITER //

-- Trigger cho bảng Lop
CREATE TRIGGER before_insert_Lop
BEFORE INSERT ON Lop
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.l_maLop IS NULL OR NEW.l_tenLop IS NULL OR NEW.l_nienKhoa IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM Lop WHERE l_maLop = NEW.l_maLop;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_Lop
BEFORE UPDATE ON Lop
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.l_maLop IS NULL OR NEW.l_tenLop IS NULL OR NEW.l_nienKhoa IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM Lop WHERE l_maLop = NEW.l_maLop AND l_maLop != OLD.l_maLop;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_Lop
BEFORE DELETE ON Lop
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM Lop WHERE l_maLop = OLD.l_maLop;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

-- Trigger cho bảng GiaoVien
CREATE TRIGGER before_insert_GiaoVien
BEFORE INSERT ON GiaoVien
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.gv_maGV IS NULL OR NEW.gv_hoTen IS NULL OR NEW.gv_ngaySinh IS NULL OR NEW.gv_diaChi IS NULL OR NEW.gv_sdt IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM GiaoVien WHERE gv_maGV = NEW.gv_maGV;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_GiaoVien
BEFORE UPDATE ON GiaoVien
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.gv_maGV IS NULL OR NEW.gv_hoTen IS NULL OR NEW.gv_ngaySinh IS NULL OR NEW.gv_diaChi IS NULL OR NEW.gv_sdt IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM GiaoVien WHERE gv_maGV = NEW.gv_maGV AND gv_maGV != OLD.gv_maGV;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_GiaoVien
BEFORE DELETE ON GiaoVien
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM GiaoVien WHERE gv_maGV = OLD.gv_maGV;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

-- Trigger cho bảng HocSinh
CREATE TRIGGER before_insert_HocSinh
BEFORE INSERT ON HocSinh
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.hs_maHS IS NULL OR NEW.hs_hoTen IS NULL OR NEW.hs_ngaySinh IS NULL OR NEW.hs_diaChi IS NULL OR NEW.hs_sdtPhuHuynh IS NULL OR NEW.l_maLop IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM HocSinh WHERE hs_maHS = NEW.hs_maHS;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_HocSinh
BEFORE UPDATE ON HocSinh
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.hs_maHS IS NULL OR NEW.hs_hoTen IS NULL OR NEW.hs_ngaySinh IS NULL OR NEW.hs_diaChi IS NULL OR NEW.hs_sdtPhuHuynh IS NULL OR NEW.l_maLop IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM HocSinh WHERE hs_maHS = NEW.hs_maHS AND hs_maHS != OLD.hs_maHS;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_HocSinh
BEFORE DELETE ON HocSinh
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM HocSinh WHERE hs_maHS = OLD.hs_maHS;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

-- Trigger cho bảng ChuNhiem
CREATE TRIGGER before_insert_ChuNhiem
BEFORE INSERT ON ChuNhiem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.gv_maGV IS NULL OR NEW.l_maLop IS NULL OR NEW.cn_namHoc IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM ChuNhiem WHERE gv_maGV = NEW.gv_maGV AND l_maLop = NEW.l_maLop AND cn_namHoc = NEW.cn_namHoc;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_ChuNhiem
BEFORE UPDATE ON ChuNhiem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.gv_maGV IS NULL OR NEW.l_maLop IS NULL OR NEW.cn_namHoc IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM ChuNhiem WHERE gv_maGV = NEW.gv_maGV AND l_maLop = NEW.l_maLop AND cn_namHoc = NEW.cn_namHoc AND (gv_maGV != OLD.gv_maGV OR l_maLop != OLD.l_maLop OR cn_namHoc != OLD.cn_namHoc);
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_ChuNhiem
BEFORE DELETE ON ChuNhiem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM ChuNhiem WHERE gv_maGV = OLD.gv_maGV AND l_maLop = OLD.l_maLop AND cn_namHoc = OLD.cn_namHoc;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

-- Trigger cho bảng PhongHoc
CREATE TRIGGER before_insert_PhongHoc
BEFORE INSERT ON PhongHoc
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.p_maPhong IS NULL OR NEW.p_soPhong IS NULL OR NEW.p_soChoToiDa IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM PhongHoc WHERE p_maPhong = NEW.p_maPhong;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_PhongHoc
BEFORE UPDATE ON PhongHoc
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.p_maPhong IS NULL OR NEW.p_soPhong IS NULL OR NEW.p_soChoToiDa IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM PhongHoc WHERE p_maPhong = NEW.p_maPhong AND p_maPhong != OLD.p_maPhong;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_PhongHoc
BEFORE DELETE ON PhongHoc
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM PhongHoc WHERE p_maPhong = OLD.p_maPhong;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

-- Trigger cho bảng PhongLop
CREATE TRIGGER before_insert_PhongLop
BEFORE INSERT ON PhongLop
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.pl_maPhong IS NULL OR NEW.l_maLop IS NULL OR NEW.pl_hocKyNamHoc IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM PhongLop WHERE pl_maPhong = NEW.pl_maPhong AND l_maLop = NEW.l_maLop AND pl_hocKyNamHoc = NEW.pl_hocKyNamHoc;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_PhongLop
BEFORE UPDATE ON PhongLop
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.pl_maPhong IS NULL OR NEW.l_maLop IS NULL OR NEW.pl_hocKyNamHoc IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM PhongLop WHERE pl_maPhong = NEW.pl_maPhong AND l_maLop = NEW.l_maLop AND pl_hocKyNamHoc = NEW.pl_hocKyNamHoc AND (pl_maPhong != OLD.pl_maPhong OR l_maLop != OLD.l_maLop OR pl_hocKyNamHoc != OLD.pl_hocKyNamHoc);
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_PhongLop
BEFORE DELETE ON PhongLop
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM PhongLop WHERE pl_maPhong = OLD.pl_maPhong AND l_maLop = OLD.l_maLop AND pl_hocKyNamHoc = OLD.pl_hocKyNamHoc;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

-- Trigger cho bảng MonHoc
CREATE TRIGGER before_insert_MonHoc
BEFORE INSERT ON MonHoc
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.mh_maMonHoc IS NULL OR NEW.mh_tenMonHoc IS NULL OR NEW.mh_khoi IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM MonHoc WHERE mh_maMonHoc = NEW.mh_maMonHoc;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_MonHoc
BEFORE UPDATE ON MonHoc
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.mh_maMonHoc IS NULL OR NEW.mh_tenMonHoc IS NULL OR NEW.mh_khoi IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM MonHoc WHERE mh_maMonHoc = NEW.mh_maMonHoc AND mh_maMonHoc != OLD.mh_maMonHoc;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_MonHoc
BEFORE DELETE ON MonHoc
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM MonHoc WHERE mh_maMonHoc = OLD.mh_maMonHoc;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

-- Trigger cho bảng Diem trước khi thêm dữ liệu
DELIMITER //

-- Trigger cho bảng Diem trước khi thêm dữ liệu
CREATE TRIGGER before_insert_Diem
BEFORE INSERT ON Diem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    -- Kiểm tra giá trị NULL
    IF NEW.hs_maHS IS NULL OR NEW.mh_maMonHoc IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    -- Kiểm tra giá trị điểm
    IF NEW.d_diemMieng < 0 OR NEW.d_diemMieng > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Điểm miệng phải nằm trong khoảng từ 0 đến 10';
    END IF;

    IF NEW.d_diem15Phut < 0 OR NEW.d_diem15Phut > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Điểm 15 phút phải nằm trong khoảng từ 0 đến 10';
    END IF;

    IF NEW.d_diem1Tiet < 0 OR NEW.d_diem1Tiet > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Điểm 1 tiết phải nằm trong khoảng từ 0 đến 10';
    END IF;

    IF NEW.d_diemThi < 0 OR NEW.d_diemThi > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Điểm thi phải nằm trong khoảng từ 0 đến 10';
    END IF;

    -- Kiểm tra dữ liệu đã tồn tại
    SELECT COUNT(*) INTO count_existing FROM Diem WHERE hs_maHS = NEW.hs_maHS AND mh_maMonHoc = NEW.mh_maMonHoc;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

-- Trigger cho bảng Diem trước khi cập nhật dữ liệu
CREATE TRIGGER before_update_Diem
BEFORE UPDATE ON Diem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    -- Kiểm tra giá trị NULL
    IF NEW.hs_maHS IS NULL OR NEW.mh_maMonHoc IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    -- Kiểm tra giá trị điểm
    IF NEW.d_diemMieng < 0 OR NEW.d_diemMieng > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Điểm miệng phải nằm trong khoảng từ 0 đến 10';
    END IF;

    IF NEW.d_diem15Phut < 0 OR NEW.d_diem15Phut > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Điểm 15 phút phải nằm trong khoảng từ 0 đến 10';
    END IF;

    IF NEW.d_diem1Tiet < 0 OR NEW.d_diem1Tiet > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Điểm 1 tiết phải nằm trong khoảng từ 0 đến 10';
    END IF;

    IF NEW.d_diemThi < 0 OR NEW.d_diemThi > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Điểm thi phải nằm trong khoảng từ 0 đến 10';
    END IF;

    -- Kiểm tra dữ liệu đã tồn tại
    SELECT COUNT(*) INTO count_existing FROM Diem WHERE hs_maHS = NEW.hs_maHS AND mh_maMonHoc = NEW.mh_maMonHoc 
        AND (hs_maHS != OLD.hs_maHS OR mh_maMonHoc != OLD.mh_maMonHoc);
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_Diem
BEFORE DELETE ON Diem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM Diem WHERE hs_maHS = OLD.hs_maHS AND mh_maMonHoc = OLD.mh_maMonHoc;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

DELIMITER ;

INSERT INTO Diem (hs_maHS, mh_maMonHoc, d_diemMieng, d_diem15Phut, d_diem1Tiet, d_diemThi)
VALUES ('HS001', 'MH002', 8.5, 9.0, 7.0, 10.0);

-- Xóa thủ tục Add cho bảng HocSinh
DROP PROCEDURE IF EXISTS AddHocSinh;

-- Xóa thủ tục Delete cho bảng HocSinh
DROP PROCEDURE IF EXISTS DeleteHocSinh;

-- Xóa thủ tục Update cho bảng HocSinh
DROP PROCEDURE IF EXISTS UpdateHocSinh;

-- Xóa thủ tục Add cho bảng GiaoVien
DROP PROCEDURE IF EXISTS AddGiaoVien;

-- Xóa thủ tục Delete cho bảng GiaoVien
DROP PROCEDURE IF EXISTS DeleteGiaoVien;

-- Xóa thủ tục Update cho bảng GiaoVien
DROP PROCEDURE IF EXISTS UpdateGiaoVien;

-- Xóa thủ tục Add cho bảng Lop
DROP PROCEDURE IF EXISTS AddLop;

-- Xóa thủ tục Delete cho bảng Lop
DROP PROCEDURE IF EXISTS DeleteLop;

-- Xóa thủ tục Update cho bảng Lop
DROP PROCEDURE IF EXISTS UpdateLop;

-- Xóa thủ tục Add cho bảng MonHoc
DROP PROCEDURE IF EXISTS AddMonHoc;

-- Xóa thủ tục Delete cho bảng MonHoc
DROP PROCEDURE IF EXISTS DeleteMonHoc;

-- Xóa thủ tục Update cho bảng MonHoc
DROP PROCEDURE IF EXISTS UpdateMonHoc;

-- Xóa thủ tục Add cho bảng Diem
DROP PROCEDURE IF EXISTS AddDiem;

-- Xóa thủ tục Delete cho bảng Diem
DROP PROCEDURE IF EXISTS DeleteDiem;

-- Xóa thủ tục Update cho bảng Diem
DROP PROCEDURE IF EXISTS UpdateDiem;

-- Xóa thủ tục Add cho bảng PhongHoc
DROP PROCEDURE IF EXISTS AddPhongHoc;

-- Xóa thủ tục Delete cho bảng PhongHoc
DROP PROCEDURE IF EXISTS DeletePhongHoc;

-- Xóa thủ tục Update cho bảng PhongHoc
DROP PROCEDURE IF EXISTS UpdatePhongHoc;

-- Xóa thủ tục Add cho bảng PhongLop
DROP PROCEDURE IF EXISTS AddPhongLop;

-- Xóa thủ tục Delete cho bảng PhongLop
DROP PROCEDURE IF EXISTS DeletePhongLop;

-- Xóa thủ tục Update cho bảng PhongLop
DROP PROCEDURE IF EXISTS UpdatePhongLop;

-- Xóa thủ tục Add cho bảng ChuNhiem
DROP PROCEDURE IF EXISTS AddChuNhiem;

-- Xóa thủ tục Delete cho bảng ChuNhiem
DROP PROCEDURE IF EXISTS DeleteChuNhiem;

-- Xóa thủ tục Update cho bảng ChuNhiem
DROP PROCEDURE IF EXISTS UpdateChuNhiem;

-- Xóa thủ tục Print cho bảng HocSinh
DROP PROCEDURE IF EXISTS PrintHocSinh;

-- Xóa thủ tục Print cho bảng GiaoVien
DROP PROCEDURE IF EXISTS PrintGiaoVien;

-- Xóa thủ tục Print cho bảng Lop
DROP PROCEDURE IF EXISTS PrintLop;

-- Xóa thủ tục Print cho bảng MonHoc
DROP PROCEDURE IF EXISTS PrintMonHoc;

-- Xóa thủ tục Print cho bảng Diem
DROP PROCEDURE IF EXISTS PrintDiem;

-- Xóa thủ tục Print cho bảng PhongHoc
DROP PROCEDURE IF EXISTS PrintPhongHoc;

-- Xóa thủ tục Print cho bảng PhongLop
DROP PROCEDURE IF EXISTS PrintPhongLop;

-- Xóa thủ tục Print cho bảng ChuNhiem
DROP PROCEDURE IF EXISTS PrintChuNhiem;

