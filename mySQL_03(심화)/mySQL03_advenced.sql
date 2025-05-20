-- 문제 1) 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요
select userid as '사용자 아이디', sum(amount) as '총 구매 개수' from buytbl group by userid;
select userid as '사용자 아이디', sum(amount*price) as '총 구매액' from buytbl group by userid;

-- 문제 2) 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요.
select avg(amount) as '평균 구매 개수' from buytbl;
select userID, avg(amount) as '평균 구매 개수' from buytbl group by userID;

-- 문제 3) 다음 결과가 나오도록 usertbl에 대한 SQL 문을 작성하세요. 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함
select name, height from usertbl 
where height = (select max(height) from usertbl) or height = (select min(height) from usertbl);

-- 문제 4) 다음 결과가 나오도록 usertbl에 대한 SQL 문을 작성하세요.
select count(mobile1) as '휴대폰이 있는 사용자' from usertbl;

-- 문제 5) buytbl 테이블로 다음을 처리하세요.
-- 문제 5-1) 사용자별 총 구매액을 출력하세요.
select userID as 사용자, sum(amount*price) as '총 구매액' from buytbl
group by userid;

-- 문제 5-2) 총 구매액이 1,000이상인 사용자만 출력하세요.
select userID as 사용자, sum(amount*price) as '총 구매액' from buytbl
group by userid having sum(amount*price) >= 1000;

-- 문제 6) world 데이터베이스에서 다음 질문을 처리하세요.
use world;
-- 문제 6-1) city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오.
select sum(population) from city where countrycode = 'KOR';

-- 문제 6-2) city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하시오.
--          단 결과를 나타내는 테이블의 필드는 "최소값"으로 표시하시오.
select min(population) as '최소값' from city where countrycode = 'KOR';

-- 문제 6-3) city 테이블에서 국가코드가 'KOR'인 도시들의 평균을 구하시오.
select avg(population) from city where countrycode = 'KOR';

-- 문제 6-4) city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오.
--          단 결과를 나타내는 테이블의 필드는 "최대값"으로 표시하시오.
select max(population) as '최대값' from city where countrycode = 'KOR';

-- 문제 6-5) country 테이블 각 레코드의 Name 칼럼의 글자수를 표시하시오.
select name, length(name) from country;

-- 문제 6-6) country테이블의 나라명(Name 칼럼)을 앞 세글자만 대문자로 표시하시오.
select name, upper(left(name, 3)) from country;

-- 문제 6-7) country테이블의 기대수명(LifeExpectancy)을 소수점 첫째자리에서 반올림해서 표시하시오.
select name, round(lifeexpectancy, 1) from country;

use employees;
-- 문제 7-1) employees db에서 각 부서별 관리자를 출력하세요. 단, 현 재직자만 출력한다.
select d.dept_name, m.emp_no 
from departments d join 
(select * from dept_manager where to_date = '9999-01-01') m 
where d.dept_no = m.dept_no;

-- 문제 7-2) 부서번호 d005 부서의 현재 관리자 정보를 출력하세요.
select d.dept_name, m.emp_no 
from departments d join 
(select * from dept_manager where to_date = '9999-01-01' and dept_no = 'd005') m 
where d.dept_no = m.dept_no;

-- 문제 8) employees 테이블에서 페이지네이션으로 페이지를 추출하려고 한다. 다음 조건하에서 8번 페이지의 데이터를 출력하세요.
--       입사일을 내림차순으로 정렬한다. 한 페이지당 20명의 정보를 출력한다.
select * from employees order by hire_date desc
limit 140, 20;

-- 문제 9-1) employees db에서 재직자의 총 수를 구하시오. 재직자의 to_date값은 '9999-01-01'로 저장되어 있음
select count(*) from employees e join
(select * from dept_emp where to_date = '9999-01-01') d
where e.emp_no = d.emp_no;

-- 문제 9-2) employees db에서 재직자의 평균 급여를 출력하시오.
select avg(salary) from salaries where to_date = '9999-01-01';

-- 문제 10) 재직자 전체 평균 급여 보다 급여를 더 많이 받는 재직자를 출력하세요.
select * from employees e join 
(select * from salaries where salary > 
(select avg(salary) from salaries where to_date = '9999-01-01')) s
where e.emp_no = s.emp_no;

-- 문제 11) employees db에서 각 부서별 재직자의 수를 구하시오. 
--         부서 번호로 구분하고, 부서번호로 오름 차순 정렬하여 출력한다.
select dept_no, count(*) from dept_emp where to_date = '9999-01-01'
group by dept_no order by dept_no;