select * from sales_orders;
select * from sales_customers;
select * from sales_products;

select * from bookorders;
select * from bookmembers;
select * from books;


-- 15) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
select custid, name, saleprice, address from bookorders o inner join bookmembers m on o.cusid = m.custid;

#  15b) 박지성 고객의 주문금액,주소,주문일자를 조회하세요
select name,saleprice,address,orderdate from bookorders bo inner join bookmembers bm on bo.cusid = bm.custid where name = '박지성';

#  16) 주문한 도서이름,주문금액,주문일자를 조회하세요
select bookname,saleprice,orderdate from books bs inner join bookorders bo on bs.bookid = bo.bookid;

#  17) 박지성 고객의 주문금액,주소,주문일자를 조회하세요
select name,saleprice,address,orderdate from bookmembers bm inner join bookorders bo on bm.custid = bo.cusid where name = '박지성';

#  19) 가격이 20000인 도서를 주문한 고객 이름 조회하세요
select name , saleprice from books bs inner join bookorders bo
    inner join bookmembers bm
    on bs.bookid = bo.bookid
    and bm.custid = bo.cusid
    where saleprice = 20000;



#  21) 도서를 구매하지 않은 고객을 포함하여
#     고객이름과 주문한 도서의 판매금액을 조회하세요
-- 주문 + 고객 outer join : 차집합
-- 주문이 안된 상품과, 주문을 안한 사람

-- 도서를 구매한 고객
select orderid ,name
from bookorders o inner join bookmembers m
on o.cusid = m.custid;

-- 도서를 구매한 고객 + 도서를 구매하지 않은 고객
select name, orderid from bookorders o right outer join bookmembers m on o.cusid = m.custid
where orderid is null;
-- 주문된 도서 + 주문되지 않은 도서
select b.bookid,orderid,bookname
from bookorders bo right outer join books b
    on bo.bookid = b.bookid
order by bookid;
