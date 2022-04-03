/* ��������� ���������� ������ � ������� ������ ��� ������� �����. ����� ����� ������������ �� id ������.
 * ����� ������ ����������� ��� ���� �������. �� ����� ������ ���������� ������ JOIN. ���������� ������ �������� */

/* ������ �������. ������ ������� �������, ���������� ���������� ������� �����.*/
-- ������� ����� ���������� ������ ��� ������� ����� 
SELECT hotel_id, COUNT(*) FROM likes
GROUP BY hotel_id;

-- ������� ������ ��� ������� ����� */
SELECT hotel_id, AVG(rating) FROM reviews
GROUP BY hotel_id;


/* ������ �������. ������� ������������� � ������������ ��� ������ ������� � ������� �� */
DROP VIEW IF EXISTS hotels_likes;
CREATE OR REPLACE VIEW hotels_likes AS
SELECT hotel_id, COUNT(*) cnt_likes FROM likes
	GROUP BY hotel_id;

DROP VIEW IF EXISTS hotels_reviews;
CREATE OR REPLACE VIEW hotels_reviews AS
SELECT hotel_id, AVG(rating) rating FROM reviews
	GROUP BY hotel_id;

SELECT h.id, hl.cnt_likes, hr.rating FROM hotels h
LEFT JOIN hotels_likes hl ON hl.hotel_id = h.id 
LEFT JOIN hotels_reviews hr ON hr.hotel_id = h.id;


/* ������ �������. �������� ��������� �������. ����� ������� ������, ���� ������ �����. �������� ���������� ����������� � ���. */

DROP TEMPORARY TABLE IF exists tmp_likes;
CREATE TEMPORARY TABLE tmp_likes 
(PRIMARY KEY (hotel_id))
SELECT hotel_id, COUNT(*) AS cnt_likes FROM likes
GROUP BY hotel_id;

DROP TEMPORARY TABLE IF exists tmp_reviews;
CREATE TEMPORARY TABLE tmp_reviews
(PRIMARY KEY (hotel_id))
SELECT hotel_id, AVG(rating) AS rating FROM reviews
GROUP BY hotel_id;

SELECT hotels.id, tl.cnt_likes, tr.rating FROM hotels
LEFT JOIN tmp_likes tl ON hotels.id = tl.hotel_id
LEFT JOIN tmp_reviews tr ON hotels.id = tr.hotel_id;


/* ��������� �������, ��������� � 8 ������ MySQL, CTE */

WITH 
	hotels_id AS (
		SELECT id FROM hotels
	),
	hotels_likes AS (
		SELECT hotel_id, COUNT(*) likes FROM likes
		GROUP BY hotel_id
	),
	hotels_ratings AS (
		SELECT hotel_id, AVG(rating) rating FROM reviews
		GROUP BY hotel_id
	)
SELECT h_id.id, hl.likes, hr.rating FROM hotels_id h_id
LEFT JOIN hotels_likes hl ON h_id.id = hl.hotel_id 
LEFT JOIN hotels_ratings hr ON h_id.id = hr.hotel_id;








/* ������� ������ - ����� �����, � ������� ���� ��������� ������. ����� ������������� � ���������� � �� �� ����, ������� ����� >= � <=.
 * ������������ �������� ���� � �����. ������� ������ ������ � ���������� ��������� ������� � ������.
 * ��������� ���������� �� ������, �������, ����� */

WITH 
	free_hotels AS (
	SELECT COUNT(rooms.id) AS cnt_rooms, hotel_id
	FROM rooms 
	LEFT JOIN booking ON
	(
		booking.room_id = rooms.id AND 
			NOT ( 
				(booking.entry_at <= '2020.12.04' and booking.departure_at <= '2020.12.04') 
				OR
				(booking.entry_at >= '2020.12.08' and booking.departure_at >= '2020.12.08') 
				)
	) 
	JOIN hotels ON hotels.hometown = 'Moscow' AND rooms.hotel_id = hotels.id
	WHERE booking.room_id IS NULL
	GROUP BY hotels.id
	),
	hotels_likes AS (
		SELECT hotel_id, COUNT(*) likes FROM likes
		GROUP BY hotel_id
	),
	hotels_ratings AS (
		SELECT hotel_id, AVG(rating) rating FROM reviews
		GROUP BY hotel_id
	)
SELECT hp.*, fh.cnt_rooms, hl.likes, hr.rating FROM free_hotels fh
JOIN hotels_profiles hp ON hp.hotel_id = fh.hotel_id
LEFT JOIN hotels_likes hl ON fh.hotel_id = hl.hotel_id 
LEFT JOIN hotels_ratings hr ON fh.hotel_id = hr.hotel_id;

-- SHOW TABLE status;




												/* ���������� */

-- ��� ������, � ������� ��������� ���� �����, ���������� � �����. ����� ����� ������� ������ �� ������� ������
START TRANSACTION;
	INSERT INTO old_booking SELECT * FROM booking WHERE departure_at < date_sub(NOW(),INTERVAL 1 DAY);
	DELETE FROM booking WHERE departure_at < date_sub(NOW(),INTERVAL 1 DAY);
COMMIT;

-- ������������ ����� �������� ��� ���������� � ����. ������ ����� �� ���������. �������� ����������� ������ ��������������. ������� � ��� �������

START TRANSACTION;
INSERT INTO hotels VALUES (DEFAULT, 'Moscow');
SET @last_id = last_insert_id();
INSERT INTO hotels_profiles VALUES (@last_id, '���-����', "807-4075 Aenean Rd.", '����� � ������, ����� ������, ���� ���', 2);
COMMIT;

SELECT @last_id;
DELETE FROM hotels WHERE id=6;
												/* �������� */

-- ���� ��������� �� ������ ���� ������ ���� ���������
DROP TRIGGER IF EXISTS validate_date_booking_insert;
CREATE TRIGGER validate_date_booking_insert BEFORE INSERT ON booking
FOR EACH ROW
BEGIN 
	IF NEW.entry_at > NEW.departure_at THEN 
		SIGNAL SQLSTATE '45000'
		SET message_text ="Entry is later than departure. It's impossible";
	END IF;
END











