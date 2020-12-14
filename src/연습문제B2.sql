-- 연습문제B2 (HR 데이터베이스)
-- 23. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT MAX(salary) 최고연봉,
       MIN(salary) 최소연봉,
       SUM(salary) '총 연봉',
       ROUND(AVG(salary)) 평균연봉
from employees;

-- 24. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT job_id,
       MAX(salary),
       min(salary),
       SUM(salary),
       ROUND(AVG(salary))
from employees
group by job_id;

-- 25. 동일한 직업을 가진 사원들의 총 수를 조회한다.
SELECT job_id, count(employee_id) as 사원수 from employees group by job_id ;

-- 26. 매니저로 근무하는 사원들의 총 수를 조회한다.
select count(distinct manager_id) from employees ;

-- 27. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.
SELECT max(salary), min(salary),
       MAX(salary)-MIN(salary) 연봉차이 from employees;

-- 28. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다.
--     매니저가 없는 사람들은 제외한다.
--     최소 연봉이 6000 미만인 경우는 제외한다.
--     연봉 기준 역순으로 조회한다.
select manager_id, min(salary) 최소연봉 , employee_id
from employees
where manager_id is not null
group by manager_id having 최소연봉 >= 6000
order by 최소연봉 desc ;

-- 29. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉을 조회한다.
--     평균 연봉은 소수점 2 자리까지만 표현한다.
-- 조인 이용
select department_name, location_id, count(employee_id), round(avg(salary),2) from employees e join departments d using (department_id) group by department_name;

-- 30. 총 사원 수 및 2001, 2002, 2003, 2004 년도 별 고용된 사원들의 총 수를 조회한다.
-- 복합 쿼리문
select (select count(employee_id) from employees where year(hire_date) = 2001) 2001년입사,
       (select count(employee_id) from employees where year(hire_date) = 2002) 2002년입사,
       (select count(employee_id) from employees where year(hire_date) = 2003) 2003년입사,
       (select count(employee_id) from employees where year(hire_date) = 2004) 2004년입사,
       (select count(employee_id) from employees)'총 사원수';

-- 31. 부서번호별 사원수를 조회하라. (부서번호 오름차순 정렬)
SELECT department_id 부서번호,
       count(employee_id) 사원수
from employees group by department_id order by department_id;

-- 32.  각 부서별 각 직업 별 연봉 총 합 및 평균연봉을 조회한다.
SELECT department_id,
       job_id,
       sum(salary) 총합,
       round(avg(salary)) 평균
from employees
group by department_id ,job_id;

select substring_index() from employees;

select if(1>5, 1, if(2>5, 1, 2));
