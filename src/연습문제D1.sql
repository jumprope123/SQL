# northwind 데이터셋 이용

# 1. 고객 테이블을 조회하세요
select * from Customers;

# 2. 고객테이블에서 고객이름과 도시를 조회하세요
select ContactName, City from Customers;

# 3. 고객 테이블에서 도시를 조회하세요
# (중복은 제외한다)
select distinct City from Customers;

# 4. 고객 테이블에서 국가 수를 조회하세요
select count(distinct Country) 국가수 from Customers;

# 5. 고객 테이블에서 국가가 'Mexico'인 고객을
# 조회하세요
select ContactName from Customers where Country = 'Mexico';

# 6. 사원 테이블에서 ID가 5인 사원을 조회하세요
select * from Employees where EmployeeID = 5;

# 7. 고객 테이블에서 국가가 'Germany'이고
# 도시가 'Berlin'인 고객을 조회하세요
select * from Customers where Country = 'germany' and City = 'berlin';

# 8. 고객 테이블에서 도시가 'Berlin' 이거나
# 'München'인 고객을 조회하세요
select * from Customers where City in ('berlin', 'München');

# 9. 고객 테이블에서 국가가 'Germany' 또는
# 'Spain' 인 고객을 조회하세요
select * from Customers where Country in ('germany', 'spain');

# 10. 고객 테이블에서 국가가 'Germany' 이 아닌
# 고객을 조회하세요
select * from Customers where Country <> 'germany';

# 11. 고객 테이블에서 국가가 'Germany' 이고 도시가
# 'Berlin' 이거나 'München'인 고객을 조회하세요
select * from Customers where Country = 'germany' and city in ('berlin', 'München');

# 12. 고객 테이블에서 국가가 'Germany' 아니고
# 'USA'도 아닌 고객을 조회하세요
select * from Customers where Country not in ('germany','usa');

# 13. 고객 테이블에서 국가순으로 A-Z로
# 정렬해서 조회하세요
select * from Customers order by Country;

# 14. 고객 테이블에서 국가순으로 Z-A로
# 정렬해서 조회하세요
select * from Customers order by Country desc ;


# 15. 고객 테이블에서 국가순으로 A-Z로 정렬하되,
# 같은 경우 고객이름으로 A-Z로 정렬해서 조회하세요
select * from Customers order by Country , ContactName;

# 16. 고객 테이블에서 국가순으로 A-Z로 정렬하되,
# 같은 경우 고객이름으로 Z-A로 정렬해서 조회하세요
select * from Customers order by Country, ContactName desc ;

# 17. 다음의 고객정보를 고객 테이블에 입력하세요
# 회사이름, 연락처이름, 주소, 도시, 우편번호, 국가 =>
# 'Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'
select * from Customers;
insert into Customers (CompanyName, ContactTitle, Address, City,PostalCode, Country) values ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

# 18. 다음의 고객정보를 고객 테이블에 입력하세요
# 회사이름, 도시, 국가 => 'Cardinal', 'Stavanger', 'Norway'
insert into Customers (CompanyName,City,Country) values ('Cardinal', 'Stavanger', 'Norway');

# 19. 고객 테이블에서 주소가 입력되지 않은
# 고객이름, 연락처이름, 주소를 조회하세요
select ContactName,ContactTitle,Address from Customers where Address is null;

# 20. 고객 테이블에서 주소가 입력된 고객이름,
# 연락처이름, 주소를 조회하세요
select ContactName,ContactTitle,Address from Customers where Address is not null;

# 21. 고객 테이블에서 1번 고객의 연락처 이름을
# 'Alfred Schmidt'로, 도시를 'Frankfurt'로
# 수정하세요
update Customers set ContactName = 'Alfred Schmidt' , City = 'Frankfurt' where CustomerID = 'ALFKI';


# 22. 고객 테이블에서 국가가 Mexico인
# 고객들의 연락처 이름을 'Juan'으로 변경하세요
update Customers set ContactTitle = 'Juan' where Country = 'mexico';


# 23. 고객 테이블에서 연락처 이름이
# 'Alfreds Futterkiste'인 고객들을 삭제하세요
delete from Customers where CompanyName = 'Alfreds Futterkiste';


# 24. 고객 테이블에서 3번째부터 7번째 고객을 조회하세요
# 단, 고객이름은 A-Z로 정렬한다 (페이징)
#  mariadb에서 페이징은 limit x,y 절을 이용
#  x는 시작위치 y는 읽어올 행 수
select * from Customers limit 2,5;


# 25. 고객 테이블에서 국가가 'Germany' 인 고객들 중
# 3번째부터 7번째 고객을 조회하세요
select * from Customers;
select * from Customers where Country = 'germany'
limit 2,5;

# 26. 제품테이블에서 최대, 최소 가격을 조회하세요
select max(UnitPrice), min(UnitPrice) from Products where UnitPrice <> 0;

# 27. 제품테이블에서 제품수, 평균가격을 조회하세요
select * from Products;
select count(ProductName), avg(UnitPrice) from Products where ProductName not like '%test%';

# 28. 제품테이블에서 가격이 20이상인
# 제품수를 조회하세요
select count(ProductID) 제품수 from Products where ProductName not like '%test%' and UnitPrice >= 20;


# 29. 제품상세테이블에서 주문수, 총 주문수량을
# 조회하세요
select * from Order_Details;
select count(OrderID), sum(Quantity) from Order_Details;

# 30. 고객 테이블에서 고객이름이
# 'A'로 시작하는 고객을 조회하세요
select * from Customers where ContactName like 'a%';
select * from Customers where left(ContactName,1) = 'a';

# 31. 고객 테이블에서 고객이름이
# 'a'로 끝나는 고객을 조회하세요
select * from Customers where ContactName like '%a';
select * from Customers where right(ContactName,1) = 'a';

# 32. 고객 테이블에서 고객이름에 'or'을
# 포함하는 고객을 조회하세요
SELECT * from Customers where ContactName like '%or%';

select * from Customers where  instr(ContactName,'or') > 0;


# 32. 고객 테이블에서 고객이름의 2번째
# 글자가 'r'로 시작하는 고객을 조회하세요
select * from Customers where ContactName like '_r%';
select * from Customers where substring(ContactName,2,1) = 'r';


32. 고객 테이블에서 고객이름이 'A'로
시작하고 최소 3자 이상인 고객을 조회하세요
select * from Customers where ContactName like 'a__%';
select ContactName from Customers where left(ContactName,1) = 'a' and
                              char_length(ContactName)>=3;

33. 고객 테이블에서 연락처이름이 'a'로 시작하고
'o'로 끝나는 고객을 조회하세요
select * from Customers where ContactName like 'a%o';
select * from Customers where left(ContactName,1)='a' and right(ContactName,1)='o';

34. 고객 테이블에서 고객이름이 'A'로 시작하지
않는 고객을 조회하세요
select * from Customers where ContactName not like 'a%';
select * from Customers where left(ContactName,1) <> 'a';

35. 고객 테이블에서 도시이름이 'ber'로
시작하는 도시를 조회하세요
select City from Customers where City like 'ber%';
select City from Customers where left(City,3) = 'ber';
select City from Customers where substring(City,1,3) = 'ber';

36. 고객 테이블에서 도시이름에 'es'를
포함하는 도시를 조회하세요
select City from Customers where City like '%es%';
select City from Customers where instr(City,'es') > 0;

37. 고객 테이블에서 도시이름이 6자이며
'erlin'로 끝나는 도시를 조회하세요
select City from Customers where City like '_erlin';
select City from Customers where right(City,5) = 'erlin' and char_length(City)>=6;

38. 고객 테이블에서 도시이름이 6자이며
'L'로 시작하고 on으로 끝나며,
3번째 글자가 n인 도시를 조회하세요
select distinct City from Customers where City like 'l_n_on';
select distinct City from Customers where left(City,1)='l' and right(City,2)='on' and char_length(City) = 6 and substring(City,3,1)='n';


39. 고객 테이블에서 도시이름이 b, s, p등으로
시작하는 도시를 조회하세요
select City from Customers where City like 'b%' or City like 's%' or City like 'p%';
-- 정규표현식
-- ^ : 문자열 시작 (like ?%)
-- $ : 문자열 끝 (like %?)
-- [...] : 어떤 문자들 중 하나를 포함 ([1aA])
-- [^...] : 어떤 문자들 중 하나를 제외 ([^1aA])
-- | : 선택 의미 (or)
select City from Customers where City like '[bsp]%'; -- ansi sql 지원 x
select City from Customers where City regexp '^[bsp]'; -- mariadb 전용


40. 고객 테이블에서 도시이름이 a에서 c사이로
시작하는 도시를 조회하세요
select City from Customers where City regexp '^[a-c]';

41. 고객 테이블에서 도시이름이 b, s, p등으로
시작하지 않는 도시를 조회하세요
select City from Customers where City not like 'b%' and City not like 's' and City not like 'p%';
select City from Customers where City regexp '^[^bsp]';

42. 고객 테이블에서 국가이름이 'Germany',
'France', 'UK'인 고객을 조회하세요
select * from Customers where Country like 'germany' or Country like 'france' or Country like 'uk';
select * from Customers where Country in ('germany','france','uk');
select * from Customers where Country regexp 'germany|france|uk';


43. 고객 테이블에서 도시이름이
'Germany', 'France', 'UK'가 아닌
고객을 조회하세요
select ContactName from Customers where City not like 'germany' and City not like 'france' and City not like 'uk' ;
select * from Customers where City not regexp 'germany|france|uk';

44. 상품 테이블에서 가격이
10 ~ 20사이인 제품을 조회하세요
select * from Products where UnitPrice between 10 and 20;


45. 상품 테이블에서 가격이 10 ~ 20사이인
제품을 조회하세요 단, 제품분류코드가
1,2,3인 제품은 제외한다
select * from Products where UnitPrice between 10 and 20 and CategoryID not in (1,2,3);

46. 상품 테이블에서 제품이름이
'Carnarvon Tigers' 에서
'Mozzarella di Giovanni' 사이인
제품을 조회하세요
select ProductName from Products where ProductName between 'Carnarvon Tigers' and 'Mozzarella di Giovanni';


47. 상품 테이블에서 제품이름이
'Carnarvon Tigers' 에서
'Mozzarella di Giovanni' 이외의
제품을 조회하세요
select ProductName from Products where ProductName not between 'Carnarvon Tigers' and 'Mozzarella di Giovanni';


48. 주문 테이블에서 주문날짜가
'01-July-1996' 에서 '31-July-1996'사이인
주문을 조회하세요
select OrderDate from Orders where OrderDate between '1996-07-01' and '1996-07-31';

49. 고객 테이블에서 고객번호, 고객이름을
조회하세요 단, 고객번호는 ID로,
고객이름은 Customer라는 별칭을 사용한다
select CustomerID as id ,ContactName as customer from Customers;


50. 고객 테이블에서 고객번호, 주소, 우편번호,
도시, 국가등을 조회하세요 단, 주소, 우편번호,
도시, 국가등은 쉼표로 연결해서
Address라는 별칭을 사용한다
select CustomerID, concat(Address,',',PostalCode,',',City,',',Country) as address from Customers;


51. 고객 테이블을 이용해서
국가별 고객수를 조회하세요
select Country, count(CustomerID) from Customers group by Country;

52. 고객 테이블을 이용해서
국가별 고객수가 5명 이상인 국가를 조회하세요
select Country from Customers group by Country having count(CustomerID) >= 5;

53. 고객/주문 테이블을 이용해서
주문번호, 고객이름, 주문일자를 조회하세요
select OrderID, ContactName, OrderDate from Customers c join Orders o on c.CustomerID = o.CustomerID;

54. 고객/주문/배송자 테이블을 이용해서
주문번호, 고객이름, 배송업체명을 조회하세요
select OrderID,ContactName,s.CompanyName from Shippers s join Orders o on s.ShipperID = o.ShipVia
join Customers C on o.CustomerID = C.CustomerID;

55. 주문/배송자 테이블을 이용해서
배송업체별 주문건수를 조회하세요
select CompanyName, count(OrderID) from Shippers s join Orders o on s.ShipperID = o.ShipVia
group by CompanyName;

56. 주문/배송자 테이블을 이용해서 배송업체별
주문건수가 300건 이상인
배송업체를 조회하세요
select CompanyName , count(OrderID) from Shippers s join Orders o on s.ShipperID = o.ShipVia
group by CompanyName having count(OrderID) >= 300;



57. 주문/사원 테이블을 이용해서
사원 'Davolio' 또는 'Fuller' 가
맡은 총 주문건수 중
100건 이상인 사원은 누구인가?
select e.EmployeeID, LastName, count(OrderID) from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where LastName in ('davolio', 'fuller')
group by e.EmployeeID having count(OrderID) > 100;



58. 고객/주문 테이블을 이용해서
주문번호가 없는 고객을 조회하세요
select * from Customers c left join Orders O using (CustomerID)
where OrderID is null;



59. 사원/주문 테이블을 이용해서
주문번호가 없는 사원을 조회하세요
select * from Employees e left join Orders O using (EmployeeID)
where OrderID is null;



60. 고객 테이블을 이용해서 같은 도시에서
온 고객들을 조회하세요
select City , count(CustomerID) from Customers group by City;

-- 고객이름은 다르면서 도시이름이 같은 데이터를 찾으면 됨
-- self join 사용
select c1.City, c2.City, c1.ContactName, c2.ContactName from  Customers c1 join Customers c2 using (city)
where c1.City = c2.City and c1.ContactName <> c2.ContactName;


61. 제품/상세주문 테이블을 이용해서
주문수량이 99 이상인 제품이름을 조회하세요
select ProductID, ProductName, sum(Quantity) from Products p join Order_Details o using (ProductID)
group by ProductID having sum(Quantity) >= 99;



62. 제품 테이블을 이용해서
제품분류코드가 2인 제품의 가격보다
높은 제품의 이름과 가격을 조회하세요
select ProductName,UnitPrice from Products where UnitPrice > all(select UnitPrice from Products where CategoryID = 2);





64. 제품 테이블을 이용해서 제품이름,
1개당가격 * 재고량, 1개당가격 * 주문량을
조회하세요
select ProductName,UnitPrice * UnitsInStock, UnitsInStock * UnitsOnOrder from Products;

