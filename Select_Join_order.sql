--08-05-2020
---TAIWO AKINGBOYE-----
--1--
SELECT date_borrow,date_return,title,fname,lname
FROM borrows w JOIN book b ON w.id_book= b.id_book JOIN author a ON b.id_aut=a.id_aut
ORDER BY date_borrow;

--2--
SELECT borrows.date_borrow,reader.fname,reader.lname
FROM borrows  JOIN reader  ON borrows.id_reader=reader.id_reader
WHERE date_borrow > '31-Dec-2015';

---3---

SELECT reader.fname || ' ' ||reader.lname "Dane Czytelnika",book.title,author.lname,author.fname,type.name
FROM reader  JOIN borrows  ON borrows.id_reader=reader.id_reader
JOIN book ON borrows.id_book=book.id_book 
JOIN author ON author.id_aut=book.id_aut
JOIN type ON type.id_type=book.id_type
ORDER BY "Dane Czytelnika";

--4--
SELECT book.title, publishinghouse.name,borrows.date_borrow
FROM book  JOIN publishinghouse  ON book.id_ph=publishinghouse.id_ph
JOIN borrows ON borrows.id_book=book.id_book 
WHERE borrows.date_borrow > add_months(borrows.date_borrow,-5)
ORDER BY borrows.date_borrow DESC;

----5---
SELECT book.title,author.fname,author.lname
FROM book JOIN author ON book.id_aut=author.id_aut 
JOIN borrows ON borrows.id_book=book.id_book
JOIN reader ON reader.id_reader=borrows.id_reader
WHERE reader.city = 'CRACOW' OR reader.city = 'WARSZAWA' ;

----6---
SELECT reader.lname NAZWISKO ,COUNT(borrows.id_book) LICZBA_WYP, SUM(book.price) Cena
FROM  borrows JOIN reader ON reader.id_reader=borrows.id_reader
JOIN book ON book.id_book=borrows.id_book
GROUP BY reader.lname
ORDER BY Cena DESC;

--7--
SELECT reader.city, COUNT(borrows.id_book) "ksi??ek wypo?yczonych"
FROM   borrows JOIN reader ON reader.id_reader=borrows.id_reader
JOIN book ON book.id_book=borrows.id_book
GROUP BY reader.city
ORDER BY "ksi??ek wypo?yczonych" DESC;

---8--
SELECT reader. fname ||' '||reader.lname || '-' || reader.street || ',' || reader.city "READER Details"  ,
book.title, author.fname || ' ' || author.lname "Auhtor's Name"
FROM  borrows JOIN reader ON reader.id_reader=borrows.id_reader
JOIN book ON book.id_book=borrows.id_book JOIN author ON author.id_aut=book.id_aut
WHERE borrows.date_return > SYSDATE;

--9--
SELECT  author.country, COUNT(book.id_book) "Number of books", SUM(book.pages) TOTAL_PAGES
FROM  book JOIN author ON book.id_aut=author.id_aut
WHERE book.price BETWEEN 20 AND 35
GROUP BY author.country;

--10--
SELECT author.fname || ' ' || author.lname "Author Name", book.price Max_Price
FROM book JOIN author ON author.id_aut=book.id_aut
WHERE book.price=(SELECT MAX(book.price) FROM book);

---11--
SELECT reader.fname || ' ' || reader.lname READER,
author.fname || ' ' || author.lname AUTHOR,
publishinghouse.name Publication
FROM reader JOIN borrows ON reader.id_reader=borrows.id_reader
JOIN book ON book.id_book=borrows.id_book
JOIN author ON author.id_aut = book.id_aut
JOIN publishinghouse ON publishinghouse.id_ph=book.id_ph
WHERE book.pages > 100;

---12--
SELECT COUNT(book.id_book) "liczba ksiazek", type.name "Genre"
FROM book JOIN type ON book.id_type=type.id_type
GROUP BY type.name;

----13----
SELECT LPAD(reader.fname, 15, '.') || '........' || RPAD(reader.lname, 15, '.') "czytelnicy biblioteki"
FROM reader;

