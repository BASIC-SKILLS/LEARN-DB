
CREATE TABLE studentTBL (
	s_id INT UNSIGNED PRIMARY KEY,
	nm VARCHAR(3) NOT NULL,
	ph CHAR(13)
);

DROP TABLE studentTBL;

SELECT * FROM studentTBL;

INSERT INTO studentTBL 
(s_id, nm)
VALUES
(1111, '값');

INSERT INTO studentTBL 
(s_id, nm, ph)
VALUES
(1112, '을', '010-1111-1111'),
(1113, '병', '010-2222-2222')
;

INSERT INTO studentTBL 
(s_id, nm, ph)
VALUES
(1114, '병', '010-3333-3333');

CREATE TABLE classTBL (
	c_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	subject VARCHAR(5) NOT NULL,
	teacher VARCHAR(5) NOT NULL
);

DROP TABLE classTBL;

SELECT * FROM classTBL;

INSERT INTO classTBL 
(subject, teacher)
VALUES
('수학', '김하나'),
('과학', '판테온'),
('국어', '오징어')
;

INSERT INTO classTBL 
(subject, teacher)
VALUES
('영어', '김둘')
;

CREATE TABLE scoreTBL(
	s_id INT,
	c_id INT,
	score INT,
	PRIMARY KEY (s_id, c_id)
);

SELECT * FROM scoreTBL;

INSERT INTO scoreTBL 
(s_id, c_id, score)
VALUES
(1111, 1, 90),
(1111, 2, 100),
(1111, 3, 80),
(1112, 1, 80),
(1112, 4, 70)
;

CREATE TABLE scoreFK_TBL(
	s_id INT unsigned,
	c_id INT unsigned,
	score INT,
	PRIMARY KEY (s_id, c_id),
	FOREIGN KEY (s_id) REFERENCES studentTBL(s_id),
	FOREIGN KEY (c_id) REFERENCES classTBL(c_id)
); # foreign key를 걸려면 무조건 똑같이 적어야 한다. 

INSERT INTO scoreFK_TBL 
(s_id, c_id, score)
VALUES
(1111, 1, 90),
(1111, 2, 100),
(1111, 3, 80),
(1112, 1, 80),
(1112, 4, 70),
(1114, 4, 80)
;

SELECT * FROM scoreFK_TBL;

SELECT B.*, A.* FROM scoreFK_TBL A
INNER JOIN studentTBL  B
ON A.s_id = B.s_id;

SELECT B.nm, A.c_id, A.score FROM scoreFK_TBL A
INNER JOIN studentTBL  B
ON A.s_id = B.s_id;

# c.id 는 무슨 과목? -> 조인 한번 더
SELECT B.nm, C.subject, A.score FROM scoreFK_TBL A
INNER JOIN studentTBL  B
ON A.s_id = B.s_id
INNER JOIN classtbl C
ON A.c_id = C.c_id;

CREATE TABLE boardTBL (
	iboard INT UNSIGNED PRIMARY KEY auto_increment,
	title VARCHAR(100) NOT NULL,
	ctnt VARCHAR(500) NOT NULL,
	rdt DATETIME DEFAULT NOW()	
);

DROP TABLE cmtTBL;
DROP TABLE boardTBL;

CREATE TABLE cmtTBL (
	icmt INT UNSIGNED PRIMARY KEY auto_increment,
	iboard INT UNSIGNED, 
	ctnt VARCHAR(100) NOT NULL,
	rdt DATETIME DEFAULT NOW()
);

INSERT INTO boardTBL
(title, ctnt)
VALUES
('안녕하세요', '저는 현진이예요'),
('좋아하는 계절', '여름이 빨리 왔으면 좋겠어요'),
('좋아하는 음식', '김치찌개 매니아예요'),
('꿈', '여성스러운 여자가 되고 싶어요');

INSERT INTO boardTBL
(title, ctnt)
VALUES
('취미', '남자친구에게 사랑을 듬뿍담아 요리 해주기!');

INSERT INTO cmtTBL
(iboard, ctnt)
VALUES
('1', '저는 득원이예요. 마음에 드는데 저랑 당장 사겨요.'),
('2', '득원은 여름이 너무 더워서 시로~ 겨울이 죠아~'),
('3', '득원은 닭곰탕이 젤루 좋아~'),
('4', '득원은 현진을 젤루 사랑해~');

INSERT INTO cmtTBL
(iboard, ctnt)
VALUES
('1', '안녕하세요. 당신은 정말 귀여워요.');

SELECT * FROM boardTBL;

SELECT * FROM cmtTBL;

SELECT A.* , B.* 
FROM boardTBL A
INNER JOIN cmtTBL B
ON A.iboard = B.iboard;

SELECT A.* , B.* 
FROM boardTBL A
left JOIN cmtTBL B
ON A.iboard = B.iboard;

SELECT A.* , ifnull(B.ctnt, '댓글없음') 
FROM boardTBL A
left JOIN cmtTBL B
ON A.iboard = B.iboard;

SELECT A.iboard
FROM boardTBL A
left JOIN cmtTBL B
ON A.iboard = B.iboard;
WHERE B.cmtTBL IS NULL;