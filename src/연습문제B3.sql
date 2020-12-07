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


# 자신의 매니저보다 먼저 고용된 사원들의
# LAST_NAME 및 고용일을 조회하세요.
select * from employees e1 inner join employees e2 on e1.employee_id = e2.manager_id;


부서별 사원수를 조회하세요
단, 부서명도 함께 출력합니다



부서별 사원수를 조회하세요
단, 부서명도 함께 출력하고
단, 사원수가 0이어도 부서명을 출력합니다





