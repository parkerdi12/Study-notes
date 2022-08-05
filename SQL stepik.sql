-- EXERCISE 1 Создание таблицы и типы данных

CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, -- целое число, для primary key каждый след. знач +1
    title VARCHAR(50), -- текстовый (50 символов)
    author VARCHAR(30), -- текстовый (30 символов)
    price DECIMAL(8, 2), -- до запятой 8 чисел, после запятой 2 
    amount INT -- целое число 
);

-- EXERCISE 2 Записи в таблице

INSERT INTO book (title, author, price, amount) -- INSERT INTO таблица(поле1, поле2, поле3, поле4)
VALUES ("Мастер и Маргарита", "Булгаков М.А.", "670.99", "3"); -- VALUES("значение1", "значение 2", "значение3", "значение4");

-- EXERCISE 3 Добавляем несколько записей в таблицу

INSERT INTO book (title, author, price, amount)
VALUES ("Белая гвардия", "Булгаков М.А.", "540.50", "5");

INSERT INTO book (title, author, price, amount)
VALUES ("Идиот", "Достоевский Ф.М.", "460.00", "10");

INSERT INTO book (title, author, price, amount)
VALUES ("Братья Карамазовы", "Достоевский Ф.М.", "799.01", "2");

-- решение короче

INSERT INTO book (title, author, price, amount)
VALUES ("Белая гвардия", "Булгаков М.А.", "540.50", "5"),
("Идиот", "Достоевский Ф.М.", "460.00", "10"),
 ("Братья Карамазовы", "Достоевский Ф.М.", "799.01", "2");

-- EXERCISE 4 Выборка определенных столбцов

SELECT author, title, price FROM book;

-- EXERCISE 5 Выборка новых столбцов и присвоение им новых имен

SELECT title AS Название, author AS Автор -- AS = В КАЧЕСТВЕ
FROM book;

-- EXERCISE 6 Выборка данных с созданием вычисляемого столбца

SELECT title, amount,
    amount * 1.65 AS pack -- amount (кол-во книг) * 1.65 (стоимость одного листа упаковки - на одну книгу уходит 1 лист)
FROM book;

-- EXERCISE 7  Вывести автора, название  и цены тех книг, количество которых меньше 10.

SELECT author, title, price
FROM book
WHERE amount < 10;

-- EXERCISE 8 Вывести название, автора,  цену  и количество всех книг, цена которых меньше 500 или больше 600, а стоимость всех экземпляров этих книг больше или равна 5000.

SELECT title, author, price, amount 
FROM book
WHERE (price < 500 OR price > 600) 
    AND (price * amount) >= 5000; 

-- EXERCISE 9 Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),  а количество или 2, или 3, или 5, или 7 .

SELECT title, author
FROM book 
WHERE (price BETWEEN 540.50 AND 800) AND (amount IN ("2", "3", "5", "7")) -- BETWEEN - между "значение1" и "значение2" -- IN - включает в себя "значение1", "значение2", .....,

-- EXERCISE 10 Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы). 
-- Информацию  отсортировать сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту).

SELECT author, title 
FROM book 
WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title  -- ORDER BY - сортировка (числовая и алфавитная), DESC - в обратном порядке

-- EXERCISE 11  -- Вывести название и автора тех книг, название которых состоит из двух и более слов, а инициалы автора содержат букву «С». Считать, что в названии слова отделяются друг от друга пробелами и не содержат знаков препинания, между фамилией автора и инициалами обязателен пробел, 
-- инициалы записываются без пробела в формате: буква, точка, буква, точка. Информацию отсортировать по названию книги в алфавитном порядке.

SELECT title, author       
FROM book 
WHERE title LIKE '_% _%'
    AND (author LIKE "% С._." OR author LIKE "% _.С.")
ORDER BY title;

-- EXERCISE 12 

____________________________

Задача: https://i.imgur.com/iQbtewk.png 

SELECT
Client.ClientID, MAX(Client.FirstName) AS FirstName,
MAX(Client.LastName) AS LastName, COUNT(Orders.OrderID) AS AmountOrder
FROM Client
INNER JOIN Orders ON Client.ClientID = Orders.ClientID
WHERE Orders.OrderDate BETWEEN '2015-01-01' AND '2015-12-31'
GROUP BY Client.ClientID
HAVING COUNT(Orders.OrderID) < 25
ORDER BY COUNT(Orders.OrderID) DESC


----------------------- JOIN SQL

SELECT client.id, client.Firstname, client.Lastname, client.age 
FROM client LEFT JOIN customer ON client.id = customer.id

-------------------------- INNER JOIN 

--Вывести название, жанр и цену тех книг, количество которых больше 8, в отсортированном по убыванию цены виде.

SELECT title, name_genre, price 
FROM book INNER JOIN genre 
ON book.genre_id = genre.genre_id
WHERE book.amount > 8 
ORDER BY price DESC

------ Вывести все жанры, которые не представлены в книгах на складе.

SELECT name_genre
FROM genre LEFT JOIN book 
ON book.genre_id = genre.genre_id
WHERE title IS NULL --- при сравнении с NULL писать "= NULL" нельзя

---------------------













