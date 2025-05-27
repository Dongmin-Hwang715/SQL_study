-- 문제 1) sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl1을 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
--  컬럼 목록: a INT PRIMARY KEY, b INT, c INT
use sqldb;
create table tbl1(
a int primary key,
b int,
c int
);
show index from tbl1;

-- 문제 2) sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl2를 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
-- 컬럼 목록: a INT PRIMARY KEY, b INT UNIQUE, c INT UNIQUE, d INT
create table tbl2(
a int primary key,
b int,
c int unique,
d int
);
show index from tbl2;

-- 문제 3) sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl3를 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
-- 컬럼 목록: a INT UNIQUE, b INT UNIQUE, c INT UNIQUE, d INT
create table tbl3(
a int unique,
b int unique,
c int unique,
d int
);
show index from tbl3;

-- 문제 4) sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl4를 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
-- 컬럼 목록: a INT UNIQUE NOT NULL, b INT UNIQUE, c INT UNIQUE, d INT
create table tbl4(
a int unique not null,
b int unique,
c int unique,
d int
);
show index from tbl4;

-- 문제 5) sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl5를 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
-- 컬럼 목록 a INT UNIQUE NOT NULL, b INT UNIQUE, c INT UNIQUE, d INT PRIMARY KEY
create table tbl5(
a int unique not null,
b int unique,
c int unique,
d int primary key
);
show index from tbl5;

-- 문제 6-1) testdb에 다음 컬럼 목록을 가지는 usertbl을 만드세요.
-- 컬럼 목록: userID CHAR(8) NOT NULL PRIMARY KEY, name VARCHAR(10) NOT NULL, birthYear INT NOT NUL, addr NCHAR(2) NOT NULL
create database testdb;
use testdb;
create table usertbl(
userID char(8) not null primary key,
name varchar(10) not null,
birthYear int not null,
addr nchar(2) not null
);

-- 문제 6-2) 아래 데이터를 추가하고, 클러스터형 인덱스의 테이블 내용을 확인하세요.
insert into usertbl values ('LSG', '이승기', 1987, '서울');
insert into usertbl values ('KBS', '김범수', 1979, '경남');
insert into usertbl values ('KKH', '김경호', 1971, '전남');
insert into usertbl values ('JYP', '조용필', 1950, '경기');
insert into usertbl values ('SSK', '성시경', 1979, '서울');
select * from usertbl;

-- 문제 7-1) ALTER를 사용하여 usertbl에서 PRIMARY KEY 제약조건을 제거하고, name 컬럼에 pk_name이라는 제약조건명으로 기본키를 설정하세요.
alter table usertbl drop primary key;
alter table usertbl add constraint pk_name primary key(name);

-- 문제 7-2) usertbl의 내용을 출력하여, 새로운 클러스터형 인덱스를 확인하세요
select * from usertbl;