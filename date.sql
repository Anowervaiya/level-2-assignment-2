-- Active: 1747495598865@@127.0.0.1@5432@mydatabase
SELECT now();

CREATE Table timez (
    ts TIMESTAMP without time zone,
    tsz TIMESTAMP with time zone
);

INSERT INTO timez VALUES('2024-01-12 10:45:00','2024-01-12 10:45:00')
;

SELECT * FROM timez;

SELECT CURRENT_DATE;

SELECT now()::time;

SELECT to_char(now(), 'DDD')

SELECT CURRENT_DATE - INTERVAL '1 year'

SELECT age(CURRENT_DATE , '2006-07-16')

SELECT 5 :: BOOLEAN;

