----
CREATE TABLE OCCUPATIONS   ([Name] varchar(10), [Occupation] varchar(10));

INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Ashley', 'Professor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Samantha', 'Actor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Julia', 'Doctor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Britney', 'Professor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Maria', 'Professor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Meera', 'Professor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Priya', 'Doctor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Priyanka', 'Professor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Jennifer', 'Actor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Ketty', 'Actor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Belvet', 'Professor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Naomi', 'Professor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Jane', 'Singer')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Jenny', 'Singer')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Kristeen', 'Singer')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Christeen', 'Singer')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Eve', 'Actor')
INSERT INTO OCCUPATIONS   ([Name], [Occupation]) VALUES    ('Aamina', 'Doctor');


---Pivot
SELECT Doctor, Professor, Singer, Actor
FROM
(
  SELECT ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) RN, ISNULL(NULL,Name) as Name, Occupation FROM Occupations
) AS T

PIVOT
(
    MAX(Name) FOR Occupation IN ( [Doctor], [Professor], [Singer], [Actor] )
) AS T_PIVOT
ORDER BY RN;
