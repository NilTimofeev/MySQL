
INSERT INTO users
VALUES
  (DEFAULT, "nunc@hotmail.com", 'b6589fc6ab0dc82cf12099d1c2d40ab994e8410c'),
  (DEFAULT, "pharetra@outlook.edu", '356a192b7913b04c54574d18c28d46e6395428ab'),
  (DEFAULT, "eleifend.vitae@google.net", 'da4b9237bacccdf19c0760cab7aec4a8359010b0'),
  (DEFAULT, "aenean.gravida.nunc@yahoo.com", '77de68daecd823babbb58edb1c8e14d7106e83bb'),
  (DEFAULT, "orci@icloud.ca", '1b6453892473a467d07372d45eb05abc2031647a'),
  (DEFAULT, "sapien.cras@protonmail.org", 'ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4'),
  (DEFAULT, "morbi.non@yahoo.net", 'c1dfd96eea8cc2b62785275bca38ac261256e278'),
  (DEFAULT, "cras.interdum@aol.ca", '902ba3cda1883801594b6e1b452790cc53948fda'),
  (DEFAULT, "sed.dictum@aol.ca", 'fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f'),
  (DEFAULT, "justo.eu@protonmail.net", '0ade7c2cf97f75d009975f4d720d1fa6c19f4897');
 
 
INSERT INTO user_profiles
VALUES
  (1, "Vance", "Camacho", 15047668304, "m", '1990-12-01', DEFAULT),
  (2, "Maia", " Mccullough", 9583123479, "f", '2002-12-11', DEFAULT),
  (3, "Steven", " Watts", 8437766754, "m", '1966-05-01', DEFAULT),
  (4, "Latifah", " Wyatt", 2675165366, "f", '1974-03-22', DEFAULT),
  (5, "Yeo", " Hancock", 6562789322, "m", '2008-07-05', DEFAULT),
  (6, "Lev", " Craig", 1546035712, "m", '1994-11-11', DEFAULT),
  (7, "Devin", " Hart", 6464827440, "m", '1992-09-11', DEFAULT),
  (8, "Velma", " Saunders", 7946887478, "f", '2011-09-04', DEFAULT),
  (9, "MacKensie", " Frye", 5154279452, "m", '1991-04-16', DEFAULT),
  (10, "TaShya", " Glenn", 16165378636, "f", '1984-02-22', DEFAULT);
  
 DELETE FROM user_profiles;

INSERT INTO hotels 
VALUES (DEFAULT, 'Moscow'), (DEFAULT, 'Moscow'), (DEFAULT, 'Moscow'), (DEFAULT, 'Moscow'), (DEFAULT, 'Moscow');


INSERT INTO types_hotels 
VALUES (DEFAULT, 'apartments'), (DEFAULT, 'hostel'), (DEFAULT, 'guest house'), (DEFAULT, 'hotel'), (DEFAULT, 'camping');


INSERT INTO hotels_profiles 
VALUES
  (1, 'Сан-ремо', "807-4075 Aenean Rd.", 'тихий и уютный, самый лучший, ждем вас', 2),
  (2, 'Космос', "7358 Dui Ave", 'тихий и уютный, самый лучший, ждем вас', 2),
  (3, 'Покровское-Стрешнево', "4844 Eu Ave", 'тихий и уютный, самый лучший, ждем вас', 2),
  (4, 'Бегемот', "674-3373 Lectus Av.", 'тихий и уютный, самый лучший, ждем вас', 4),
  (5, 'Moscow', "809-6891 Vitae Avenue", 'тихий и уютный, самый лучший, ждем вас', 4);
 
 
 INSERT INTO rooms 
 VALUES (DEFAULT, 1), (DEFAULT, 5), (DEFAULT, 3), (DEFAULT, 4), (DEFAULT, 4), (DEFAULT, 2), (DEFAULT, 3), (DEFAULT, 5), (DEFAULT, 1), (DEFAULT, 1);


INSERT INTO booking VALUES
	(DEFAULT, 1, 7, '2020-12-1', '2020-12-3'), -- 1-3
	(DEFAULT, 1, 6, '2020-12-4', '2020-12-5'), -- 4-5
	(DEFAULT, 1, 1, '2020-12-8', '2020-12-11'), -- 8-11
	(DEFAULT, 7, 4, '2020-12-2', '2020-12-3'), -- 2-3
	(DEFAULT, 7, 9, '2020-12-10', '2020-12-11'), -- 10-11
	(DEFAULT, 8, 3, '2020-12-3', '2020-12-10'), -- 3-10
	(DEFAULT, 2, 2, '2020-12-4', '2020-12-6'),  -- 4-6
	(DEFAULT, 2, 5, '2020-12-10', '2020-12-11'), -- 10-11
	(DEFAULT, 5, 8, '2020-12-5', '2020-12-8'), -- 5-8
	(DEFAULT, 5, 10, '2020-12-11', '2020-12-13'); -- 11-13
	
INSERT INTO booking VALUES
	(DEFAULT, 1, 7, '2020-10-1', '2020-10-3'),
	(DEFAULT, 1, 7, '2020-08-1', '2020-08-3'),
	(DEFAULT, 1, 7, '2020-03-1', '2020-03-3');

INSERT INTO images VALUES (1, 'img_343454.jpg', DEFAULT), (1, 'img_44554.jpg', DEFAULT), (1, 'img_89454.jpg', DEFAULT), (5, 'img_390078754.jpg', DEFAULT), (5, 'img_34378524.jpg', DEFAULT), 
	(4, 'img_32254454.jpg', DEFAULT), (4, 'img_343875.jpg', DEFAULT), (2, 'img_355554.jpg', DEFAULT), (3, 'img_3466654.jpg', DEFAULT), (2, 'img_343884.jpg', DEFAULT);


INSERT INTO likes VALUES (9, 1), (4, 1), (5, 3), (9, 2), (7, 3), (4, 2), (9, 4), (7, 1), (5, 2), (1, 4);

INSERT INTO reviews VALUES
	(1, 5, 'fgthyy gmktk6t ddfgh  h j fgtht fgh', 9),
	(1, 3, 'ttyl kkut dsscfcf jkky', 4),
	(2, 5, 'wrtghth ghjt', 10),
	(7, 1, 'sdsdd gh hjyj muyj mmkjk  hhh', 8),
	(6, 1, 'rtgth huyhr yjj', 7);









