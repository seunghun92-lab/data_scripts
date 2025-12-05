use employeedb;

SELECT
    emp_name AS EMP_NAME,
    concat(
    substr(phone,1,3),'-',
    substr(phone,4,4),'-',
    substr(phone,8,4)
    ) AS PHONE
FROM 
    employee
where substring(phone, 1, 3) = '010';

-- 문제 2
-- 근속 일수가 20년 이상인 직원의 직원명, 입사일, 급여를 다음과 같이 출력하세요.
-- 단, 입사한 순서대로 출력하고 입사일이 같으면 급여가 높은 순서로 출력되도록 하세요.
-- CONCAT, FORMAT, DATE 관련 함수, YEAR, MONTH, DAY

select 
	emp_name as "직원명", 
	concat(year(hire_date), '년', month(hire_date), '월' day(hire_date), '일') as "입사일",	
	format(salary, 0) as "급여"
from
	employee
where
	datediff(now(), hire_date)) >= (20*365)
order by
	입사일 asc, 급여 desc;

-- 문제 3
-- 모든 직원의 직원명, 급여, 보너스, 급여에 보너스를 더한 금액을 다음과 같이 출력하세요.
-- 단, 급여에 보너스를 더한 금액이 높은 순으로 출력되도록 하세요.
-- 출력한 결과집합 헤더의 명칭은 각각 ‘EMP_NAME’, ‘SALARY’, ‘BONUS’, ‘TOTAL_SALARY’여야 함
--  보너스를 더한 급여는 소수점이 발생할 경우 반올림 처리함
--  급여와 보너스를 더한 급여는 천 단위로 , 를 찍어 출력해야 함
--  보너스는 백분율로 출력해야 함
	





















