-- 문제 1) sqldb 데이터베이스에서 다음 조건을 처리하세요.
use sqldb;
-- 문제 1-1) 사용자별로 구매 이력을 출력함, 모든 컬럼을 출력함, 구매 이력이 없는 정보는 출력하지 않음
select * from usertbl u inner join buytbl b on b.userid = u.userid;

-- 문제 1-2) 앞의 결과에서 userID가 'JYP'인 데이터만 출력하세요.
select * from usertbl u inner join buytbl b on b.userid = u.userid where u.userid = 'JYP';

-- 문제 2) sqldb 데이터베이스에서 다음 조건을 처리하세요.
-- 각 사용자별로 구매 이력을 출력하세요, 연결 컬럼은 userID로 함, 결과를 userID를 기준으로 오름차순으로 정렬함
-- 구매이력이 없는 사용자도 출력하세요, userID, name, prodName, addr, 연락처를 다음과 같이 출력함
select u.userID, u.name, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as 연락처
from usertbl u left outer join buytbl b on b.userid = u.userid
order by u.userid;

-- 문제 3 - 1) sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력하세요.
select * from usertbl where name not in (select name from usertbl where mobile1 is null);

-- 문제 3 - 2) sqldb의 사용자를 모두 조회하되 전화가 없는 사람만 출력하세요.
select * from usertbl where name in (select name from usertbl where mobile1 is null);