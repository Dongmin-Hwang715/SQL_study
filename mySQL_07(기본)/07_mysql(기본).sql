-- 다음과 같이 데이터베이스를 준비하세요.
-- 데이터베이스명: jdbc_ex
CREATE DATABASE jdbc_ex;

-- 사용자: scoula 비밀번호: 1234
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

-- jdbc_ex 데이터베이스에 대한 모든 사용권한 부여
GRANT ALL PRIVILEGES ON jdbc_ex.* TO 'scoula'@'%';
FLUSH PRIVILEGES;