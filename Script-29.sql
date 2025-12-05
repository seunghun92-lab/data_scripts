use employeedb;

select
	FORMAT(salary, 0) as 'SALARY',
	CONCAT(FORMAT(bonus * 100, 0), '%') as 'BONUS',
	format(salary + round(salary * ifnull(bonus, 0)), 0)  as 'TOTAL_SALARY'
	
from employee
order by
	format(salary + round(salary * ifnull(bonus, 0)), 0)  desc;



-- - 출력한 결과집합 헤더의 명칭은 각각 ‘EMP_NAME’, ‘EMAIL’이어야 함
-- - 이메일의 도메인 주소인 greedy.com 은 모두 동일하므로, 해당 문자열이 맞춰질 수 있도록 이메일의 앞에 공백을 두고 출력해야 함
--  직원의 직원명과 이메일을 다음과 같이 출력하세요.


select  * from employee;
select MAX(length(EMAIL)) from employee;

select 
	emp_name,
	Ipad(email, (select  MAX(length(EMAIL)) from EMPLOYEE), ' '




-- 사내 행사 준비를 위해 직원 목록을 출력하려고 합니다. 직원 목록을 다음과 같이 출력하세요0.
-- 단, 관리자의 이름순으로 정렬하여 출력되도록 하세요.
-- 	- 직원명, 직급명, 주민등록번호, 부서가 있는 국가, 부서명, 해당 직원의 관리자 직원명을 출력해야 함
-- - 출력한 결과집합 헤더의 명칭은 각각 ‘NAME_TAG’, ‘EMP_NO’, ‘BELONG’, ‘MANAGER_NAME’이어야 하며 출력 형식은 각각 아래와 같아야 함
--     - NAME_TAG : (직원명) (직급명)님
--     - EMP_NO : (생년월일6자리)-(뒷자리 한 자리를 제외하고는 *로 표시)
--     - BELONG : (부서의 국가)지사 (부서명) 소속
-- 	
select * from EMPLOYEE;
select * from department;
select * from job;
select * from location;
select * from nation;
	
select 
	concat(EMP.emp_name, ' ', ifnull(dept.dept_title, ' ') '님') as NAME_TAG,
	rpad(substring(emp.emp_no, 1, 8), 13, '*') as EMP_NO,
	concat(loc.national_name, '지사', dept.dept_title, '소속') as BELONG,
	manager.emp_ma,e as MANAGER_NAME
from 
	employee EMP
left join department dept on emp.dept_code = dept.dept_id
left join location loc on dept.location_id = loc.local_code
join employee manager on emp.manager_id = emp_id
join job j on emp.job_code = j.job_code
joing nation nat on loc.national_code = nat.natioal_code
order by manager_name 
	
	
	
	
	
	
	







