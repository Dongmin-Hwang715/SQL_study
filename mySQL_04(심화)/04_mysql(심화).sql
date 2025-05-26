-- 문제 1) 다음과 같이 테이블과 데이터를 준비하세요.
use sqldb;
create table stdtbl(
stdName varchar(10) not null primary key,
addr char(4) not null
);

create table clubtbl(
clubName varchar(10) not null primary key,
roomNo char(4) not null
);

create table stdclubtbl(
num int auto_increment not null primary key,
stdName varchar(10) not null,
clubName varchar(10) not null,
foreign key(stdName) references stdtbl(stdName),
foreign key(clubName) references clubtbl(clubName)
);

insert into stdtbl values ('김범수','경남'),('성시경','서울'),('조용필','경기'),('은지원','경북'),('바비킴','서울');
insert into clubtbl values ('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');
insert into stdclubtbl values 
(null, '김범수','바둑'), (null, '김범수','축구'), (null, '조용필','축구'),
(null, '은지원','축구'), (null, '은지원','봉사'), (null, '바비킴','봉사');


-- 문제 2) 앞에서 정의한 3개의 테이블을 이용해서 다음을 처리하세요.
-- 문제 2-1) 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/동아리방을 출력하세요.
select s.stdName, s.addr, c.clubName, c.roomNo 
from stdtbl s inner join stdclubtbl sc on s.stdName = sc.stdName inner join clubtbl c on sc.clubName = c.clubName
order by s.stdName;

-- 문제 2-2) 동아리를 기준으로 가입한 학생의 목록을 출력하세요. 출력정보: clubName, roomNo, stdName, addr
select c.clubName, c.roomNo, s.stdName, s.addr
from clubtbl c inner join stdclubtbl sc on c.clubName = sc.clubName inner join stdtbl s on sc.stdName = s.stdName
order by c.clubName;

-- 문제 3) 다음과 같이 테이블과 데이터를 준비하세요.
CREATE TABLE emptbl(emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));
INSERT INTO empTbl VALUES('나사장', NULL, '0000');
INSERT INTO empTbl VALUES('김재무', '나사장', '2222');
INSERT INTO empTbl VALUES('김부장', '김재무', '2222-1');
INSERT INTO empTbl VALUES('이부장', '김재무', '2222-2');
INSERT INTO empTbl VALUES('우대리', '이부장', '2222-2-1');
INSERT INTO empTbl VALUES('지사원', '이부장', '2222-2-2');
INSERT INTO empTbl VALUES('이영업', '나사장', '1111');
INSERT INTO emptbl VALUES('한과장', '이영업', '1111-1');
INSERT INTO empTbl VALUES('최정보', '나사장', '5355');
INSERT INTO empTbl VALUES('윤차장', '최정보','3355-1');
INSERT INTO empTbl VALUES('이주임', '윤자장', '5335-1-1');

-- 문제 4) 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요. 출력할 정보: 부하직원, 직속상관, 직속상관연락처
select a.emp as 부하직원, a.manager as 직속상관, b.emptel as 직속상관연락처
from emptbl a inner join emptbl b on a.manager = b.emp
where a.emp = '우대리';

-- 문제 5) 모든 문제는 employees 데이터베이스에서 수행한다.
use employees;

-- 문제 6) 현재 재직 중인 직원의 정보를 출력하세요. 출력 항목: emp_no, first_name, last_name, title
select e.emp_no, e.first_name, e.last_name, t.title
from employees e inner join titles t on e.emp_no = t.emp_no
where t.to_date = '9999-01-01';

-- 문제 7) 현재 재직 중인 직원 정보를 출력하세요. 출력항목: 직원의 기본 정보 모두, title, salary
select e.emp_no, e.birth_date, e.first_name, e.last_name, e.gender, e.hire_date, t.title, s.salary from
employees e inner join titles t on e.emp_no = t.emp_no inner join salaries s on e.emp_no = s.emp_no
where s.to_date = '9999-01-01';

-- 문제 8) 현재 재직중인 직원의 정보를 출력하세요. 출력항목: emp_no, first_name, last_name, department 정렬: emp_no 오름 차순
select e.emp_no, e.first_name, e.last_name, dp.dept_name
from employees e inner join dept_emp d on e.emp_no = d.emp_no inner join departments dp on d.dept_no = dp.dept_no
where d.to_date = '9999-01-01' order by e.emp_no;

-- 문제 9) 부서별 재직중인 직원의 수를 출력하세요. 출력 항목: 부서 번호, 부서명, 인원수 정렬: 부서 번호 오름차순
select d.dept_no, d.dept_name, count(*)
from dept_emp de inner join departments d on de.dept_no = d.dept_no
where de.to_date = '9999-01-01' group by d.dept_name order by d.dept_no;

-- 문제 10) 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요. 출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date
select e.emp_no, e.first_name, e.last_name, dp.dept_name, d.from_date, d.to_date
from employees e inner join dept_emp d on e.emp_no = d.emp_no inner join departments dp on d.dept_no = dp.dept_no
where e.emp_no = 10209 order by d.from_date;