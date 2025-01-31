--GAP ANALYSIS
--FINDING MISSING DATAS IN A DATABASE

--CREATE BACKUP TABLE FOR IMAGECONSULTINGEMPLOYEE

DROP TABLE IF EXISTS IMAGECONSULTINGEMPLOYEEBACKUP
SELECT * INTO IMAGECONSULTINGEMPLOYEEBACKUP
FROM ImageConsultingEmployee
WHERE working_hours IN (9,12)

--GAP ANALYSIS, WHAT DO WE HAVE IN THE EMPLOYEE THAT ISNT IN THE BACKUP
--How to find missing records using EXISTS it works as intersect
--you can put 1 or null 
--where the 2 tables match/intersect
SELECT 1
FROM IMAGECONSULTINGEMPLOYEEBACKUP as A
where exists (

SELECT *
FROM IMAGECONSULTINGEMPLOYEE as B
where A.working_hours = B.working_hours
)

-- table fliped
--checking what is missen
--not exists works as except
--it doesnt matter which table comes first 

SELECT *
FROM IMAGECONSULTINGEMPLOYEE as B
where not exists (
SELECT 1
FROM IMAGECONSULTINGEMPLOYEEBACKUP as A
where A.working_hours = B.working_hours
)

---how to find missen record using IN or NOT IN operator

--IN - showing intersect 
SELECT *
FROM IMAGECONSULTINGEMPLOYEE as B
where working_hours in (
SELECT 1
FROM IMAGECONSULTINGEMPLOYEEBACKUP as A
where A.working_hours = B.working_hours
)


--NOT IN - showing missen record
SELECT *
FROM IMAGECONSULTINGEMPLOYEE as B
where working_hours not in (
SELECT 1
FROM IMAGECONSULTINGEMPLOYEEBACKUP as A
where A.working_hours = B.working_hours
)

/**----assignment
pick 5 tables from tables in the past and demonstrate/perform 
matching records and not matching ecord (missen record) **/


select *
from [dbo].[stg_claims]

select*
from [dbo].[stg_claimsTransactions]

select*
from [dbo].[stg_Careplans]
where DESCRIPTION like 'diabetes%'

select count(*) as TotalDiabetes
from [dbo].[stg_Careplans]
where DESCRIPTION like 'diabetes%'


USE study

CREATE TABLE YBNL
(
ID_NUMBER INT NOT NULL,
FIRST_NAME VARCHAR (20) NOT NULL,
LAST_NAME VARCHAR (20) NOT NULL,
SALARY INT NOT NULL
)
INSERT INTO YBNL
(ID_NUMBER, FIRST_NAME, LAST_NAME, SALARY)
VALUES
(01, 'JACOBS', 'OLUWOLE', 50000),
(02, 'ADE', 'KOMOLAFE', 55000),
(03, 'JIDE', 'ADEOYE', 58000),
(04, 'SOLE', 'AJAYI', 50000),
(05, 'BUSAYO', 'AYENI', 50000)
;

SELECT * FROM YBNL

SELECT FIRST_NAME, LAST_NAME, SALARY
CASE WHEN SALARY >= 58000 THEN 'HIGH' 
WHEN 
FROM YBNL