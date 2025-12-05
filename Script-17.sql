use employeedb;

select dept_code , sum(salary) as sal_sum
from employee
where dept_code is not null 
group by dept_code;

select MAX(SAL)
from(
	select dept_code , sum(salary) as sal_sum
	from employee
	where dept_code is not null 
	group by dept_code;
) as tbl_dept_sal;

-- q2. 서브쿼리를 이용하여 영업부인 직원들의 사원번호, 직원명, 부서코드, 급여를 출력하세요. 
-- 참고. 영업부인 직원은 부서명에 ‘영업’이 포함된 직원임
select * from employee;
select * from department;



select dept_id
from department
where dept_title like '%영업%'






-- 영업부인 직원들의 dept_id 가 d4, d5, d6, d7
select 
	emp_id,
	emp_name,
	dept_code,
	salary
from
	employee
where dept_code in ( 
	select dept_id,
	from department,
	where dept_title like '%영업%'
	)
select * from employee;
select * from department;

select 	
	e.emp_id,
	e.emp_name,
	d.dept_titke,
	e.salary
from employee e
join department d on e.dept