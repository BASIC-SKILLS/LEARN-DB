CREATE DATABASE java;
DROP DATABASE java;

CREATE TABLE t_exam (
	i_exam INT PRIMARY KEY,
	title VARCHAR(100),
	jumin CHAR(13),
	age INT(3) NOT NULL
);

INSERT INTO t_exam ( I_EXAM, TITLE, JUMIN, AGE ) 
VALUES (1, '안녕하세요',9002211876543, 32);

INSERT INTO t_exam ( I_EXAM, TITLE, JUMIN, AGE ) 
VALUES (2, '안녕히계세요',0902211876543, 11),
(3, '만나서 반갑습니다.',0502211876543, 15),
(4, '점심은 드셨습니까?.',2902211876543, 95);

-- 주석
# 주석
/*
주석 
*/



SELECT * FROM t_exam;

UPDATE t_exam
SET age = 30
WHERE i_exam = 1;

SELECT * FROM t_exam;

DELETE FROM t_exam
WHERE i_exam = 4;

