use employeedb;

SELECT 
    menu_code AS 'code',
    menu_name AS name,
    menu_price 'price'
FROM
    tbl_menu
ORDER BY price;


SELECT
    a.category_code,
    a.menu_name
FROM
    -- tbl_menu AS a
    tbl_menu a
ORDER BY 
    a.category_code,
    a.menu_name;

-- inner join

SELECT 
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
-- INNER JOIN tbl_category b ON a.category_code = b.category_code;
JOIN tbl_category b ON a.category_code = b.category_code;

desc tbl_menu;
desc tbl_category;

select * from tbl_menu

-- USING을 활용한 JOIN 

SELECT 
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
INNER JOIN tbl_category b USING (category_code);


-- 첫 번째(왼쪽) 테이블의 모든 레코드와 두 번째(오른쪽) 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형
SELECT 
    a.category_name,
    b.menu_name
FROM 
    tbl_category a
LEFT JOIN tbl_menu b ON a.category_code = b.category_code;

select * from tbl_category;
select * from tbl_menu;



SELECT 
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
RIGHT JOIN tbl_category b ON a.category_code = b.category_code;

-- cross join
SELECT 
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
CROSS JOIN tbl_category b;

select * from tbl_menu;
select * from tbl_category;


-- self join

SELECT
    a.category_name,
    b.category_name
FROM 
    tbl_category a
JOIN tbl_category b ON a.ref_category_code = b.category_code
WHERE a.ref_category_code IS NOT NULL;





SELECT /*+ HASH_JOIN(a) */
    a.menu_name,
    b.category_name
FROM
    tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code;


select



