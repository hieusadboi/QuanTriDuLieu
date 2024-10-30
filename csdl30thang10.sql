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
    hs_maHS VARCHAR(10), 
    l_maLop VARCHAR(10), -- Khóa ngoại tham chiếu đến Lop
    hs_hoTen VARCHAR(50),
    hs_ngaySinh DATE,
    hs_diaChi VARCHAR(100),
    hs_sdtPhuHuynh VARCHAR(15),
    PRIMARY KEY (hs_maHS, l_maLop), -- Khóa chính tổ hợp (hs_maHS, l_maLop)
    FOREIGN KEY (l_maLop) REFERENCES Lop(l_maLop) -- Thiết lập l_maLop làm khóa ngoại
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
('10A1_2022', 'Lớp 10A1', '2022-2023'),
('10A2_2022', 'Lớp 10A2', '2022-2023'),
('10A3_2022', 'Lớp 10A3', '2022-2023'),
('11A1_2023', 'Lớp 11A1', '2023-2024'),
('11A2_2023', 'Lớp 11A2', '2023-2024'),
('11A3_2023', 'Lớp 11A3', '2023-2024'),
('12A1_2024', 'Lớp 12A1', '2024-2025'),
('12A2_2024', 'Lớp 12A2', '2024-2025'),
('12A3_2024', 'Lớp 12A3', '2024-2025');

-- Insert sample data into GiaoVien table
INSERT INTO GiaoVien (gv_maGV, gv_hoTen, gv_ngaySinh, gv_diaChi, gv_sdt)
VALUES 
('GV001', 'Nguyễn Văn An', '1980-05-10', 'Hà Nội', '0912345678'),
('GV002', 'Trần Thị Bình', '1985-03-20', 'Hà Nội', '0923456789'),
('GV003', 'Phạm Văn Cường', '1982-07-15', 'Hà Nội', '0934567890'),
('GV004', 'Lê Thị Dung', '1990-11-22', 'Hà Nội', '0945678901'),
('GV005', 'Ngô Văn Đức', '1975-09-10', 'Hà Nội', '0956789012'),
('GV006', 'Vũ Thị Hoa', '1988-12-05', 'Hà Nội', '0967890123'),
('GV007', 'Bùi Văn Hùng', '1983-01-15', 'Hà Nội', '0978901234'),
('GV008', 'Đỗ Thị Kiều', '1979-02-25', 'Hà Nội', '0989012345'),
('GV009', 'Hoàng Văn Long', '1981-06-17', 'Hà Nội', '0990123456'),
('GV010', 'Đinh Thị Mai', '1986-04-14', 'Hà Nội', '0901234567');


-- Insert sample data into HocSinh table
INSERT INTO HocSinh (hs_maHS, hs_hoTen, hs_ngaySinh, hs_diaChi, hs_sdtPhuHuynh, l_maLop) VALUES
('HS001', 'Nguyễn Công Minh', '2004-10-23', 'Vĩnh Long', '0901098432', '10A1_2022'),
('HS001', 'Nguyễn Công Minh', '2005-09-12', 'Vĩnh Long', '0901098432', '11A1_2023'),
('HS001', 'Nguyễn Công Minh', '2005-09-12', 'Vĩnh Long', '0901098432', '12A1_2024'),

('HS002', 'Trần Thị Hương', '2005-09-12', 'Cần Thơ', '0901098433', '10A1_2022'),
('HS002', 'Trần Thị Hương', '2005-09-12', 'Cần Thơ', '0901098433', '11A2_2023'),
('HS002', 'Trần Thị Hương', '2005-09-12', 'Cần Thơ', '0901098433', '12A2_2024'),

('HS003', 'Lê Văn Duy', '2005-08-15', 'Đồng Tháp', '0901098434', '10A2_2022'),
('HS003', 'Lê Văn Duy', '2005-08-15', 'Đồng Tháp', '0901098434', '11A2_2023'),
('HS003', 'Lê Văn Duy', '2005-08-15', 'Đồng Tháp', '0901098434', '12A2_2024'),

('HS004', 'Ngô Thị Mai', '2005-07-21', 'Vĩnh Long', '0901098435', '10A3_2022'),
('HS004', 'Ngô Thị Mai', '2005-07-21', 'Vĩnh Long', '0901098435', '11A3_2023'),
('HS004', 'Ngô Thị Mai', '2005-07-21', 'Vĩnh Long', '0901098435', '12A3_2024'),

('HS005', 'Phạm Văn An', '2005-06-10', 'Cần Thơ', '0901098436', '11A1_2023'),
('HS006', 'Nguyễn Văn Hoàng', '2005-05-03', 'Đồng Tháp', '0901098437', '11A2_2023'),
('HS007', 'Trần Văn Hải', '2005-04-20', 'Vĩnh Long', '0901098438', '11A3_2023'),

('HS008', 'Lê Thị Kim', '2005-03-18', 'Cần Thơ', '0901098439', '12A1_2024'),
('HS009', 'Ngô Văn Thắng', '2005-02-22', 'Đồng Tháp', '0901098440', '12A2_2024'),
('HS010', 'Phạm Thị Bích', '2005-01-30', 'Vĩnh Long', '0901098441', '12A3_2024'),

('HS011', 'Nguyễn Văn Đạt', '2004-11-25', 'Cần Thơ', '0901098442', '12A3_2024'),
('HS012', 'Trần Thị Nhung', '2004-12-15', 'Đồng Tháp', '0901098443', '10A1_2022'),
('HS013', 'Lê Văn Khánh', '2005-01-10', 'Vĩnh Long', '0901098444', '10A2_2022'),

('HS014', 'Ngô Thị Tuyết', '2005-02-05', 'Cần Thơ', '0901098445', '10A3_2022'),
('HS015', 'Phạm Văn Hòa', '2005-03-01', 'Đồng Tháp', '0901098446', '11A1_2023'),
('HS016', 'Nguyễn Văn Sơn', '2005-04-12', 'Vĩnh Long', '0901098447', '11A2_2023'),

('HS017', 'Trần Thị Lan', '2005-05-17', 'Cần Thơ', '0901098448', '11A3_2023'),
('HS018', 'Lê Văn Phúc', '2005-06-28', 'Đồng Tháp', '0901098449', '12A1_2024'),
('HS019', 'Ngô Thị Hoa', '2005-07-09', 'Vĩnh Long', '0901098450', '12A2_2024'),

('HS020', 'Phạm Văn Nam', '2005-08-13', 'Cần Thơ', '0901098451', '12A3_2024'),
('HS021', 'Nguyễn Văn Khoa', '2005-09-29', 'Đồng Tháp', '0901098452', '12A3_2024'),
('HS022', 'Trần Thị Duyên', '2005-10-05', 'Vĩnh Long', '0901098453', '10A1_2022'),

('HS023', 'Lê Văn Nghĩa', '2005-11-11', 'Cần Thơ', '0901098454', '10A2_2022'),
('HS024', 'Ngô Thị Linh', '2005-12-19', 'Đồng Tháp', '0901098455', '10A3_2022'),
('HS025', 'Phạm Văn Lộc', '2005-01-22', 'Vĩnh Long', '0901098456', '11A1_2023'),

('HS026', 'Nguyễn Thị Ngọc', '2005-02-28', 'Cần Thơ', '0901098457', '11A2_2023'),
('HS027', 'Trần Văn Đức', '2005-03-23', 'Đồng Tháp', '0901098458', '11A3_2023'),
('HS028', 'Lê Thị Thảo', '2005-04-10', 'Vĩnh Long', '0901098459', '12A1_2024'),

('HS029', 'Ngô Văn Lâm', '2005-05-01', 'Cần Thơ', '0901098460', '12A2_2024'),
('HS030', 'Phạm Thị Phượng', '2005-06-07', 'Đồng Tháp', '0901098461', '12A3_2024'),
('HS031', 'Nguyễn Văn Chiến', '2004-07-15', 'Vĩnh Long', '0901098462', '12A3_2024'),

('HS032', 'Trần Thị Xuân', '2004-08-20', 'Cần Thơ', '0901098463', '10A1_2022'),
('HS033', 'Lê Văn Khoa', '2004-09-14', 'Đồng Tháp', '0901098464', '10A2_2022'),
('HS034', 'Ngô Thị Băng', '2004-10-09', 'Vĩnh Long', '0901098465', '10A3_2022'),

('HS035', 'Phạm Văn Nguyên', '2004-11-01', 'Cần Thơ', '0901098466', '11A1_2023'),
('HS036', 'Nguyễn Văn Tài', '2004-12-22', 'Đồng Tháp', '0901098467', '11A2_2023'),
('HS037', 'Trần Thị Duyên', '2004-01-15', 'Vĩnh Long', '0901098468', '11A3_2023'),

('HS038', 'Lê Văn Huy', '2004-02-02', 'Cần Thơ', '0901098469', '12A1_2024'),
('HS039', 'Nguyễn Thị Nhung', '2004-03-09', 'Đồng Tháp', '0901098470', '12A2_2024'),
('HS040', 'Trần Văn Thiện', '2004-04-14', 'Vĩnh Long', '0901098471', '12A3_2024'),

('HS041', 'Lê Văn Tùng', '2004-05-18', 'Cần Thơ', '0901098472', '12A3_2024'),
('HS042', 'Nguyễn Thị Ngọc', '2004-06-22', 'Đồng Tháp', '0901098473', '12A3_2024'),
('HS043', 'Phạm Thị Hoài', '2004-07-30', 'Vĩnh Long', '0901098474', '12A3_2024'),

('HS044', 'Nguyễn Văn Hòa', '2004-08-15', 'Cần Thơ', '0901098475', '12A3_2024'),
('HS045', 'Trần Thị Mai', '2004-09-04', 'Đồng Tháp', '0901098476', '12A3_2024'),
('HS046', 'Lê Văn Châu', '2004-10-01', 'Vĩnh Long', '0901098477', '12A3_2024'),

('HS047', 'Nguyễn Thị Trâm', '2004-11-11', 'Cần Thơ', '0901098478', '12A3_2024'),
('HS048', 'Phạm Văn Trung', '2004-12-25', 'Đồng Tháp', '0901098479', '12A3_2024'),
('HS049', 'Ngô Thị Lệ', '2004-10-30', 'Vĩnh Long', '0901098480', '12A3_2024'),

('HS050', 'Trần Văn Khoa', '2005-01-05', 'Cần Thơ', '0901098481', '12A3_2024');


-- Insert sample data into ChuNhiem table
INSERT INTO ChuNhiem (gv_maGV, l_maLop, cn_namHoc) VALUES
('GV001', '10A1_2022', '2022-2023'), -- GV001 làm chủ nhiệm lớp 10A1
('GV002', '10A2_2022', '2022-2023'), -- GV002 làm chủ nhiệm lớp 10A2
('GV003', '10A3_2022', '2022-2023'), -- GV003 làm chủ nhiệm lớp 10A3
('GV004', '11A1_2023', '2023-2024'), -- GV004 làm chủ nhiệm lớp 11A1
('GV005', '11A2_2023', '2023-2024'), -- GV005 làm chủ nhiệm lớp 11A2
('GV006', '11A3_2023', '2023-2024'), -- GV006 làm chủ nhiệm lớp 11A3
('GV007', '12A1_2024', '2024-2025'), -- GV007 làm chủ nhiệm lớp 12A1
('GV008', '12A2_2024', '2024-2025'), -- GV008 làm chủ nhiệm lớp 12A2
('GV009', '12A3_2024', '2024-2025'); -- GV009 làm chủ nhiệm lớp 12A3




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
('P204', 204, 40);

-- Insert sample data into PhongLop table
INSERT INTO PhongLop (pl_maPhong, l_maLop, pl_hocKyNamHoc) VALUES
('P101', '10A1_2022', '2022-2023'),
('P102', '10A2_2022', '2022-2023'),
('P103', '10A3_2022', '2022-2023'),
('P104', '11A1_2023', '2023-2024'),
('P105', '11A2_2023', '2023-2024'),
('P201', '11A3_2023', '2023-2024'),
('P202', '12A1_2024', '2024-2025'),
('P203', '12A2_2024', '2024-2025'),
('P204', '12A3_2024', '2024-2025');

-- Insert sample data into MonHoc table
INSERT INTO MonHoc (mh_maMonHoc, mh_tenMonHoc, mh_khoi) VALUES 
('MH10_01', 'Toán', 10), 
('MH10_02', 'Vật Lý', 10), 
('MH10_03', 'Hóa', 10), 
('MH10_04', 'Sinh học', 10), 
('MH10_05', 'Tiếng Anh', 10),

('MH11_01', 'Toán', 11), 
('MH11_02', 'Vật Lý', 11), 
('MH11_03', 'Hóa', 11), 
('MH11_04', 'Sinh học', 11), 
('MH11_05', 'Tiếng Anh', 11),

('MH12_01', 'Toán', 12), 
('MH12_02', 'Vật Lý', 12), 
('MH12_03', 'Hóa', 12), 
('MH12_04', 'Sinh học', 12), 
('MH12_05', 'Tiếng Anh', 12);


-- Insert sample data into Diem table
INSERT INTO Diem (hs_maHS, mh_maMonHoc, d_diemMieng, d_diem15Phut, d_diem1Tiet, d_diemThi) VALUES 
-- Khối 10
('HS001', 'MH10_01', 8.0, 7.5, 8.5, 9.0),
('HS001', 'MH10_02', 7.5, 8.0, 8.0, 9.0),
('HS001', 'MH10_03', 8.0, 7.0, 9.0, 8.5),
('HS001', 'MH10_04', 9.0, 8.5, 8.5, 9.5),
('HS001', 'MH10_05', 8.5, 8.0, 9.0, 9.0),

('HS001', 'MH11_01', 8.5, 8.7, 9.5, 9.0),
('HS001', 'MH11_02', 8.5, 8.0, 9.2, 9.0),
('HS001', 'MH11_03', 8.5, 8.0, 9.1, 9.0),
('HS001', 'MH11_04', 8.5, 8.0, 5.0, 9.0),
('HS001', 'MH11_05', 8.5, 8.0, 9.0, 9.0),

('HS001', 'MH12_01', 8.5, 8.0, 6.0, 9.0),
('HS001', 'MH12_02', 8.5, 7.0, 9.0, 9.0),
('HS001', 'MH12_03', 8.5, 8.0, 9.0, 9.0),
('HS001', 'MH12_04', 8.5, 8.0, 9.0, 9.0),
('HS001', 'MH12_05', 8.5, 8.0, 10.0, 8.0),

('HS002', 'MH10_01', 7.0, 8.0, 9.0, 9.5),
('HS002', 'MH10_02', 8.0, 7.5, 8.5, 8.5),
('HS002', 'MH10_03', 9.0, 6.5, 7.5, 9.0),
('HS002', 'MH10_04', 8.5, 9.0, 8.0, 9.0),
('HS002', 'MH10_05', 9.0, 8.5, 9.5, 8.0),

('HS002', 'MH11_01', 8.0, 8.5, 9.0, 9.0),
('HS002', 'MH11_02', 7.5, 8.0, 8.0, 8.5),
('HS002', 'MH11_03', 8.0, 7.0, 9.0, 9.0),
('HS002', 'MH11_04', 9.0, 8.5, 9.5, 8.0),
('HS002', 'MH11_05', 8.5, 8.0, 8.0, 9.0),

('HS002', 'MH12_01', 8.5, 9.0, 7.0, 9.5),
('HS002', 'MH12_02', 7.5, 8.0, 8.5, 8.0),
('HS002', 'MH12_03', 9.0, 7.5, 9.0, 8.5),
('HS002', 'MH12_04', 8.0, 8.0, 9.0, 9.0),
('HS002', 'MH12_05', 9.5, 8.5, 9.0, 9.0),

('HS003', 'MH10_01', 4.5, 5.0, 5.5, 6.0),
('HS003', 'MH10_02', 5.0, 4.0, 5.5, 6.0),
('HS003', 'MH10_03', 6.0, 5.0, 5.0, 5.5),
('HS003', 'MH10_04', 4.0, 4.5, 5.0, 5.5),
('HS003', 'MH10_05', 5.5, 5.0, 5.0, 5.0),

('HS003', 'MH11_01', 5.0, 4.5, 4.5, 5.0),
('HS003', 'MH11_02', 4.5, 5.0, 5.0, 5.0),
('HS003', 'MH11_03', 5.0, 4.0, 4.5, 5.0),
('HS003', 'MH11_04', 4.0, 4.5, 5.0, 5.0),
('HS003', 'MH11_05', 5.0, 5.0, 4.0, 4.5),

('HS003', 'MH12_01', 4.5, 5.0, 4.5, 5.0),
('HS003', 'MH12_02', 4.0, 4.0, 5.0, 5.5),
('HS003', 'MH12_03', 5.0, 4.5, 4.0, 4.5),
('HS003', 'MH12_04', 5.5, 5.0, 4.5, 5.0),
('HS003', 'MH12_05', 4.0, 4.5, 5.0, 5.0),

('HS004', 'MH10_01', 7.5, 7.0, 8.0, 8.5),
('HS004', 'MH10_02', 7.0, 7.5, 8.0, 8.5),
('HS004', 'MH10_03', 8.0, 8.0, 7.5, 8.5),
('HS004', 'MH10_04', 7.5, 7.5, 8.0, 8.0),
('HS004', 'MH10_05', 6.5, 7.0, 7.5, 8.0),

('HS004', 'MH11_01', 7.0, 7.5, 7.0, 8.0),
('HS004', 'MH11_02', 7.5, 7.0, 8.0, 8.0),
('HS004', 'MH11_03', 8.0, 7.5, 8.0, 8.0),
('HS004', 'MH11_04', 6.5, 8.0, 7.0, 7.5),
('HS004', 'MH11_05', 7.0, 7.5, 8.5, 8.0),

('HS004', 'MH12_01', 7.5, 8.0, 7.5, 8.0),
('HS004', 'MH12_02', 8.0, 7.5, 8.0, 8.5),
('HS004', 'MH12_03', 7.0, 7.0, 7.5, 8.0),
('HS004', 'MH12_04', 7.5, 8.0, 8.0, 8.0),
('HS004', 'MH12_05', 8.0, 7.5, 7.5, 8.0),

-- Khối 10

('HS012', 'MH10_01', 7.0, 8.0, 7.5, 8.0),
('HS012', 'MH10_02', 8.5, 7.0, 8.0, 8.5),
('HS012', 'MH10_03', 7.5, 8.5, 8.0, 8.0),
('HS012', 'MH10_04', 8.0, 8.0, 7.0, 9.0),
('HS012', 'MH10_05', 7.5, 7.5, 8.5, 8.0),

('HS013', 'MH10_01', 6.0, 6.5, 7.0, 6.5),
('HS013', 'MH10_02', 7.0, 6.0, 6.5, 7.0),
('HS013', 'MH10_03', 6.5, 7.0, 6.0, 7.0),
('HS013', 'MH10_04', 6.0, 7.5, 6.5, 6.0),
('HS013', 'MH10_05', 7.0, 6.5, 7.0, 6.5),

('HS014', 'MH10_01', 5.0, 5.5, 6.0, 5.5),
('HS014', 'MH10_02', 5.5, 6.0, 5.0, 6.0),
('HS014', 'MH10_03', 6.0, 5.0, 5.5, 5.0),
('HS014', 'MH10_04', 5.0, 5.5, 6.0, 5.5),
('HS014', 'MH10_05', 5.5, 5.0, 5.5, 6.0),

-- Khối 11

-- HS005 (Điểm Khá)
('HS005', 'MH11_01', 8.0, 7.5, 8.0, 9.0),
('HS005', 'MH11_02', 8.5, 8.0, 8.5, 9.0),
('HS005', 'MH11_03', 7.5, 8.0, 8.0, 8.5),
('HS005', 'MH11_04', 8.0, 8.5, 8.0, 8.5),
('HS005', 'MH11_05', 8.0, 8.0, 8.5, 9.0),

-- HS006 (Điểm Trung Bình)
('HS006', 'MH11_01', 7.0, 7.5, 6.5, 7.0),
('HS006', 'MH11_02', 7.5, 7.0, 7.5, 7.0),
('HS006', 'MH11_03', 6.5, 7.0, 7.0, 6.5),
('HS006', 'MH11_04', 7.0, 6.5, 7.5, 7.0),
('HS006', 'MH11_05', 7.5, 6.0, 6.5, 7.5),

-- HS007 (Điểm Thấp)
('HS007', 'MH11_01', 5.5, 5.0, 6.0, 5.5),
('HS007', 'MH11_02', 5.0, 5.5, 5.0, 5.0),
('HS007', 'MH11_03', 5.5, 6.0, 5.0, 6.5),
('HS007', 'MH11_04', 5.0, 5.5, 5.5, 5.0),
('HS007', 'MH11_05', 5.5, 5.0, 5.5, 6.0),

-- HS015 (Điểm Khá)
('HS015', 'MH11_01', 8.0, 7.0, 7.5, 8.5),
('HS015', 'MH11_02', 8.5, 8.0, 8.0, 8.0),
('HS015', 'MH11_03', 8.0, 8.5, 7.5, 8.0),
('HS015', 'MH11_04', 8.0, 7.5, 8.0, 8.5),
('HS015', 'MH11_05', 8.5, 8.0, 8.0, 9.0),

-- HS016 (Điểm Trung Bình)
('HS016', 'MH11_01', 7.5, 6.5, 7.0, 7.5),
('HS016', 'MH11_02', 6.5, 7.0, 7.5, 7.0),
('HS016', 'MH11_03', 7.0, 7.5, 6.0, 6.5),
('HS016', 'MH11_04', 6.5, 7.0, 6.5, 7.0),
('HS016', 'MH11_05', 7.0, 7.5, 7.5, 7.0),

-- HS017 (Điểm Thấp)
('HS017', 'MH11_01', 5.0, 5.5, 5.0, 5.5),
('HS017', 'MH11_02', 5.5, 5.0, 5.5, 5.0),
('HS017', 'MH11_03', 5.0, 5.5, 5.5, 5.0),
('HS017', 'MH11_04', 5.5, 5.0, 5.5, 5.5),
('HS017', 'MH11_05', 5.0, 5.5, 5.0, 5.0),

-- Khối 12

('HS008', 'MH12_01', 8.0, 8.0, 8.5, 9.0),
('HS008', 'MH12_02', 8.5, 8.5, 8.0, 8.5),
('HS008', 'MH12_03', 8.0, 8.5, 7.5, 8.5),
('HS008', 'MH12_04', 8.5, 8.0, 8.0, 9.0),
('HS008', 'MH12_05', 8.0, 8.0, 8.0, 8.5),

-- HS009 (Điểm Trung Bình)
('HS009', 'MH12_01', 7.0, 7.5, 6.5, 7.0),
('HS009', 'MH12_02', 6.5, 7.0, 7.0, 7.5),
('HS009', 'MH12_03', 7.0, 7.0, 6.0, 6.5),
('HS009', 'MH12_04', 7.5, 6.5, 7.5, 7.0),
('HS009', 'MH12_05', 6.0, 6.5, 6.5, 7.0),

-- HS010 (Điểm Thấp)
('HS010', 'MH12_01', 5.5, 5.0, 6.0, 5.5),
('HS010', 'MH12_02', 5.0, 5.5, 5.0, 5.0),
('HS010', 'MH12_03', 5.5, 6.0, 5.0, 5.5),
('HS010', 'MH12_04', 5.0, 5.5, 5.5, 5.0),
('HS010', 'MH12_05', 5.5, 5.0, 5.5, 5.5),

-- HS011 (Điểm Khá)
('HS011', 'MH12_01', 8.0, 7.5, 7.5, 8.5),
('HS011', 'MH12_02', 8.5, 8.0, 8.5, 9.0),
('HS011', 'MH12_03', 8.0, 8.5, 8.0, 8.5),
('HS011', 'MH12_04', 8.0, 7.0, 7.5, 8.0),
('HS011', 'MH12_05', 8.5, 8.0, 8.0, 9.0),

-- HS018 (Điểm Trung Bình)
('HS018', 'MH12_01', 7.0, 7.5, 7.0, 7.5),
('HS018', 'MH12_02', 6.5, 7.0, 7.0, 7.0),
('HS018', 'MH12_03', 7.0, 6.5, 6.5, 7.5),
('HS018', 'MH12_04', 6.5, 7.0, 6.0, 7.0),
('HS018', 'MH12_05', 7.0, 6.5, 7.5, 7.0),

-- HS019 (Điểm Thấp)
('HS019', 'MH12_01', 5.0, 5.5, 5.0, 5.0),
('HS019', 'MH12_02', 5.5, 5.0, 5.5, 5.0),
('HS019', 'MH12_03', 5.0, 5.5, 5.0, 5.0),
('HS019', 'MH12_04', 5.5, 5.0, 5.5, 5.0),
('HS019', 'MH12_05', 5.0, 5.5, 5.0, 5.0),
('HS020', 'MH12_01', 7.5, 8.0, 8.0, 8.5),
('HS020', 'MH12_02', 8.0, 7.5, 8.5, 8.0),
('HS020', 'MH12_03', 7.5, 8.5, 8.0, 7.5),
('HS020', 'MH12_04', 8.0, 7.0, 8.5, 8.5),
('HS020', 'MH12_05', 7.0, 7.5, 7.5, 7.5);

-- các hàm thêm sửa xóa và in bảng 

-- Thêm lớp
DELIMITER //
CREATE PROCEDURE AddLop(
    IN p_maLop VARCHAR(10),
    IN p_tenLop VARCHAR(45),
    IN p_nienKhoa VARCHAR(45)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO Lop (l_maLop, l_tenLop, l_nienKhoa) VALUES (p_maLop, p_tenLop, p_nienKhoa);
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE Lop SET l_tenLop = p_tenLop, l_nienKhoa = p_nienKhoa WHERE l_maLop = p_maLop;
    COMMIT;
END //
DELIMITER ;

-- Xóa lớp
DELIMITER //
CREATE PROCEDURE DeleteLop(IN p_maLop VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM Lop WHERE l_maLop = p_maLop;
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO GiaoVien (gv_maGV, gv_hoTen, gv_ngaySinh, gv_diaChi, gv_sdt) VALUES (p_maGV, p_hoTen, p_ngaySinh, p_diaChi, p_sdt);
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE GiaoVien SET gv_hoTen = p_hoTen, gv_ngaySinh = p_ngaySinh, gv_diaChi = p_diaChi, gv_sdt = p_sdt WHERE gv_maGV = p_maGV;
    COMMIT;
END //
DELIMITER ;

-- Xóa giáo viên
DELIMITER //
CREATE PROCEDURE DeleteGiaoVien(IN p_maGV VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM GiaoVien WHERE gv_maGV = p_maGV;
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO HocSinh (hs_maHS, hs_hoTen, hs_ngaySinh, hs_diaChi, hs_sdtPhuHuynh, l_maLop) VALUES (p_maHS, p_hoTen, p_ngaySinh, p_diaChi, p_sdtPhuHuynh, p_maLop);
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE HocSinh SET hs_hoTen = p_hoTen, hs_ngaySinh = p_ngaySinh, hs_diaChi = p_diaChi, hs_sdtPhuHuynh = p_sdtPhuHuynh, l_maLop = p_maLop WHERE hs_maHS = p_maHS;
    COMMIT;
END //
DELIMITER ;

-- Xóa học sinh
DELIMITER //
CREATE PROCEDURE DeleteHocSinh(IN p_maHS VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM HocSinh WHERE hs_maHS = p_maHS;
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO ChuNhiem (gv_maGV, l_maLop, cn_namHoc) VALUES (p_maGV, p_maLop, p_namHoc);
    COMMIT;
END //
DELIMITER ;

-- Xóa chủ nhiệm
DELIMITER //
CREATE PROCEDURE DeleteChuNhiem(IN p_maGV VARCHAR(10), IN p_maLop VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM ChuNhiem WHERE gv_maGV = p_maGV AND l_maLop = p_maLop;
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE ChuNhiem SET cn_namHoc = p_namHoc WHERE gv_maGV = p_maGV AND l_maLop = p_maLop;
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO PhongHoc (p_maPhong, p_soPhong, p_soChoToiDa) VALUES (p_maPhong, p_soPhong, p_soChoToiDa);
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE PhongHoc SET p_soPhong = p_soPhong, p_soChoToiDa = p_soChoToiDa WHERE p_maPhong = p_maPhong;
    COMMIT;
END //
DELIMITER ;

-- Xóa phòng học
DELIMITER //
CREATE PROCEDURE DeletePhongHoc(IN p_maPhong VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM PhongHoc WHERE p_maPhong = p_maPhong;
    COMMIT;
END //
DELIMITER ;

-- In phòng học
DELIMITER //
CREATE PROCEDURE PrintPhongHoc()
BEGIN
    SELECT * FROM PhongHoc;
END //
DELIMITER ;

-- Thêm phòng lớp
DELIMITER //
CREATE PROCEDURE AddPhongLop(
    IN p_maPhongLop VARCHAR(10),
    IN p_maPhong VARCHAR(10),
    IN p_maLop VARCHAR(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO PhongLop (pl_maPhongLop, p_maPhong, l_maLop) VALUES (p_maPhongLop, p_maPhong, p_maLop);
    COMMIT;
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE PhongLop SET p_maPhong = p_maPhong, l_maLop = p_maLop WHERE pl_maPhongLop = p_maPhongLop;
    COMMIT;
END //
DELIMITER ;

-- Xóa phòng lớp
DELIMITER //
CREATE PROCEDURE DeletePhongLop(IN p_maPhongLop VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM PhongLop WHERE pl_maPhongLop = p_maPhongLop;
    COMMIT;
END //
DELIMITER ;

-- In phòng lớp
DELIMITER //
CREATE PROCEDURE PrintPhongLop()
BEGIN
    SELECT * FROM PhongLop;
END //
DELIMITER ;

-- Thêm môn học
DELIMITER //
CREATE PROCEDURE AddMonHoc(
    IN p_maMon VARCHAR(10),
    IN p_tenMon VARCHAR(100),
    IN p_soTinChi INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO MonHoc (mh_maMon, mh_tenMon, mh_soTinChi) VALUES (p_maMon, p_tenMon, p_soTinChi);
    COMMIT;
END //
DELIMITER ;

-- Sửa môn học
DELIMITER //
CREATE PROCEDURE UpdateMonHoc(
    IN p_maMon VARCHAR(10),
    IN p_tenMon VARCHAR(100),
    IN p_soTinChi INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE MonHoc SET mh_tenMon = p_tenMon, mh_soTinChi = p_soTinChi WHERE mh_maMon = p_maMon;
    COMMIT;
END //
DELIMITER ;

-- Xóa môn học
DELIMITER //
CREATE PROCEDURE DeleteMonHoc(IN p_maMon VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM MonHoc WHERE mh_maMon = p_maMon;
    COMMIT;
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
    IN p_maDiem VARCHAR(10),
    IN p_maHS VARCHAR(10),
    IN p_maMon VARCHAR(10),
    IN p_diem FLOAT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO Diem (d_maDiem, hs_maHS, mh_maMon, d_diem) VALUES (p_maDiem, p_maHS, p_maMon, p_diem);
    COMMIT;
END //
DELIMITER ;

-- Sửa điểm
DELIMITER //
CREATE PROCEDURE UpdateDiem(
    IN p_maDiem VARCHAR(10),
    IN p_maHS VARCHAR(10),
    IN p_maMon VARCHAR(10),
    IN p_diem FLOAT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE Diem SET hs_maHS = p_maHS, mh_maMon = p_maMon, d_diem = p_diem WHERE d_maDiem = p_maDiem;
    COMMIT;
END //
DELIMITER ;

-- Xóa điểm
DELIMITER //
CREATE PROCEDURE DeleteDiem(IN p_maDiem VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM Diem WHERE d_maDiem = p_maDiem;
    COMMIT;
END //
DELIMITER ;

-- In điểm
DELIMITER //
CREATE PROCEDURE PrintDiem()
BEGIN
    SELECT * FROM Diem;
END //
DELIMITER ;

-- một số hàm tìm kiếm 

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

-- tìm hs theo hoten

DELIMITER //

CREATE PROCEDURE timKiemHocSinhTheoTen(
    IN p_hoTen VARCHAR(100)
)
BEGIN
    SELECT 
        hs.hs_maHS,
        hs.hs_hoTen,
        hs.l_maLop
    FROM 
        HocSinh hs
    WHERE 
        hs.hs_hoTen LIKE CONCAT('%', p_hoTen, '%');
END //

DELIMITER ;

-- tìm điểm của hs từ a - b theo ma lop và niên khóa 

DELIMITER //

CREATE PROCEDURE timKiemHocSinhTheoDiemVaLop(
    IN p_diemMin FLOAT,
    IN p_diemMax FLOAT,
    IN p_namHoc VARCHAR(10),
    IN p_maLop VARCHAR(10)
)
BEGIN
    SELECT 
        hs.hs_maHS,
        hs.hs_hoTen,
        hs.l_maLop,
        tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) AS DiemTrungBinh
    FROM 
        HocSinh hs
    WHERE 
        hs.l_maLop = p_maLop
    HAVING 
        DiemTrungBinh BETWEEN p_diemMin AND p_diemMax
    ORDER BY 
        DiemTrungBinh DESC;
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
    SET diemTrungBinh = (diemMieng + diem15Phut + diem1Tiet*2 + diemThi*3) / 7;
    RETURN diemTrungBinh;
END//

DELIMITER ;

-- inDiemTrungBinhTheoNamHoc cho từng môn học.
DELIMITER //

CREATE PROCEDURE inDiemTrungBinhTheoNamHoc(
    IN p_hs_maHS VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    DECLARE p_namHoc_truoc INT;
    DECLARE p_maLop VARCHAR(10);
    DECLARE p_khoi VARCHAR(2);

    -- Tách năm trước từ p_namHoc (ví dụ: "2023-2024" -> 2023)
    SET p_namHoc_truoc = CAST(SUBSTRING_INDEX(p_namHoc, '-', 1) AS UNSIGNED);

    -- Truy xuất mã lớp dựa trên mã học sinh và năm học trước
    SELECT hs.l_maLop 
    INTO p_maLop
    FROM HocSinh hs
    JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
    WHERE hs.hs_maHS = p_hs_maHS
      AND cn.cn_namHoc = CONCAT(p_namHoc_truoc, '-', p_namHoc_truoc + 1); -- Đảm bảo sử dụng niên khóa đúng

    -- Lấy khối từ mã lớp (2 ký tự đầu của mã lớp)
    SET p_khoi = LEFT(p_maLop, 2);

    -- Truy xuất điểm trung bình theo năm học và khối lớp
    SELECT mh.mh_tenMonHoc AS MonHoc,
           tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi) AS DiemTrungBinh
    FROM Diem d
    JOIN MonHoc mh ON d.mh_maMonHoc = mh.mh_maMonHoc
    WHERE d.hs_maHS = p_hs_maHS
      AND mh.mh_khoi = p_khoi;
END //

DELIMITER ;



-- tính điểm trung bình cả năm theo mã hs và niên khóa

DELIMITER //

CREATE FUNCTION tinhDiemTrungBinhCaNam(
    p_hs_maHS VARCHAR(10),
    p_namHoc VARCHAR(10)
) RETURNS FLOAT
    DETERMINISTIC
BEGIN
    DECLARE p_namHoc_truoc INT;
    DECLARE p_maLop VARCHAR(10);
    DECLARE p_khoi VARCHAR(2);
    DECLARE diemTrungBinhCaNam FLOAT;

    -- Tách năm trước từ p_namHoc (ví dụ: "2023-2024" -> 2023)
    SET p_namHoc_truoc = CAST(SUBSTRING_INDEX(p_namHoc, '-', 1) AS UNSIGNED);

    -- Truy xuất mã lớp của học sinh dựa trên mã học sinh và năm học (năm học trước)
    SELECT hs.l_maLop 
    INTO p_maLop
    FROM HocSinh hs
    JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
    WHERE hs.hs_maHS = p_hs_maHS
      AND cn.cn_namHoc = CONCAT(p_namHoc_truoc, '-', p_namHoc_truoc + 1); -- Đảm bảo sử dụng niên khóa đúng

    -- Lấy khối từ mã lớp (2 ký tự đầu của mã lớp)
    SET p_khoi = LEFT(p_maLop, 2);

    -- Tính điểm trung bình cả năm
    SELECT ROUND(SUM(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)) / COUNT(*), 2)
    INTO diemTrungBinhCaNam
    FROM Diem d
    JOIN MonHoc mh ON d.mh_maMonHoc = mh.mh_maMonHoc
    WHERE d.hs_maHS = p_hs_maHS
      AND mh.mh_khoi = p_khoi;

    RETURN diemTrungBinhCaNam;
END //

DELIMITER ;


-- in ds xl cả năm không sắp xếp

DELIMITER //

CREATE PROCEDURE inDanhSachXepLoaiCaNam(
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    SELECT 
        hs.hs_maHS,
        hs.hs_hoTen,
        tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) AS DiemTrungBinh,
        CASE
				WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 9 THEN 'Xuất Sắc'
				WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 8 THEN 'Giỏi'
				WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 6.5 THEN 'Khá'
				WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 5 THEN 'Trung Bình'
				WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 3.5 THEN 'Yếu'
				ELSE 'Kém'
        END AS XepLoai
    FROM HocSinh hs
    WHERE hs.l_maLop = p_maLop
      AND EXISTS (
          SELECT 1
          FROM ChuNhiem cn
          WHERE cn.l_maLop = hs.l_maLop
            AND cn.cn_namHoc = p_namHoc
      );
END //

DELIMITER ;

-- in ds xl cả năm có sắp xếp

DELIMITER //

CREATE PROCEDURE inDanhSachXepLoaiCaNam_SXep(
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    -- Trả về danh sách học sinh với điểm trung bình giảm dần và loại xếp hạng
    SELECT 
        hs.hs_maHS,
        hs.hs_hoTen,
        tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) AS DiemTrungBinh,
        CASE
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 9 THEN 'Xuất Sắc'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 8 THEN 'Giỏi'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 6.5 THEN 'Khá'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 5 THEN 'Trung Bình'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 3.5 THEN 'Yếu'
            ELSE 'Kém'
        END AS XepLoai
    FROM 
        HocSinh hs
    WHERE 
        hs.l_maLop = p_maLop
      AND EXISTS (
          SELECT 1
          FROM ChuNhiem cn
          WHERE cn.l_maLop = hs.l_maLop
            AND cn.cn_namHoc = p_namHoc
      )
    ORDER BY 
        DiemTrungBinh DESC;  -- Sắp xếp theo điểm trung bình giảm dần
END //

DELIMITER ;

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

    SELECT COUNT(*) INTO count_existing FROM Lop WHERE l_maLop = NEW.l_maLop;
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

    IF NEW.gv_maGV IS NULL THEN
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

    IF NEW.gv_maGV IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM GiaoVien WHERE gv_maGV = NEW.gv_maGV ;
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

DELIMITER //

-- Trigger cho bảng HocSinh
CREATE TRIGGER before_insert_HocSinh
BEFORE INSERT ON HocSinh
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.hs_maHS IS NULL OR NEW.l_maLop IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM HocSinh WHERE hs_maHS = NEW.hs_maHS and l_maLop = NEW.l_maLop;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

DELIMITER ;


DELIMITER //

CREATE TRIGGER before_update_HocSinh
BEFORE UPDATE ON HocSinh
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.hs_maHS IS NULL OR NEW.l_maLop IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM HocSinh WHERE hs_maHS = NEW.hs_maHS AND l_maLop = NEW.l_maLop;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_HocSinh
BEFORE DELETE ON HocSinh
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM HocSinh WHERE hs_maHS = OLD.hs_maHS AND l_maLop = OLD.l_maLop;
    IF count_existing = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

DELIMITER //

-- Trigger cho bảng ChuNhiem
CREATE TRIGGER before_insert_ChuNhiem
BEFORE INSERT ON ChuNhiem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.gv_maGV IS NULL OR NEW.l_maLop IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM ChuNhiem WHERE gv_maGV = NEW.gv_maGV AND l_maLop = NEW.l_maLop;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_ChuNhiem
BEFORE UPDATE ON ChuNhiem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.gv_maGV IS NULL OR NEW.l_maLop IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM ChuNhiem WHERE gv_maGV = NEW.gv_maGV AND l_maLop = NEW.l_maLop  AND (gv_maGV != OLD.gv_maGV OR l_maLop != OLD.l_maLop );
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_ChuNhiem
BEFORE DELETE ON ChuNhiem
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM ChuNhiem WHERE gv_maGV = OLD.gv_maGV AND l_maLop = OLD.l_maLop ;
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

    IF NEW.p_maPhong IS NULL OR NEW.p_soChoToiDa IS NULL THEN
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

    IF NEW.p_maPhong IS NULL OR NEW.p_soChoToiDa IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM PhongHoc WHERE p_maPhong = NEW.p_maPhong ;
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

    SELECT COUNT(*) INTO count_existing FROM PhongLop WHERE pl_maPhong = NEW.pl_maPhong AND l_maLop = NEW.l_maLop ;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_update_PhongLop
BEFORE UPDATE ON PhongLop
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;

    IF NEW.pl_maPhong IS NULL OR NEW.l_maLop IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể để giá trị là NULL';
    END IF;

    SELECT COUNT(*) INTO count_existing FROM PhongLop WHERE pl_maPhong = NEW.pl_maPhong AND l_maLop = NEW.l_maLop ;
    IF count_existing > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đã có dữ liệu này trong cơ sở dữ liệu';
    END IF;
END; //

CREATE TRIGGER before_delete_PhongLop
BEFORE DELETE ON PhongLop
FOR EACH ROW
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing FROM PhongLop WHERE pl_maPhong = OLD.pl_maPhong AND l_maLop = OLD.l_maLop ;
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

-- các thủ tục thống kê

DELIMITER //

CREATE PROCEDURE thongKeHSGTroLen(
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    SELECT hs.hs_maHS,
           hs.hs_hoTen,
           ROUND(AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)), 2) AS diemTrungBinh
    FROM HocSinh hs
    JOIN Diem d ON hs.hs_maHS = d.hs_maHS
    JOIN MonHoc mh ON d.mh_maMonHoc = mh.mh_maMonHoc
    WHERE hs.l_maLop = p_maLop
      AND EXISTS (
          SELECT 1
          FROM ChuNhiem cn
          WHERE cn.l_maLop = hs.l_maLop
            AND cn.cn_namHoc = p_namHoc
      )
    GROUP BY hs.hs_maHS, hs.hs_hoTen
    HAVING diemTrungBinh >= 8.0;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE thongKeYeuTroXuong(
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    SELECT hs.hs_maHS,
           hs.hs_hoTen,
           ROUND(AVG(tinhDiemTrungBinh(d.d_diemMieng, d.d_diem15Phut, d.d_diem1Tiet, d.d_diemThi)), 2) AS diemTrungBinh
    FROM HocSinh hs
    JOIN Diem d ON hs.hs_maHS = d.hs_maHS
    JOIN MonHoc mh ON d.mh_maMonHoc = mh.mh_maMonHoc
    WHERE hs.l_maLop = p_maLop
      AND EXISTS (
          SELECT 1
          FROM ChuNhiem cn
          WHERE cn.l_maLop = hs.l_maLop
            AND cn.cn_namHoc = p_namHoc
      )
    GROUP BY hs.hs_maHS, hs.hs_hoTen
    HAVING diemTrungBinh <= 5.0;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE thongKeTyLeXepLoaiCaNam(
    IN p_maLop VARCHAR(10),
    IN p_namHoc VARCHAR(10)
)
BEGIN
    DECLARE totalStudents INT;
    
    -- Tính tổng số học sinh trong lớp
    SELECT COUNT(*) INTO totalStudents
    FROM HocSinh hs
    JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
    WHERE hs.l_maLop = p_maLop
      AND cn.cn_namHoc = p_namHoc;
    
    -- In tỷ lệ xếp loại học sinh
    SELECT 
        CASE
            WHEN xepLoai = 'Xuất Sắc' THEN 'Xuất Sắc'
            WHEN xepLoai = 'Giỏi' THEN 'Giỏi'
            WHEN xepLoai = 'Khá' THEN 'Khá'
            WHEN xepLoai = 'Trung Bình' THEN 'Trung Bình'
            WHEN xepLoai = 'Yếu' THEN 'Yếu'
            ELSE 'Kém'
        END AS XepLoai,
        COUNT(*) AS SoLuong,
        ROUND((COUNT(*) / totalStudents) * 100, 2) AS TyLePhanTram
    FROM (
        SELECT hs.hs_maHS AS MaHocSinh,
               CASE
                   WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 9 THEN 'Xuất Sắc'
                   WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 8 THEN 'Giỏi'
                   WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 6.5 THEN 'Khá'
                   WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 5 THEN 'Trung Bình'
                   WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 3.5 THEN 'Yếu'
                   ELSE 'Kém'
               END AS xepLoai
        FROM HocSinh hs
        JOIN ChuNhiem cn ON hs.l_maLop = cn.l_maLop
        WHERE hs.l_maLop = p_maLop
          AND cn.cn_namHoc = p_namHoc
    ) AS XepLoaiHocSinh
    GROUP BY XepLoai;
END //

DELIMITER ;



-- hàm in toàn bộ điểm của niên khóa 

DELIMITER //

CREATE PROCEDURE inDanhSachXepLoaiCaNamtoanNienKhoa(
    IN p_namHoc VARCHAR(10)
)
BEGIN
    SELECT 
        hs.hs_maHS,
        hs.hs_hoTen,
        tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) AS DiemTrungBinh,
        CASE 
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 9 THEN 'Xuất Sắc'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 8 THEN 'Giỏi'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 6.5 THEN 'Khá'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 5 THEN 'Trung Bình'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 3.5 THEN 'Yếu'
            ELSE 'Kém'
        END AS XepLoai
    FROM 
        HocSinh hs
    WHERE 
        EXISTS (
            SELECT 1
            FROM ChuNhiem cn
            WHERE cn.l_maLop = hs.l_maLop
              AND cn.cn_namHoc = p_namHoc
        );
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE inDanhSachXepLoaiCaNamtoanNienKhoa_SXep(
    IN p_namHoc VARCHAR(10)
)
BEGIN
    SELECT 
        hs.hs_maHS,
        hs.hs_hoTen,
        tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) AS DiemTrungBinh,
        CASE 
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 9 THEN 'Xuất Sắc'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 8 THEN 'Giỏi'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 6.5 THEN 'Khá'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 5 THEN 'Trung Bình'
            WHEN tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) >= 3.5 THEN 'Yếu'
            ELSE 'Kém'
        END AS XepLoai
    FROM 
        HocSinh hs
    WHERE 
        EXISTS (
            SELECT 1
            FROM ChuNhiem cn
            WHERE cn.l_maLop = hs.l_maLop
              AND cn.cn_namHoc = p_namHoc
        )
    ORDER BY 
        DiemTrungBinh DESC;  -- Sắp xếp theo điểm trung bình giảm dần
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE inThongTinHSThuKhoaNienKhoa(
    IN p_namHoc VARCHAR(10)
)
BEGIN
    DECLARE maxDiem FLOAT;

    -- Bước 1: Tìm điểm trung bình cao nhất trong niên khóa
    SELECT MAX(tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc)) INTO maxDiem
    FROM HocSinh hs
    WHERE EXISTS (
        SELECT 1
        FROM ChuNhiem cn
        WHERE cn.l_maLop = hs.l_maLop
          AND cn.cn_namHoc = p_namHoc
    );

    -- Bước 2: In thông tin học sinh có điểm trung bình bằng maxDiem
    SELECT 
        hs.hs_maHS,
        hs.hs_hoTen,
        tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) AS DiemTrungBinh
    FROM 
        HocSinh hs
    WHERE 
        tinhDiemTrungBinhCaNam(hs.hs_maHS, p_namHoc) = maxDiem
        AND EXISTS (
            SELECT 1
            FROM ChuNhiem cn
            WHERE cn.l_maLop = hs.l_maLop
              AND cn.cn_namHoc = p_namHoc
        );
END //

DELIMITER ;




