-- null 처리 함수
-- null 처리 : coalesce(문자열, 널일때대체값)
select null,
       coalesce(NULL, '널임'),
       coalesce('hello', '널임');

# null 처리 2 : ifnull(문자열, 널일때대체값)
select null,  ifnull(null,'널임');


-- coalesce vs ifnull
select ifnull('abc','xyz');
select ifnull(null,'xyz');

select coalesce(null,'xyz'); -- ifnull과 기능유사
select coalesce(null,null,'xyz');

-- null 처리 : nullif(문자열1, 문자열2)
-- 두 값이 일치하면 null출력
-- 두 값이 일치하지 않으면 문자열1 출력
-- oracle : NVL
select nullif(NULL, '널임'),
           nullif('hello', '널임'),
               nullif('hello', 'hello');

-- 사원테이블에서 수당을 받지 않는 사원들의 수당은 0으로 설정
select commission_pct, ifnull(commission_pct,0) from employees;

-- 조건판단 : if (조건식, 참일때 값, 거짓일때 값)
select if(5>3, '크다', '작다') ;

-- 다중조건 : case when 조건식 then 처리값 else 처리값 end

-- 날짜/시간 함수
-- 현재 날짜/ 시간
-- now(), current_timestamp() , sysdate()
select now(), current_timestamp(), sysdate();

-- 현재 날짜
-- curdate, current_date
select curdate(), current_date();

-- 현재 시간
-- curtime(), current_time()
select curtime(), current_time();

-- 날짜계산
# adddate(날짜, 날짜간격), subdate(날짜, 날짜간격)
# date_add(날짜, 날짜간격), date_sub(날짜, 날짜간격)
-- 간격 식별문자열 : second,minute,hour,day, month, year

select date_add('2020-12-10',interval 15 day);
select date_add('2020-12-10',interval 1 year);
select date_sub('2020-12-10',interval 15 day);
select date_add('2020-12-10', interval 100 day);
select date_add(current_date, interval 100 day);

select date_sub('2020-12-10', interval 1 day);

-- 날짜/시간 추출 : year , month , day , week , hour , minute , second
select year(now()),month(now()),day(now()),week(now());

select dayofyear(now()), dayofmonth(now());

-- dayofweek 를 이용해서 요일을 한글로 출력해보세요
select concat(substring(_UTF8'일월화수목금토',dayofweek(now()),1),'요일');



-- 날짜 계산 : datediff(날짜1, 날짜2)
-- 오늘기준 크리스마스가 몇일 남았는지
-- 오늘기준 2021-03-21일 몇일 남았는지
select datediff('2020-12-25', current_date);
select datediff('2021-03-21', current_date);

-- 날짜/시간 계산
-- timestampdiff(유형, 날짜1, 날짜2)
select timestampdiff(day,'2020-12-25',current_date),
       timestampdiff(minute ,'2020-12-25',current_date),
       timestampdiff(second ,'2020-12-25',current_date);

-- 달의 마지막 일 출력 : last_day(날짜)
select last_day('2020-12-01');

-- 변환함수
-- 각 나라별로 날짜와 시간을 표시하는 방법이 제각각임
-- 이러한 제각각인 날짜/시간 데이터를 적절한 날짜형식 데이터로 인식하기 위해 변환함수 사용
-- 한국 : 년-월-일
-- 미국 : 월/일/년

-- 날짜 변환 함수 : str_to_date(문자열, 형식문자열)
-- 형식문자열 : %H/%h,%i,%s (시간관련)
--             %Y/%y,%m,%d ,%M(날짜관련)
select str_to_date('2020-12-10','%Y-%m-%d'),
       str_to_date('12/10/2020','%m/%d/%Y'),
       str_to_date('12/10/20','%m/%d/%y');

-- 날짜 변환 함수 : date_format
-- 시스템의 locale 설정에 따라서 변환가능
select date_format('2020-12-10','%Y-%m-%d'),
       date_format('12/10/2020','%m/%d/%Y'),
       date_format('12/10/20','%m/%d/%y');

-- 사용중인 locale이 한국이라 미국식 표현은 제대로 뜨지 않음

select date_format('2020-12-10','%W %M'),
       date_format('2020-12-10','%a %b %j'),
       date_format('2020-12-10 12:14:13','%p %h %i %s');

-- 숫자문자변환 : cast(대상 as 자료형)
-- 자료형 : char, date/time, decimal, float
-- 묵시적 형 변환, 명시적 형 변환

select substring(123456789,5,1);
-- 숫자형 데이터가 자동으로 문자형으로 변환

select 1234567890, cast(1234567890 as char);

select 10/3, 10/'3';
-- 문자가 실수(float)로 자동 형 변환
select 10/cast(3 as dec);

select 10/cast('3' as integer), 10/cast('3' as float );

select cast(124035 as time);
-- 시간, 날짜도 변환 가능 (단,정수형태여야한다)

-- 분석함수 (윈도우 함수)
-- 윈도우함수: 행과 행간의 관계를 정의하기 위해 사용하는 함수
-- 복잡한 기능을 함수로 구현해서 사용하기 편리하게 만들어 둠
-- 경우에 따라 over 절을 사용해야 할 필요가 있음
-- 집계함수 : max, min, avg, sum, count
-- 순위함수 : rank, dense, row_number
-- 통계,회귀분석 : corr, covar, stddev, variance
-- 순서함수 : lag , lead , first_value , last_value

-- 현재 행을 기준으로 이전/이후 값 출력 : 이전 lag, 이후 lead
-- mariadb 는 10이상 지원하기 시작
-- 분석함수를 적용하기 위해서는 먼저 대상 컬럼이 정렬이 되어 있어야 함

-- 상품 테이블에서 현재 상품명을 기준으로 이전 상품명과 이후 상품명을 조회하세요
select prdname 현재상품명 ,lag(prdname) over (order by prdname), lead(prdname) over (order by prdname) from sales_products;

-- 주문테이블에서 주문일자가 빠른 순으로 정렬할 후 자신보다 주문일자가 빠른 고객의 이름과 주문일자를 조회하세요
select custid 주문자, orddate 주문날짜, lag(custid) over (order by orddate), lag(orddate) over (order by orddate) from sales_orders order by orddate;

-- 정렬된 데이터를 기준으로 맨처음/맨마지막값 출력
-- first_value(컬럼명), last_value(컬럼명)

-- 상품을 주문한 고객중에서 가장 많은/적은 수량으로 주문한 고객을 조회하세요
select custid,qty from sales_orders
order by qty;
select custid,qty from sales_orders
order by qty desc ;

select custid,
       first_value(qty) over (order by qty),
       last_value(qty) over (order by qty)
from sales_orders;