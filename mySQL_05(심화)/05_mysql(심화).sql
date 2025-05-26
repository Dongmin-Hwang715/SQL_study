-- 문제 1) 다음 컬럼을 가지는 userTBL과 buyTBL을 정의하세요.
DROP TABLE IF EXISTS buytbl;
DROP TABLE IF EXISTS usertbl;
create table userTBL (
userID char(8) not null primary key,
name varchar(10) not null,
birthyear int not null
);

create table buyTBL (
num int auto_increment not null primary key,
userID char(8) not null,
prodName char(6) not null
);

alter table buyTBL
ADD CONSTRAINT FK_userTBL_buyTBL
FOREIGN KEY(userID)
REFERENCES userTBL(userID);

-- 문제 2) 다음 조건을 만족하는 userTBL 테이블을 정의하세요.
DROP TABLE IF EXISTS buytbl;
DROP TABLE IF EXISTS usertbl;
create table userTBL (
userID char(8) not null primary key,
name varchar(10) not null,
birthyear int not null,
email char(30) null unique);

-- 문제 3) 다음 조건을 만족하는 userTBL 테이블을 정의하세요.
DROP TABLE IF EXISTS usertbl;
create table userTBL(
userID char(8) not null primary key,
name varchar(10),
birthYear int check(birthYear >= 1900 and birthyear <= 2023),
mobile char(3) not null);

-- 문제 4) 다음 조건을 만족하는 userTBL 테이블을 정의하세요.
DROP TABLE IF EXISTS usertbl;
create table userTBL(
userID char(8) not null primary key,
name varchar(10) not null,
birthYear int not null default -1,
addr char(2) not null default '서울',
mobile1 char(3) null,
mobile2 char(8) null,
height smallint null default 170,
mDate date null
);
insert into userTBL (userID, name) values ('1', '1');
select * from userTBL;

-- 문제 5) 앞에서 만든 userTBL에 대해서 다음 조건을 처리하도록 수정하세요.
-- mobile1 컬럼을 삭제함
alter table usertbl drop column mobile1;

-- name 컬럼명을 uName으로 변경함
alter table usertbl change column name uName varchar(20);

-- 기본키를 제거함
alter table usertbl drop primary key;


-- 문제 6) 모든 문제는 employees 데이터베이스에서 수행한다.
use employees;

-- 문제 7) 다음 정보를 가지는 직원 정보를 출력하는 EMPLOYEES_INFO 뷰를 작성하세요
create view employees_info as select
e.emp_no, e.birth_date, e.first_name, e.last_name, e.gender, e.hire_date, t.title, t.from_date as t_from, t.to_date as t_to, s.salary, s.from_date as s_from, s.to_date as s_to
from employees e inner join titles t on e.emp_no = t.emp_no inner join salaries s on e.emp_no = s.emp_no;

-- 문제 8) EMPLOYEES_INFO 뷰에서 재직자의 현재 정보만 출력하세요.
select * from employees_info where s_to = '9999-01-01';

-- 문제 9) 다음 정보를 가지는 부서 정보를 출력하는 EMP_DEPT_INFO 뷰를 작성하세요
create view emp_dept_info as select
e.emp_no, de.dept_no, d.dept_name, de.from_date, de.to_date
from employees e inner join dept_emp de on e.emp_no = de.emp_no inner join departments d on de.dept_no = d.dept_no;

-- 문제 10) EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력하세요.
select * from emp_dept_info where to_date = '9999-01-01' order by emp_no;