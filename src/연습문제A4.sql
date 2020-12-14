# LAST_NAME 이 Zlotkey 와 동일한 부서에
# 근무하는 모든 사원들의 사번 및
# 고용날짜를 조회한다. 단, Zlotkey 는 제외한다.
-- a) 졸로키가 근무하는 부서
select department_id from employees where last_name = 'zlotkey';
-- b) 80번 부서에 근무하는 모든 사원들의 사번과 고용날짜
select employee_id, hire_date from employees
where department_id = (select department_id from employees where last_name = 'zlotkey')
  and last_name <> 'zlotkey';

# 회사 전체 평균 연봉보다 더 받는 사원들의
# 사번 및 LAST_NAME 을 조회한다.
-- a) 평균연봉
select avg(salary) from employees;
-- b) 평균연봉보다 많이받는 사원들의 사번과 last네임
select employee_id, last_name from employees where salary > (select avg(salary) from employees);


# LAST_NAME 에 u가 포함되는
# 사원들과 동일 부서에 근무하는 사원들의
# 사번 및 LAST_NAME 을 조회한다.
-- a)LAST_NAME 에 u가 포함되는 사원들의 부서
select distinct department_id from employees where last_name like '%u%';
-- 합체
select employee_id,last_name from employees where department_id in (select distinct department_id from employees where last_name like '%u%');


# King 을 매니저로 두고 있는 모든 사원들의
# LAST_NAME 및 연봉을 조회한다.
# 즉, King의 부하직원의 성과 연봉 조회하라
-- a) king의 직원번호
select employee_id from employees where last_name = 'king';

select last_name, salary from employees where manager_id in (select employee_id from employees where last_name = 'king');


# EXECUTIVE 부서에 근무하는
# 모든 사원들의 부서 번호,
# LAST_NAME, JOB_ID를  조회한다.
-- a) executive 부서의 부서번호
select department_id from departments where department_name = 'executive';
-- 합체
select department_id,last_name,job_id from employees where department_id = (select department_id from departments where department_name = 'executive');

# 회사 전체 평균 연봉보다
# 더 버는 사원들 중 LAST_NAME 에
# u 가 있는 사원들이 근무하는 부서에서
# 근무하는 사원들의 사번, LAST_NAME 및
# 연봉을 조회한다.
-- 회사 전체 평균
select avg(salary) from employees;
-- 평균보다 더 버는사람들 중 last name에 u가 잇는애들이 근무하는 부서 명
select distinct department_id from employees where salary > (select avg(salary) from employees) and last_name like '%u%';
-- 합체
select employee_id, last_name,salary from employees
where department_id in (select distinct department_id from employees
where salary > (select avg(salary) from employees) and last_name like '%u%');

# 직업ID 가 SA_MAN 인 사원들이
# 받을 수 있는 최대 연봉보다 높게 받는
# 사원들의 LAST_NAME, JOB_ID 및 연봉을
# 조회한다.
-- a) sa_man중의 최대연봉
select max_salary from jobs where job_id = 'sa_man';
-- 합체
select last_name,job_id,salary from employees where salary>(select max_salary from jobs where job_id = 'sa_man');

select salary from employees where job_id = 'sa_man';
select last_name, job_id, salary from employees where salary > all (select salary from employees where job_id = 'sa_man');

# 도시 이름이 T 로 시작하는 지역에
# 근무하는 사원들의 사번, LAST_NAME 및
# 부서 번호를 조회한다.

-- t로 시작하는 지역의 로케이션아이디
select location_id from locations where city like 't%';
-- 해당 지역에 있는 부서번호
select department_id from departments where location_id in (select location_id from locations where city like 't%');

select employee_id, last_name, department_id from employees where department_id in (select department_id from departments where location_id in (select location_id from locations where city like 't%'));


# DML : UPDATE
# 데이터베이스의 특정 레코드의 값을 변경할 때 사용
# update 테이블명
# set 변경할 컬럼명 = 새로운값, ...
# where 조건식;

-- 33) 제품테이블에서 제품번호가 p03인 제품명을 통큰파이로 변경하세요.
select * from sales_products;
update sales_products set prdname = '통큰파이' where prodno = 'p03';

-- 34) 제품 테이블에 있는 모든 제품의 단가를 10% 인상하고 그 결과를 조회하세요.
select * from sales_products;
update sales_products set price = price*1.1;

-- 35) 정소화 고객이 주문한 제품의 수량을 5개로 수정하세요.
select * from sales_customers;
select custid from sales_customers where name = '정소화';
select * from sales_orders;

update sales_orders
set qty = 5
where custid = (select custid from sales_customers where name = '정소화');

update sales_customers c join sales_orders o using (custid) set qty = 5 where name = '정소화';


-- DML : delete
-- 지정한 레코드(행)를 삭제함
# delete from 테이블명 where 조건식;

-- 36) 주문일자가 2019-05-22 인 주문내역을 삭제하세요.
select * from sales_orders;
delete from sales_orders where orddate = '2019-05-22%';


-- 37) 정소화 고객이 주문한 내역을 삭제하세요.
delete from sales_orders where custid = (select custid from sales_customers where name = '정소화');

-- 38) 주문 내역을 모두 삭제하세요
delete from sales_orders;
select count(custid) from sales_orders;
rollback ;
commit ;
select * from sales_orders;


-- create view 뷰이름 as select문
-- 39) vip고객의 아이디, 이름, 나이로 구성된 뷰 생성. 단 이름은 우수고객으로 작성
select custid,name,age from sales_customers where grade = 'vip';

create view 우수고객 as select custid,name,age from sales_customers where grade = 'vip';

select * from 우수고객;

-- 40) 제조업체별 제품수로 구성된 뷰 생성 뷰 이름은 업체별 제품수로 지정
select prdmaker, count(prodno) 제품수 from sales_products group by prdmaker;
drop view 업체별제품수;
create view 업체별제품수 as select prdmaker, count(prodno) 제품수 from sales_products group by prdmaker;
select * from 업체별제품수3;

create view 업체별제품수3 (업체,제품수) as select prdmaker, count(prodno) 제품수 from sales_products group by prdmaker;

-- 41) 우수고객 테이블에서 나이가 25세 이상인 회원 조회
select * from 우수고객 where age >= 25;

-- 뷰를 이용한 데이터 삽입, 수정, 삭제
-- 뷰는 원본테이블의 분신이므로 삽입,수정,삭제 작업은 원본테이블을 대상으로 진행
-- 단, 삽입, 수정, 삭제는 제한적으로 수행될 수 있음
-- 42) 제품번호가 p08, 재고량이 1000, 제조업체가 신선식품인 새로운 제품의 정보를 제품1 뷰에 삽입 후 검색하자
select prodno,stock,prdmaker from sales_products;
create view 제품1 as select prodno,stock,prdmaker from sales_products;
select * from 제품1;
insert into 제품1 values ('p08',1000,'신선식품');

-- 테이블의 컬럼에 특정 제약조건이 설정되어 있는 경우
-- 뷰를 통한 데이터 삽입은 제한될 수 있음
create table sales_product2 (
    prodno int primary key ,
    prdname varchar(10) not null, -- 필수입력
    stoke int,
    price int,
    prdmaker varchar(10)
);

select * from sales_product2;

create view 제품2 as select * from sales_product2;
select * from 제품2;
insert into 제품2 (prodno, stoke, prdmaker) values (11,5000,'새로운식품'); -- 제약조건으로 인해 데이터입력실패!

-- sales_product 테이블에서
-- 제품명, 재고량, 제조업체를 골라서
-- 제품3이라는 뷰를 생성하고
-- 제품명이 얼큰라면을 삭제하세요.
create view 제품3 as
    select prdname,stock,prdmaker from sales_products;
select * from 제품3;
delete from 제품3 where prdname='얼큰라면';
-- prdname이 기본키 속성이 아니기 때문에 예상치 못한 데이터의 삭제가 일어날 수 있다.

-- 주문, 상품, 고객테이블을 조인한 후 판매데이터라는 뷰를 만드세요 또한, apple고객이 주문한 상품의 이름을 조회하세요
create view 판매데이터 as
select * from sales_orders so join sales_customers sc using (custid)
join sales_products sp using (prodno);

select prdname from 판매데이터 where custid = 'banana';

-- 사원,부서,위치 테이블을 조인하고
-- empdeptloc라는 뷰를 만드세요
-- 또한 king이라는 사원이 근무하는 사무실의 도시를 조회하세요

create or replace view departments2 (department_id,department_name,dmgr_id,location_id)as
    select * from departments;

create view empdeptloc as
select employee_id,last_name,first_name,email,department_id,department_name,location_id,city,country_id,e.manager_id
from employees e join departments2 d using (department_id)
join locations l using (location_id);

select * from empdeptloc where last_name = 'king';