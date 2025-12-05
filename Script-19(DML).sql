use menudb;
 
select * from tbl_menu;
select count(*) from tbl_menu;
insert into tbl_menu values (null, ' 바나나해장국', 8500, 4, 'Y')
select * from tbl_menu;


INSERT INTO tbl_menu(menu_name, menu_price, category_code, orderable_status)
VALUES ('초콜릿죽', 6500, 7, 'Y');

INSERT INTO tbl_menu(orderable_status, menu_price, menu_name, category_code)
VALUES ('Y', 5500, '파인애플탕', 4);

SELECT * FROM tbl_menu;
INSERT INTO 
    tbl_menu 
VALUES 
    (null, '참치맛아이스크림', 1700, 12, 'Y'),
    (null, '멸치맛아이스크림', 1500, 11, 'Y'),
    (null, '소시지맛커피', 2500, 8, 'Y');
select * from tbl_menu;


SELECT
    menu_code,
    category_code
FROM 
    tbl_menu
WHERE 
    menu_name = '파인애플탕';



select * from tbl_menu where menu_code = 7;

UPDATE tbl_menu
SET
    category_code = 7
WHERE
    menu_code = 24;

select * from tbl_menu where menu_code = 7;

UPDATE tbl_menu
SET
    category_code = 12
WHERE
    menu_code = 7;


UPDATE tbl_menu
SET
    category_code = 6
WHERE
    menu_code = (SELECT
		menu_code
	FROM 
		tbl_menu 
	WHERE 
		menu_name = '파인애플탕'
);    -- 1093 에러 발생


UPDATE tbl_menu
SET
    category_code = 6
WHERE
    menu_code = (SELECT
        tmp.menu_code
    FROM 
		(SELECT
            menu_code
        FROM 
            tbl_menu 
        WHERE 
            menu_name = '파인애플탕'
	) tmp
);



DELETE FROM tbl_menu
ORDER BY menu_price
LIMIT 2;


DELETE
FROM 
    tbl_menu
WHERE
    menu_code = 24;


DELETE FROM tbl_menu;

-- INSERT INTO tbl_menu VALUES (17, '참기름소주', 5000, 10, 'Y'); -- 에러 발생
REPLACE INTO tbl_menu VALUES (17, '참기름소주', 5000, 10, 'Y');
REPLACE tbl_menu VALUES (17, '참기름소주', 3000, 10, 'Y');

REPLACE tbl_menu
SET menu_code = 2,
    menu_name = '우럭쥬스',
    menu_price = 2000,
    category_code = 9,
    orderable_status = 'N';
















