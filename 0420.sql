CREATE INDEX idx_abcd ON membertbl(memberName);

SHOW INDEX FROM membertbl;

DROP index idx_abcd ON membertbl;

CREATE VIEW view_abcd AS
SELECT * FROM membertbl
WHERE memberName LIKE '%이%';

SELECT * FROM view_abcd;

SELECT * FROM view_abcd WHERE memberID = 'Dang';