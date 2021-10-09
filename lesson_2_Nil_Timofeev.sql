/* 1.Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, 
 который указывался при установке.
 
-- Файл my.cnf размещается в папке windows.Его содержимое:
[client]
user=root
password=1234
*/



/* 2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.*/

CREATE DATABASE example;
USE example;
CREATE TABLE users (id SERIAL, name VARCHAR(50) NOT NULL);
INSERT INTO users (id, name) VALUES (1, 'User1'), (2, 'User2'), (3, 'User3');



/* 3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.*/

-- C:\Users\Professional>mysqldump example > example_dump
CREATE DATABASE sample;
-- C:\Users\Professional>mysql sample < example_dump



/* 4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword
 базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.*/
 
 -- C:\Users\Professional>mysqldump --where="true limit 100" mysql help_keyword > 100_rows
