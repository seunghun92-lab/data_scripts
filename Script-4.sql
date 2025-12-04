use menudb;
-- 기존 DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS get_menu_list$$

-- Stored Procedure 생성
CREATE PROCEDURE get_menu_list()
BEGIN
    SELECT * FROM tbl_menu;
END$$

-- DELIMITER 원래대로 복구
DELIMITER ;

-- 생성된 Stored Procedure 호출
CALL get_menu_list();

-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS get_menu_by_category$$

-- IN 파라미터를 사용하는 Stored Procedure 생성
CREATE PROCEDURE get_menu_by_category(
	IN p_category_code INT
)
BEGIN
    SELECT * FROM tbl_menu WHERE category_code = p_category_code;
END$$

-- DELIMITER 복구
DELIMITER ;

-- 파라미터를 전달하여 Stored Procedure 호출
CALL get_menu_by_category(5);

-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS get_menu_count_by_category$$

-- OUT 파라미터를 사용하는 Stored Procedure 생성
CREATE PROCEDURE get_menu_count_by_category(
	IN p_category_code INT, 
    OUT p_count INT
)
BEGIN
    SELECT COUNT(*) INTO p_count FROM tbl_menu WHERE category_code = p_category_code;
END$$

-- DELIMITER 복구
DELIMITER ;

-- 변수를 선언하고 Stored Procedure 호출
SET @menu_count = 0;
CALL get_menu_count_by_category(4, @menu_count);

-- 결과 확인
SELECT @menu_count AS '메뉴 개수';-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS get_menu_count_by_category$$

-- OUT 파라미터를 사용하는 Stored Procedure 생성
CREATE PROCEDURE get_menu_count_by_category(
	IN p_category_code INT, 
    OUT p_count INT
)
BEGIN
    SELECT COUNT(*) INTO p_count FROM tbl_menu WHERE category_code = p_category_code;
END$$

-- DELIMITER 복구
DELIMITER ;

-- 변수를 선언하고 Stored Procedure 호출
SET @menu_count = 0;
CALL get_menu_count_by_category(4, @menu_count);

-- 결과 확인
SELECT @menu_count AS '메뉴 개수';-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS get_menu_count_by_category$$

-- OUT 파라미터를 사용하는 Stored Procedure 생성
CREATE PROCEDURE get_menu_count_by_category(
	IN p_category_code INT, 
    OUT p_count INT
)
BEGIN
    SELECT COUNT(*) INTO p_count FROM tbl_menu WHERE category_code = p_category_code;
END$$

-- DELIMITER 복구
DELIMITER ;

-- 변수를 선언하고 Stored Procedure 호출
SET @menu_count = 0;
CALL get_menu_count_by_category(4, @menu_count);

-- 결과 확인
SELECT @menu_count AS '메뉴 개수';

-- 123123123




-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS calculate_price$$

-- INOUT 파라미터를 사용하는 Stored Procedure 생성
CREATE PROCEDURE calculate_price(
	INOUT p_price DECIMAL(10,2), 
    IN p_tax_rate DECIMAL(4,2)
)
BEGIN
    SET p_price = p_price + (p_price * p_tax_rate);
END$$

-- DELIMITER 복구
DELIMITER ;

-- 변수를 선언하고 Stored Procedure 호출
SET @price = 10000;
CALL calculate_price(@price, 0.1);

-- 결과 확인
SELECT @price AS '세금 포함 가격';



-- sdsdsdsdsd



CREATE TEMPORARY TABLE tbl_menu_temp (
    menu_name VARCHAR(100),
    menu_price DECIMAL(10,2),
    category_code INT
);

INSERT INTO tbl_menu_temp VALUES
('메뉴1', 8000, 1),
('메뉴2', 9000, 2),
('메뉴3', 7500, 1);

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS insert_menu;

-- Stored Procedure 생성
CREATE PROCEDURE insert_menu(IN p_name VARCHAR(100), IN p_price DECIMAL(10,2), IN p_category_code INT)
BEGIN
    DECLARE v_exists INT DEFAULT 0;

    -- 메뉴 중복 여부 확인
    SELECT COUNT(*) INTO v_exists FROM tbl_menu WHERE menu_name = p_name;

    IF v_exists = 0 THEN
        -- 메뉴가 없으면 INSERT
        INSERT INTO tbl_menu (menu_name, menu_price, category_code, orderable_status)
        VALUES (p_name, p_price, p_category_code, 'Y');
    ELSE
        -- 메뉴가 있으면 UPDATE
        UPDATE tbl_menu SET menu_price = p_price WHERE menu_name = p_name;
    END IF;
END;

-- Stored Procedure 호출
CALL insert_menu('새로운메뉴', 8000, 3);
CALL insert_menu('새로운메뉴', 8500, 3);

SELECT ROUTINE_NAME
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
  AND ROUTINE_SCHEMA = 'menudb';   # 데이터베이스 명
  
  -- 사용자에게 특정 프로시저에 대한 실행 권한 부여
GRANT EXECUTE ON PROCEDURE get_menu_list TO ohgiraffers@'%';

-- 모든 프로시저에 대한 실행 권한 부여
GRANT EXECUTE ON *.* TO ohgiraffers@'%';


-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP PROCEDURE IF EXISTS divide_numbers$$

-- 에러 핸들링을 포함한 Stored Procedure 생성
CREATE PROCEDURE divide_numbers(
	IN p_num1 INT, 
	IN p_num2 INT, 
	OUT p_result DECIMAL(10,2)
)
BEGIN
    -- 에러 발생 시 핸들러 정의
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- 에러 발생 시 처리할 내용
        SET p_result = NULL;
        SELECT '에러가 발생했습니다.' AS error_message;
    END;

    -- 0으로 나누기 방지
    IF p_num2 = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '0으로 나눌 수 없습니다.';
    ELSE
        -- 정상적으로 나눗셈 계산
        SET p_result = p_num1 / p_num2;
    END IF;
END$$

-- DELIMITER 복구
DELIMITER ;

-- Stored Procedure 호출
CALL divide_numbers(10, 0, @output); -- 0으로 나눔 시도
SELECT @output AS '나눈 결과';

CALL divide_numbers(10, 2, @output); -- 정상 실행
SELECT @output AS '나눈 결과';




