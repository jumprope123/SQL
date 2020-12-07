-- 연습문제B1 (HR 데이터베이스)

-- 1. 모든 사원의 이름(FIRST_NAME, LAST_NAME)을 조회하라.
SELECT first_name as '성',last_name as '이름' from employees;

-- 2. 모든 사원의 모든 정보를 조회하라.
SELECT * from employees;
desc employees;

-- 3. 모든 도시 명을 조회하라.
select city from locations;

-- 4. 이름(FIRST_NAME)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
SELECT * from employees where first_name like 'm%' order by first_name;

-- 5. 이름(FIRST_NAME)의 두 번째 글자가 'a'인 사원의 이름(FIRST_NAME)과 연봉을 조회하라.
SELECT first_name ,salary from employees where first_name LIKE '_a%';

-- 6. 도시 명을 오름차순 정렬하라.
SELECT city from locations order by city ASC ;

-- 7. 부서 명을 내림차순 정렬하라.
SELECT department_name from departments order by department_name DESC;

-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.
SELECT * from employees where salary >= 7000 ORDER BY salary ;

-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.
SELECT * from employees where commission_pct is null;

-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.
SELECT * from employees where commission_pct is not null;

-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(FIRST_NAME, LAST_NAME) 그리고 부서번호를 조회하라.
SELECT employee_id , first_name , last_name , department_id, hire_date from employees where hire_date = '2007-06-21';

-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.
SELECT employee_id ,hire_date from employees where hire_date LIKE '2006%' order by hire_date;

-- 13. 이름(FIRST_NAME)의 길이가 5글자 이상인 사원을 조회하라.
SELECT first_name from employees where first_name LIKE '_____%' order by first_name;

-- 14. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
SELECT last_name , salary from employees where salary not BETWEEN 5000 and 12000;

-- 15. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
SELECT last_name , department_id from employees where employee_id = 176;

-- 16. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
SELECT last_name ,salary from employees where salary >=12000;

-- 17. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
SELECT last_name ,hire_date from employees where hire_date like '1994%' order by hire_date;

-- 18. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT last_name ,job_id ,manager_id from employees where manager_id is null;

-- 19. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--     단, 연봉 역순, 커미션 역순으로 정렬한다.
SELECT last_name ,salary ,commission_pct from employees
where commission_pct is not null
order by salary DESC, commission_pct desc ;

-- 20. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
SELECT first_name, last_name from employees where last_name like '___a';

-- 21. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
SELECT first_name, last_name from employees where last_name like '%a%' OR last_name like '%e%';

-- 22. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
SELECT last_name, job_id, salary from employees
where (salary <> 2500 and salary <> 3500 and salary <> 7000)
  and (job_id ='sa_rep' or job_id ='st_clerk')
order by salary;