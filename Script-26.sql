use employeedb;


select 
	emp_name, as EMP_NAME
	phone, as PHONE 
from
	employee
where
	phone like concat "010%";

