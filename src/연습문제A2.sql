-- 연습문제 A2 (Books 테이블 3종)

-- 11b) 도서의 가격을 내림차순으로,
-- 가격이 같으면 출판사이름으로 오름차순 정렬해서 조회하세요
SELECT * from books order by price desc, publisher asc;

-- 12) 고객이 주문한 도서의 총, 평균, 최고,
-- 최저 판매액을 조회하세요
SELECT sum(saleprice),AVG(saleprice),MAX(saleprice),MIN(saleprice) from bookorders;

-- 13b) 출판사별 도서의 총 수량 조회하세요
SELECT publisher, count(bookid) from books group by publisher ;


--  14) 출판사별 도서의 총 수량이 2권이상인 출판사 조회하세요
SELECT publisher, count(bookid) as '총수량' from books group by publisher HAVING 총수량 >= 2;

--  14b) 가격이 8000이상인 도서를 구매한 고객별
--  주문 도서의 총 수량을 구하세요
SELECT cusid , SUM(saleprice), COUNT(orderid) from bookorders where saleprice >= 8000 group by cusid ;

--  14b) 가격이 8000이상인 도서를 구매한 고객별
--  주문 도서의 총 수량을 구하세요
--  단, 고객별 2권이상 주문한 고객을 대상으로 한다
SELECT cusid ,bookid ,COUNT(orderid) from bookorders where saleprice >= 8000 GROUP BY cusid HAVING COUNT(orderid) >= 2 ;

--  15) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
-- 고객 테이블과 주문테이블을 결합해야 조회 가능
-- 외래키 관계에 있는 컬럼을 대상으로 결합

--  15b) 박지성 고객의 주문금액,주소,주문일자를 조회하세요


-- 16) 주문한 도서이름,주문금액,주문일자를 조회하세요


-- 17) 박지성 고객의 주문금액,주소,주문일자를 조회하세요


-- 18) 주문한 도서이름,주문금액,주문일자를 조회하세요


-- 19) 가격이 20000인 도서를 주문한 고객 이름 조회하세요


-- 20) 주문한 고객이름, 도서이름, 주문일자 출력하세요


-- 21) 도서를 구매하지 않은 고객을 포함하여
--    고객이름과 주문한 도서의 판매금액을 조회하세요

