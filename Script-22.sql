-- Q1에서 생성한 TEAM_INFO 테이블과 MEMBER_INFO 테이블에 아래와 같이 데이터를 INSERT하는 쿼리를 작성하세요.

-- 단, 삽입 대상 컬럼명은 반드시 명시해야 합니다.

use employeedb;

CREATE TABLE TEAM_INFO (
    team_code INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL,
    team_detail VARCHAR(255),
    use_yn CHAR(1) DEFAULT 'Y'
);

-- team_info : insert문 3개

desc team_info;
select * from team_info;

INSERT INTO team_info (team_code, team_name, team_detail, use_yn)
VALUES 
    (NULL, '음악감상부', '클래식 및 재즈 음악을 감상하는 사람들 모임', 'Y'),
    (NULL, '맛집탐방부', '맛집을 찾아다니는 사람들 모임', 'N')
    (NULL, '행복찾기부');



-- MEMBER_INFO :insert문 3개

desc member_info;
	team_code,
	team_name,
	team_detail,
	use_yn,

INSERT INTO employeedb.member_info (member_code, member_name, birth_date, division_code, detail_info, contact, team_code, active_stuatus
) VALUES(0, '', '', 'Y');
    

INSERT INTO employeedb.member_info (member_code, member_name, birth_date, division_code, detail_info, contact, team_code, active_stuatus
) VALUES(null, '국민아들 임영웅입니다~', 'hero@trot.com', 'N');


INSERT INTO employeedb.member_info (member_name, contact, team_code)
) VALUES(null, '태진다', '(1급 비밀)', 3);
select * from member_info;






