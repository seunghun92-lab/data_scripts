
use menudb;

SELECT 
    category_code
FROM
    tbl_menu
GROUP BY category_code;

SELECT 
    category_code,
    COUNT(*)
FROM
    tbl_menu
GROUP BY category_code;



SELECT 
    category_code,
    SUM(menu_price),
    count(*)
FROM
    tbl_menu
GROUP BY category_code;



SELECT 
    category_code,
    AVG(menu_price)
FROM
    tbl_menu
GROUP BY category_code;

-- 123124124124
SELECT 
    category_code,
    AVG(menu_price)
FROM
    tbl_menu
GROUP BY category_code;

-- 12312312312312312312312321312312333333333333333333333333333333

SELECT 
    menu_price,
    category_code
FROM
    tbl_menu
GROUP BY 
    menu_price,
    category_code
HAVING 
    category_code >= 5 AND category_code <= 8;



-- -----------------------------------------------------------------

SELECT 
    category_code,
    SUM(menu_price)
FROM
    tbl_menu
GROUP BY 
    category_code
WITH ROLLUP;

-- ---------------------------------------------------

SELECT 
    menu_price,
    category_code,
    SUM(menu_price)
FROM
    tbl_menu
GROUP BY 
    menu_price,
    category_code
WITH ROLLUP;




