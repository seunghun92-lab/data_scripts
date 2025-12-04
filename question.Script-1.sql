use employeedb;

-- 재직 중이고 휴대폰 마지막 자리가 2인 직원 중 입사일이 가장 최근인 직원 3명의 사원번호, 직원명, 전화번호, 입사일, 퇴직여부를 출력하세요.

-- 참고. 퇴사한 직원은 퇴직여부 컬럼값이 ‘Y’이고, 재직 중인 직원의 퇴직여부 컬럼값은 ‘N’

select 
  e.EMP_NAME,
  j.JOB_NAME,
  e.SALARY,
  e.EMP_ID,
  e.EMAIL,
  e.PHONE,
  e.HIRE_DATE
FROM
    employee e
join
	job j ON e.JOB_CODE = j.JOB_CODE
where
	  e.ENT_YN = 'N'        
  AND j.JOB_NAME = '대리'
ORDER BY
    e.SALARY DESC;


-- 문제3 ! 재직 중인 직원들을 대상으로 부서별 인원, 급여 합계, 급여 평균을 출력하고, 
-- 마지막에는 전체 인원과 전체 직원의 급여 합계 및 평균이 출력되도록 하세요.
-- 단, 출력되는 데이터의 헤더는 컬럼명이 아닌 ‘부서명’, ‘인원’, ‘급여합계’, ‘급여평균’으로 출력하세요
	

SELECT
    IFNULL(d.DEPT_title, '전체') AS '부서명',
    COUNT(*) AS  인원,
    SUM(e.SALARY) AS '급여합계',
    AVG(e.SALARY) AS '급여평균'
FROM employee e
left join department d ON e.DEPT_CODE = d.DEPT_id
where e.ENT_YN = 'N'
GROUP BY d.DEPT_TITLE WITH ROLLUP;


-- 전체 직원의 직원명, 주민등록번호, 전화번호, 부서명, 직급명을 출력하세요.

-- 단, 입사일을 기준으로 오름차순 정렬되도록 출력하세요.

SELECT
    e.emp_name AS '직원명',
    e.emp_no   AS '주민등록번호',
    e.phone    AS '전화번호',
    d.dept_title AS '부서명',
    j.job_name AS '직급명'
FROM employee e
LEFT JOIN department d ON e.dept_code = d.dept_id
LEFT JOIN job j ON e.job_code = j.job_code
ORDER BY e.hire_date ASC;





-- <1단계> 전체 직원 중 연결된 관리자가 있는 직원의 인원을 출력하세요.

D

select
	count(*)
from employee
where manager_id is not null;


-- <2단계> 1단계에서 조회한 내용에는 문제가 조금 있습니다. 관리자사번이 존재하여 연결된 관리자가 있기는 하나, 해당 관리자가 직원 목록에 존재하지 않는 직원이 있습니다.

-- 따라서 1단계를 디벨롭하여 직원 목록에 관리자사번이 존재하는 직원의 인원을 출력하세요.
select * from employee;
select 
	count(*)
from employee e1
join employee e2 on e1.manager_id = e2.emp_id


-- <3단계> 모든 직원의 직원명과 관리자의 직원명을 출력하세요.

-- 참고. ‘모든 직원’이므로 관리자가 존재하지 않는 직원도 출력되어야 합니다.
select 
	e1.emp_name as 직원명,
	e2.EMP_NAME as 매니저명
from employee e1
join employee e2 on e1.manager_id = e2.emp_id


<4단계> 관리자가 존재하는 직원의 직원명, 부서명, 관리자의 직원명, 관리자의 부서명을 출력하세요.

select * from employee where manager_id is not full;
select * from department;

select
	e1.emp_name,
	d1.dept_title,
	e2.emp_name,
	d2.dept_title,
from employee e1
left join department d1 on e1.dept_code = d1.dept_id
join employee e2 on e1.MANAGER_ID = e2.EMP_ID 
left join department d2 on e2.DEPT_CODE = d2.dept_id













	