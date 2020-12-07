-- 조인 검색
-- 다중 테이블을 대상으로 하는 연산
-- 여러개의 테이블을 결합해서 원하는 데이터를 검색하는 것
-- 조인방법 : inner join , outer join, self join

-- inner join
-- 각 테이블에 존재하는 동일한 컬럼을 대상으로 결합해서 결과 조회
-- select A.a, A.b, B.a, B.b from A,B where A.a = B.b
-- select A.a, A.b, B.a, B.b from A inner join B on A.a = B.b  (표준)
-- select A.a, A.b, B.a, B.b from A inner join B using (a) (표준)

-- 23) 주문테이블에서 banana 고객이 주문한 상품의 이름을 조회하세요.
-- a. 두 테이블 결합하기 cartesian product
select * from sales_orders, sales_products where sales_orders.prodno = sales_products.prodno;
-- 테이블명이 길어서 별칭을 사용해서 간단히 작성
select * from sales_orders so, sales_products sp where so.prodno = sp.prodno;

select * from sales_orders so inner join sales_products sp on so.prodno = sp.prodno;

select * from sales_orders so inner join sales_products sp using (prodno);

select ordno,prodno,prdname
from sales_orders so inner join sales_products sp
using (prodno) where  custid='banana';

-- 24) 주문 테이블에서 나이가 30세 이상인 고객이 주문한 제품의 제품번호와 주문일자를 조회하세요.
select prodno,orddate from sales_orders so inner join sales_customers sc on so.custid = sc.custid where age>=30;

-- 25)  주문 테이블에서 고명석 고객이 주문한 제품의 이름을 조회하세요.
select * from sales_orders so inner join sales_customers sc using (custid) where name = '고명석';
select * from sales_customers so inner join sales_orders sc inner join  sales_products sp on so.custid = sc.custid and sc.ordno = sp.prodno where name = '고명석';

select prdname, name
    from sales_orders so
    inner join sales_customers sc
    inner join sales_products sp
    on so.custid = sc.custid
    and so.prodno = sp.prodno
where name = '고명석';
