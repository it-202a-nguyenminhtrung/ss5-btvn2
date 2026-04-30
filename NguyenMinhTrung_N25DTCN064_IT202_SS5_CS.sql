-- Thiết kế I/O và luồng: Dữ liệu đầu vào gồm có: Bảng cơ sở dữ liệu quản lý shipper, bảng (Thực thể) shipper gồm các thuộc tính: Id, name,
-- status, trust_score, min_trust_score, distance_km. 
-- Đoạn logic dùng để kiểm tra và chặn bẫy điểm âm trước khi gọi SQL:
-- if(min_trust_score < 0){
-- 		span.textConte = `Lỗi điểm tin cậy thấp nhất nhỏ hơn 0 vui lòng chọn lại`;
-- }

CREATE DATABASE shipper_db;
USE shipper_db;

CREATE TABLE shippers (
	id int auto_increment primary key,
    name varchar(255),
    status enum ('Available', 'Unavailable') default 'Available',
    trust_score tinyint default 100 check(trust_score BETWEEN 85 AND 100),
    min_trust_score tinyint default 80 check(min_trust_score >= 80),
    distance_km decimal (10,1)
);

INSERT INTO shippers (name, distance_km) VALUES ('Nguyen Van A', 10.2), ('Nguyen Van B', 3.4), ('Nguyen Van C', 5.9),
('Nguyen Van D', 9.0), ('Tran Thi A', 2.1), ('Tran Thi D', 4.4), ('Phan Van A', 11.2), ('Phan Van B', 20.2), ('Phan Van C', 15.2);

INSERT INTO shippers (name, status, distance_km) VALUES ('Tran Thi B', 'Unavailable', 2.1), ('Tran Thi C', 'Unavailable',  2.8);

INSERT INTO shippers (name, distance_km) VALUES ('Tran Thi D', 4.4), ('Phan Van A', 11.2), ('Phan Van B', 20.2), ('Phan Van C', 15.2);

SELECT * FROM shippers
WHERE status = 'Available' AND trust_score >= 80
ORDER BY distance_km ASC, trust_score DESC;