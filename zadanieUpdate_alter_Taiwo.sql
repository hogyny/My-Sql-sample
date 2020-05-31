-----assignment--Taiwo Akingboye 31-05-2020, update/alter/modify
-------number1-----
ALTER TABLE book
MODIFY 
    pages NUMBER(5) ;
    
ALTER TABLE book
    ADD CONSTRAINT check_constraint_price CHECK (price > 0); 
    
ALTER TABLE author
MODIFY (lname  NOT NULL);


------number2----
ALTER TABLE reader
ADD email varchar(100);

-----number3----
ALTER TABLE reader
MODIFY 
    city VARCHAR(50) ;
    
------number4-----
ALTER TABLE reader 
DROP COLUMN street;

-----number5------
UPDATE book
SET price = price + 20
WHERE book.id_ph in (SELECT publishinghouse.id_ph
FROM publishinghouse 
WHERE publishinghouse.name LIKE '%a%' );

------number 6------
UPDATE stanowiska
SET pensja = pensja * 0.90
WHERE stanowiska.id_stan in (SELECT pracownicy.id_stan
FROM pracownicy 
WHERE pracownicy.data_zat > SYSDATE );

------number 7--------
UPDATE stanowiska
SET pensja = pensja + (pensja * (50/100))
WHERE stanowiska.id_stan in (SELECT pracownicy.id_stan
FROM pracownicy  );

------number8-----
UPDATE book
SET pages = pages-10
WHERE book.id_type in (SELECT type.id_type
FROM type
WHERE type.name in ('Poetry','Science Book','Textbook','Art Book') );
