--Taiwo Akingboye 25-04-2020
--2--
SELECT id_ph || '-' || name "Dane_wydawnictwa"
FROM publishinghouse
WHERE publishinghouse.name LIKE '%a%' OR publishinghouse.name LIKE '%A%';

--2--
SELECT "Dane_wydawnictwa"
FROM

(
SELECT  name AS "Dane_wydawnictwa"
FROM publishinghouse 
WHERE publishinghouse.name LIKE '%a%' OR publishinghouse.name LIKE '%A%'


UNION ALL

SELECT CAST( id_ph AS VARCHAR2(20))
FROM publishinghouse
WHERE publishinghouse.name LIKE '%a%' OR publishinghouse.name LIKE '%A%'

) 
;

--3--
SELECT  id_borrows,date_borrow,date_return
FROM borrows
WHERE borrows.date_borrow > '31-DEC-2019'; 


--4--
SELECT id_reader,fname "Firstname", lname "Surname" ,city,street,telephone
FROM reader
WHERE  reader.lname LIKE '%A%' OR reader.lname LIKE 'I%';

--5--
SELECT title, pages
FROM book
WHERE  LENGTH (book.title) > 15 AND (book.price BETWEEN 100 AND 150) ;


--6--
SELECT title TYTU? , price "CENA KSI??KI" ,pages "Liczba stron"
FROM book;

--7--
SELECT  lname || ' ' || fname  AS "DANE CZYTELNIKA"
FROM reader 
ORDER BY reader.lname, reader.fname ASC;


--8--
SELECT  *
FROM borrows
ORDER BY date_borrow DESC;


--9--
SELECT title As "Tytul Z MAX"
FROM book
WHERE book.pages=(SELECT MAX(book.pages) FROM book) ;

--10--
SELECT  lname || ' ' || fname  AS "DANE CZYTELNIKA"
FROM reader 
WHERE reader.city LIKE '%WARSZAWA%' AND reader.telephone LIKE '%9%';

--11--
SELECT  *
FROM author 
WHERE country != 'USA' 
ORDER by id_aut DESC;

--12--
SELECT  COUNT(country) "COUNTER", country 
FROM author
GROUP BY country 
ORDER BY counter
--FETCH FIRST ROW ONLY
FETCH NEXT 5 ROWS ONLY;


--13--
SELECT  COUNT(pages) AS "ksi??ek wi?cej ni? 300 stron"
FROM book
WHERE pages > 300;


--14--
SELECT  COUNT(DISTINCT id_type) AS "Gatunków Ksi??ek"
FROM book;


--15--
SELECT  CAST (AVG (book.price ) AS DECIMAL(10,2)) AS "?redni? Cen? Ksi??ek",id_ph AS "Wydawnictwa"
FROM book
GROUP BY id_ph;



