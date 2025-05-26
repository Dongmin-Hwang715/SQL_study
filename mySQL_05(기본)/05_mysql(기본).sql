-- 문제 1-1) tabledb 데이터베이스를 생성하세요. 만일, 이미 존재한다면 삭제하세요
drop database if exists tabledb;
create database tabledb;
use tabledb;

-- 문제 1-2) 다음 컬럼을 가지는 usertbl 테이블을 만드세요.
CREATE TABLE usertbl
(userID CHAR(8) NOT NULL PRIMARY KEY,
name VARCHAR(10) NOT NULL,
birthYear INT NOT NULL,
addr CHAR(2) NOT NULL,
mobile1 CHAR(3) NULL,
mobile2 CHAR(8) NULL,
height SMALLINT NULL,
mDate DATE NULL);

-- 문제 2) 다음 컬럼을 가지는 buytbl 테이블을 만드세요.
CREATE TABLE buytbl
(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
userid CHAR(8) NOT NULL,
prodName CHAR(6) NOT NULL,
groupName CHAR(4) NULL,
price INT NOT NULL,
amount SMALLINT NOT NULL,
FOREIGN KEY(userid) REFERENCES usertbl(userID));

-- 문제 3-1) 회원 테이블에 다음 데이터를 입력하세요.
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

-- 문제 3-2) 구매 테이블에 다음 데이터를 입력하세요.
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
-- INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
-- usertbl에 'JYP'가 존재하지 않으므로 에러 발생

-- 문제 4) 다음 컬럼을 가지는 usertbl을 정의하세요.
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl (
userID CHAR(8) NOT NULL,
name VARCHAR(10) NOT NULL,
birthYear INT NOT NULL,
CONSTRAINT PRIMARY KEY PK_userTBL_userID(userID)
);

-- 문제 5) 다음 컬럼을 가지는 prodTbl 을 정의하세요.
DROP TABLE IF EXISTS prodtbl;
CREATE TABLE prodTbl
(prodCode CHAR(3) NOT NULL,
prodID CHAR(4) NOT NULL,
prodDate DATETIME NOT NULL,
prodCur CHAR(10) NULL,
CONSTRAINT PK_prodtbl_proCode_prodID
PRIMARY KEY (prodCode, prodID));

-- 문제 6-1) usertbl과 buytbl을 바탕으로 다음 결과가 나오는 뷰를 정의하세요.
create view v_usertbl as select u.userid, u.name, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as 연락처
from usertbl u inner join buytbl b on u.userid = b.userid;

-- 문제 6-2) 위에서 정의한 뷰에서 userid가 '김범수'인 데이터만 출력하세요.
select * from v_usertbl where name = '김범수';