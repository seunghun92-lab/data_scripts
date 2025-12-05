use menudb;

select 
	menu_code
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	category_code = 10
union;
select 
	menu_code
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	menu_price = 9000;

select * from tbl_menu