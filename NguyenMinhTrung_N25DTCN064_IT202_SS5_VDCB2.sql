-- Phân tích: Nguyên nhân khiến đoạn code trên sai dữ liệu ở quận 1 là do vận dụng sai điều kiện đặc biệt quan hệ ưu tiên giữa and và or 
-- bởi vì bản chất trong SQL thì toán tử and được ưu tiên cao hơn toán tử or chính vì thế SQL sẽ so sánh điều kiện ở quận 3 trước nên quận
-- 3 sẽ đúng điều kiện còn nếu xuất hiện quận 1 thì nó trả về luôn bản ghi chứa quận 1 chứ không xét đến điều kiện rating cho quận 1 vì thế
-- dữ liệu quận 1 bị sai

-- Thực thi:
CREATE DATABASE restaurant_db;
USE restaurant_db;

CREATE TABLE restaurants (
	id int auto_increment primary key,
    name varchar(255) not null,
    address varchar(255) not null,
    rating decimal(2,1),
    create_at timestamp default current_timestamp
);

INSERT INTO restaurants (name, address, rating, create_at) VALUES ('A', 'Quận 1', 2.1, '2000-01-20 12:30:32'), 
('B', 'Quận 2', 4.1, '2001-01-20 12:30:32'), ('C', 'Quận 3', 4.1, '2002-01-20 12:30:32'), ('D', 'Quận 1', 4.2, '2003-01-20 12:30:32'),
('E', 'Quận 3', 2.9, '2004-01-20 12:30:32'), ('F', 'Quận 3', 5.1, '2005-01-20 12:30:32'), ('G', 'Quận 1', 1.1, '2006-01-20 12:30:32'), 
('H', 'Quận 9', 5.1, '2007-01-20 12:30:32');

-- Em vận dụng cách sắp xếp danh sách truy vấn được để có thể đưa 5 quán mới lên sàn gần nhất để hiển thị ra banner cho người khi kế
-- hợp với limit
SELECT * FROM restaurants 
ORDER BY create_at DESC
LIMIT 5;