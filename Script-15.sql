
use menudb;

select * from tbl_menu;

select category_code
from tbl_menu
where menu_name = '민트미역국';

select * from tbl_menu;

select *
from tbl_menu
where
	category_code = (
	select category_code
	from tbl_menu
	where menu_name = '민트미역국'
);


-- 서브쿼리 미사용

select *
from tbl_menu
where
	category_code = 4;


-- 서브쿼리를 활용해서 가장 많은 메뉴가 포함된 카테고리 조회

select count(*) as count
from tbl_menu
group by category_code;



select
	max(count)
from
	(
	select category_code, count(*) as count
    from tbl_menu
	group by category_code
	) as countmenu;

-- 상관 서브쿼리
-- 메인 쿼리가 서브쿼리의 결과에 영향을 주는 경우

select
	avg(menu_price)
from tbl_menu
where category_code = 4;alter 

-- 서브쿼리 활용한 메인 쿼리
select 	
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu a
where
	menu_price > (
	select avg(menu_price)
	from tbl_menu
	where ategory_code = 4
	);

-- EXISTS 데이터가 존재하는지 확인 (값은 안넘어옴)
select 
	category_name
from
	tbl_category a
where 
	EXISTS(
		select 1
		from tbl_menu b
		where b. category_code = a.category_code
	)
order by 1;


with menucate as (
	select 
		menu_name,
		category_name
	from tbl_menu a
	join tbl_category b on a.category_Code = b.category_code;
)

select *
from menucate
order by menu_name;



