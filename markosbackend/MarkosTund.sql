SELECT id, first_name, gender FROM users; --otsib sealt tabelist asju
SELECT * FROM users; --võtab kõik asjad tablist
SELECT * FROM users WHERE birth_year = 2006; --filtreerib selle sünni aastaga inimesed välja
SELECT * FROM users WHERE birth_year < 2006; -- filtreerib välja kelle sünniaasta on väiksem kui 2006
SELECT * FROM users WHERE birth_year > 2006; --suurem kui
SELECT * FROM users WHERE birth_year <= 2006; --väiksem võrdub
SELECT * FROM users WHERE birth_year >= 2006; --suurem võrdub
SELECT * FROM users WHERE first_name = 'Adrianna'; --otsib inimese nime järgi
SELECT * FROM users WHERE first_name LIKE 'M%'; --otsib välja kõik kelle nimed hakkavad K tähega
SELECT * FROM users WHERE first_name LIKE 'Ka%'; --kõik kelle nimed hakkavad Ka tähtedega
SELECT * FROM users WHERE first_name LIKE '%e'; -- nimi lõppeb e tähega leiab üles
SELECT * FROM users WHERE first_name LIKE '%z%'; --otsib kõik kelle nimi sisaldab Z tähte
SELECT * FROM users WHERE first_name LIKE 'K%' AND birth_year > 2006;
SELECT * FROM users WHERE first_name LIKE 'K%' OR first_name LIKE 'B%'; --ostib kõik kelle eesnimi on K v B saab teha mitmega
SELECT * FROM users WHERE (first_name LIKE 'K%' OR first_name LIKE 'B%') AND birth_year > 2006;
SELECT * FROM users WHERE NOT birth_year =1960; --where not eitab
SELECT * FROM users ORDER BY first_name DESC; --tagurpidi järjekorras Z-A
SELECT * FROM users ORDER BY first_name ASC; --ASC pole vaja aga võib ta on juba tegelt vaikimis ASC. A-Z tähestikus
SELECT * FROM users ORDER BY birth_year, first_name;
SELECT * FROM users WHERE birth_year = 2006 ORDER BY first_name DESC; --sündinud 2006 ja järjekord tagurpidi
SELECT * FROM users LIMIT 10; -- esimesed 10 kasutajat limiteerib
SELECT * FROM users LIMIT 10 OFFSET 10; -- jätab 10 vahele ja näitab 11-20
SELECT DISTINCT first_name FROM users; --annab ainult unikaalsed nimed/väärtused (mis ei kordu)
SELECT COUNT(*) FROM users WHERE first_name LIKE 'K%'; --ei huvita nimed vaid palju on neid ridu
SELECT SUM(birth_year) FROM users; -- liidab kokku
SELECT AVG(birth_year) FROM users; --keskmine sünniaasta
SELECT * FROM users WHERE gender IN ('Male', 'Female'); --sorteerib välja suguliselt
SELECT * FROM users WHERE NOT gender = 'Male'; --võtab mehed välja tablist
SELECT * FROM users WHERE NOT gender IN ('Male', 'Female');
SELECT DISTINCT gender FROM users;--kõik sood ühe korra
SELECT * FROM users WHERE birth_year >= 2000 AND birth_year <= 2010; --vahemikus annab
SELECT * FROM users WHERE birth_year BETWEEN 2000 AND 2010; -- annab vahemikus lühemalt

INSERT INTO users (id, first_name, last_name, email, gender, ip_address, birth_year)
VALUES (1001, 'Markos', 'Herm', 'markos@hot.ee', 'Male', '127.0.0.2', 2006); -- lisab tabelisse uue rea

UPDATE users
SET email = 'Thot@hot.cum'
WHERE gender = 'Male' AND birth_year > 2000; --uuendab korraga mingi asja järgi

DELETE FROM users WHERE gender = 'Non-binary'; --kustutab soo

CREATE TABLE movies (
    id INT,
    name VARCHAR,
    year INT,
    description TEXT
); --teeb tabeli

DROP TABLE movies; --kustutab tabeli

CREATE TABLE movies (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,    --NOT NULL ei luba rida ei tühjaks jätta, PRIMARY KEY järgi sorteeritakse tabel automaatselt, seadistab ära, et päring ei kordu. AUTOINCREMENT ise automaatselt paneb selle ID.
    name VARCHAR NOT NULL,
    year INTEGER NOT NULL,
    description TEXT
);

INSERT INTO movies (name, year)
VALUES ('A Star Is Born', 2018);

INSERT INTO movies (name)
VALUES ('Legally Blonde'); --ei tööta, sest year on NOT NULL

ALTER TABLE movies
ADD director VARCHAR; -- lisab ühe veeru juurde tabelisse

ALTER TABLE movies
DROP COLUMN director; -- eemaldab selle veeru.

