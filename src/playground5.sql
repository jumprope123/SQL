-- 서브쿼리 subquery
-- 메인 쿼리 안에 또 다른 쿼리문으로 구성
-- 스칼라 서브 쿼리 : 결과값으로 하나의 값이 조회
-- 인라인 뷰 : 결과값으로 여러개의 값이 조회
-- 질의문을 여러 단계로 구조화 하기 때문에 각 질의문이 의도하는 의미를 쉽게 파악

-- where, from , select 등에 서브쿼리 사용 가능

-- 26) 달콤 비스킷을 생산한 제조업체가 만든 제품이름과 단가를 계산
-- a) 달콤 비스킷을 생산한 제조업체 ?
select prdmaker from sales_products where prdname = '달콤비스킷';
-- b) 한빛 제과가 만든 제품의 이름과 단가를 검색
select prdname, price from sales_products where prdmaker = '한빛제과';
-- c) 두개의 질의문을 하나로 합침
select prdname, price from sales_products
where prdmaker = (select prdmaker
from sales_products where prdname = '달콤비스킷');

-- 27)적립금이 가장 많은 고객의 이름과 적립금 조회
-- a) 가장 많은 적립금은?
select max(points) from sales_customers ;
-- b) 적립금이 5000인 고객의 이름과 적립금 조회
select name,points from sales_customers
where points = (select max(points) from sales_customers);

-- 28) banana 고객이 주문한 제품의 제품명과 제조업체를 조회
-- a) 바나나 고객이 주문한 제품
select prodno from sales_orders where custid = 'banana';

-- b) p06, p01, p04 번 제품의 제품명과 제조업체를 조회
select prodno , prdname, prdmaker from sales_products where prodno = 'p01' or prodno = 'p04' or prodno = 'p06' ;

-- 합치기
select prodno , prdname, prdmaker from sales_products where prodno in (select prodno from sales_orders where custid = 'banana');

-- 29) banana 고객이 주문하지 않은 제품의 제품명과 제조업체를 조회
-- a) 바나나 고객이 주문한 제품
select prodno from sales_orders where custid = 'banana';
-- b) 전체 제품 - 바나나 고객이 주문한 제품
select prodno from sales_products where prodno not in (select prodno from sales_orders where custid = 'banana');
-- 최종
select prdname,prdmaker from sales_products where prodno in (select prodno from sales_products where prodno not in (select prodno from sales_orders where custid = 'banana'));

-- 30) 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체 조회
-- a) 대한식품이 제조한 모든 제품명 중 젤 비싼거
select max(price) from sales_products where prdmaker = '대한식품';
-- b) 4500원 보다 비싼 제품
select prdname,price,prdmaker from sales_products where price > 4500;
-- 합체
select prdname,price,prdmaker from sales_products where price > (select max(price) from sales_products where prdmaker = '대한식품');

-- 31) 2019년 3월 15일에 제품을 주문한 고객의 이름 조회
-- a) 2019년 3월 15일 주문한 사람 이름
select custid from sales_orders where orddate = '2019-03-15%';
-- b) custid가 apple인 사람
select name from sales_customers where custid = 'apple';
-- 합체
select name from sales_customers where custid = (select custid from sales_orders where orddate = '2019-03-15%');

-- d) inner join으로 풀어보기
select name from sales_orders so inner join sales_customers sc using (custid)
where orddate = '2019-03-15%';


-- 32) 2019년 3월 16일에 제품을 주문하지 않은 고객의 이름 조회
-- a) 2019년 3월 16일에 제품 주문한 사람
select custid from sales_orders  where orddate = '2019-03-16%' ;
-- b) 2019년 3월 16일에 제품 주문 안한사람의 아이디
select  distinct custid from sales_orders where custid not in (select custid from sales_orders  where orddate = '2019-03-16%');
-- 합체
select name from sales_customers where custid in (select  distinct custid from sales_orders where custid not in (select custid from sales_orders  where orddate = '2019-03-16%'));
