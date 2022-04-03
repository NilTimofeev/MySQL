DROP DATABASE IF EXISTS booking;
CREATE  DATABASE booking;
USE booking;

/* База предоставляет информацию о свободных номерах в отелях, описание отелей, отзывы посетителей.
 * Пользователь получает список отелей города с описанием. Выбирает отель и получает список свободных номеров на интересующую дату */


/* Пользователи. Достаточно хранить емейл и пароль. Для пользования сервисом не обязательно заполнять информацию о себе. */
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	email VARCHAR(120) NOT NULL UNIQUE,
	pass VARCHAR(100) NOT NULL UNIQUE
);


/* Профили пользователей. */
DROP TABLE IF EXISTS users_profiles;
CREATE TABLE user_profiles(
	user_id BIGINT UNSIGNED NOT NULL,
	firstname VARCHAR(50),
    lastname VARCHAR(50),
    phone BIGINT,
    gender CHAR(1),
    birthday DATE,
    created_at DATETIME DEFAULT NOW(),
    INDEX idx_users (user_id),
    FOREIGN KEY fk_user_id_from_us_profiles (user_id) REFERENCES users(id)
    	ON DELETE CASCADE ON UPDATE CASCADE
);


/* Отели. Только идентификатор и город. Этого достаточно для первой выборки, которую делает пользователь. Получим отели со свободными номерами. 
 * С результатом обратимся к таблице hotels_profiles и другим, связанным с ней таблицам, для получения подробного описания отелей */
DROP TABLE IF EXISTS hotels;
CREATE TABLE hotels(
	id SERIAL PRIMARY KEY,
	hometown VARCHAR(120),
	INDEX idx_hometown (hometown)
);


/* Номера. Запись седержит идентификатор и ссылку на отель */
DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms(
	id SERIAL PRIMARY KEY,
	hotel_id BIGINT UNSIGNED NOT NULL,
	INDEX idx_of_hotel_id (hotel_id),
	FOREIGN KEY fk_hotel_id_from_rooms (hotel_id) REFERENCES hotels(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);


/* Бронирования. Даты въезда и выселения*/
DROP TABLE IF EXISTS booking;
CREATE TABLE booking(
	id SERIAL PRIMARY KEY,
	room_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	entry_at DATETIME DEFAULT NOW(),
	departure_at DATETIME DEFAULT NOW(),
	FOREIGN KEY fk_room_id_from_booking (room_id) REFERENCES rooms(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY fk_user_id_from_booking (user_id) REFERENCES users(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);


/* Создадим таблицу для хранения устаревших броней. Можно удалять или хранить для статистики. Будем хранить */
DROP TABLE IF EXISTS old_booking;
CREATE TABLE old_booking(
	id BIGINT UNSIGNED NOT NULL,
	room_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	entry_at DATETIME NOT NULL,
	departure_at DATETIME NOT NULL
) ENGINE=Archive;


/* Типы отелей. Все возможные типы будут в этой таблице */
DROP TABLE IF EXISTS types_hotels;
CREATE TABLE types_hotels(
	id SERIAL PRIMARY KEY,
	type_hotel VARCHAR(50)
);


/* Профили отелей. Имя, адрес, тип, описание. Всё выносим сюда */
DROP TABLE IF EXISTS hotels_profiles;
CREATE TABLE hotels_profiles(
	hotel_id BIGINT UNSIGNED NOT NULL,
	hotel_name VARCHAR(120),
	addres VARCHAR(150),
	description TEXT,
	type_hotel BIGINT UNSIGNED NOT NULL,
	INDEX idx_of_hotel_id (hotel_id),
	FOREIGN KEY fk_hotel_id_from_hotels_profiles (hotel_id) REFERENCES hotels(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY fk_hotel_type_from_hotels_profiles (type_hotel) REFERENCES types_hotels(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);


/* Отзывы пользователей об отелях, содержат отзыв и оценку */
DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews(
	user_id BIGINT UNSIGNED NOT NULL,
	hotel_id BIGINT UNSIGNED NOT NULL,
	review TEXT,
	rating TINYINT NOT NULL,
	INDEX idx_of_hotel_id (hotel_id),
	FOREIGN KEY fk_user_id_from_reviews (user_id) REFERENCES users(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY fk_hotel_id_from_reviews (hotel_id) REFERENCES hotels(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);


/* Пользователь может добавить отель в список, чтобы не потерять его */
DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	user_id BIGINT UNSIGNED NOT NULL,
	hotel_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (hotel_id, user_id),
	FOREIGN KEY fk_user_id_from_likes (user_id) REFERENCES users(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY fk_hotel_id_from_likes (hotel_id) REFERENCES hotels(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);


/* Все каритнки на сайте относятся к описнию отеля. Поэтому каждая запись содержит идентификатор отеля */
DROP TABLE IF EXISTS images;
CREATE TABLE images(
	hotel_id BIGINT UNSIGNED NOT NULL,
	filename VARCHAR(255),
	created_at DATETIME DEFAULT NOW(),
	INDEX idx_of_hotel_id (hotel_id),
	FOREIGN KEY fk_hotel_id_from_images (hotel_id) REFERENCES hotels(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);
