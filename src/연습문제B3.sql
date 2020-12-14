select * from employees;
select * from departments;
select * from jobs;

# 모든 사원들의 LAST_NAME, 부서 이름 및
# 부서 번호을 조회하세요
select last_name, department_name, e.department_id
from employees e
    inner join departments d
        on e.department_id = d.department_id;


# 부서번호 30의 모든 직업들과 부서명으로 조회
# 하세요. 90 부서 또한 포함한다.
select d.department_id, job_title, department_name from employees e inner join jobs j
    inner join departments d on e.department_id = d.department_id
    and j.job_id = e.job_id
where d.department_id in (90 ,30)
group by job_title;


# 부서번호 30 이하의 모든 직업들과
# 부서명으로 조회하세요
select job_title,department_name,d.department_id from departments d inner join employees e
    inner join jobs j on e.job_id = j.job_id
    and d.department_id = e.department_id
where d.department_id <= 30;


# 커미션을 버는 모든 사람들의 LAST_NAME,
# 부서명, 지역 ID 및 도시 명을 조회하세요
select last_name,department_name, l.location_id,city, commission_pct from employees e inner join departments d
    inner join locations l
        on d.location_id = l.location_id
        and e.department_id = d.department_id
where commission_pct is not null
order by commission_pct;


# 커미션을 버는 사람들 중 시애틀에 거주하는
# 사람들의 LAST_NAME, 부서명, 지역 ID 및
# 도시 명을 조회하세요
select last_name,department_name,l.location_id,city from employees e inner join departments d
    inner join locations l
        on d.location_id = l.location_id
    and e.department_id = d.department_id
where commission_pct is not null and city = 'oxford';


-- 자신의 매니저의 이름과 고용일을 조회하세요
select*
from employees mgr join employees emp
    on emp.manager_id = mgr.employee_id ;

# 자신의 매니저보다 먼저 고용된 사원들의
# LAST_NAME 및 고용일을 조회하세요.
select
    emp.last_name 사원명,
    emp.hire_date 사원입사일,
    mgr.last_name 매니저명,
    mgr.hire_date 매니저입사일
from employees mgr join employees emp
on emp.manager_id = mgr.employee_id
where emp.hire_date < mgr.hire_date;


# 부서별 사원수를 조회하세요
# 단, 부서명도 함께 출력합니다
select department_name, department_id, count(department_id) 사원수 from departments inner join employees e
    using (department_id)
group by department_name
order by department_name;


# 부서별 사원수를 조회하세요
# 단, 부서명도 함께 출력하고
# 단, 사원수가 0이어도 부서명을 출력합니다

select department_name,count(employee_id) 사원수 from employees e right join departments d
    using (department_id)
group by department_name
order by 사원수 desc ;




