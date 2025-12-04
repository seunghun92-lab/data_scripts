-- 유저 생성
create user 'capybara'@'%' IDENTFIED by 'capybara';

--사용할 데이터베이스(스키마) 변경
use mysql;
-- user 목록 확인
select * from user;

-- 스키마 생성
create database menudb;

-- menudb에 대한 모든 권한 변경 명령어
grant all privileges on menudb.* to 'capybara'@'%';

show grants for 'capybara'@'%';

use menudb;

CREATE TABLE IF NOT EXISTS tb1 (
    pk INT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

describe tb1;

select * from tb1;

insert into tb1 VALUES(1, 10, 'Y');
-- 순서를 정해서 할수도 있다

-- insert into tb1(pk, col1, fk) VALUES(1, 10, 'Y');

select * from tb1;

-- AUTO INCREAMENT
CREATE TABLE IF NOT EXISTS tb2 (
    pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

describe tb2;

-- AUTO INREAMENT 컬럼은 null값이 들어와야 한다.
INSERT INTO tb2 VALUES (null, 10, 'Y');
INSERT INTO tb2 VALUES (null, 20, 'Y');

SELECT * FROM tb2;

-- ALTER
-- ALTER TABLE 테이블명 ADD 컬럼명 컬럼정의

-- tb2에 col2 컬럼 추가
ALTER TABLE tb2
ADD col2 INT NOT NULL;

DESCRIBE tb2;

ALTER TABLE tb2 
drop column col2;

DESCRIBE tb2;

-- 열 이름 및 데이터 형식 변경 : ALTER TABLE 테이블 명 CHANGE COLUMN 기존컬럼명 바꿀 컬럼명 컬럼강의
alter table tb2 change column fk change_fk int not null;

describe tb2;


-- 제약 조건 추가 및 삭제 : ALTER TABLE 테이블명 drop 제약조건
alter table tb2 drop primary key; 

-- 컬럼 정의 변경
alter table tb2 modify pk int;

describe tb2;

alter table tb2 drop primary key;

describe tb2;

-- 다시 primary key 제약 조건 추가

alter table tb2 add primary key("pk");

describe tb2;

-- 한번에 여러개 컬럼 추가
alter table tb2
add col3 date not null,
and col4 tinyint not null;


SELECT @@GLOBAL.sql_mode;

set GLOBAL sql_mode = '';



