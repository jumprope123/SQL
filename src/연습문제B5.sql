# 사원 테이블에서 사원 이름을 소문자로 출력하세요
select lower(last_name) from employees;

# 사원 테이블에서 사원 이름의 첫글자만 대문자로 출력하세요.
select concat(upper(left(last_name,1)),substring(last_name,2)) from employees;

# 사원 테이블에서 사원 이름의 길이를 출력하세요.
select last_name,char_length(last_name) from employees;

# 사원 테이블에서 사원이름과 이름에 A가 몇번째 있는지 출력하세요. // 맨 첫번째 a만 구해냄
select last_name, if(instr(last_name,'a')=0,'없음',instr(last_name,'a')) from employees;

# 사원 테이블에서 사원이름의 세번째 자리가 R인 사원의 정보를
# 출력하세요.
select * from employees where substring(last_name,3,1)='r';

# 사원 테이블에서 이름의 끝자리가
# N으로 끝나는 사원의 정보를 출력하세요.
select last_name from employees where substring(reverse(last_name),1,1)='n';
select first_name from employees where right(first_name,1) ='N';


# 사원들의 급여가 평균보다 큰 경우
# '평균급여이상'이라 출력하고
# 아닌 경우 '평균급여이하' 라고 출력하세요 //
select last_name , salary , avg(salary) ,  if(salary > avg(salary),'평균급여이상','평균급여이하') as 이상이하 from employees;
select avg(salary) from employees;
select salary,
       if(salary > avg(salary),'평균급여이상','평균급여이하')평가 from employees;

select salary,if(salary > (select avg(salary) from employees) , '평균급여이상', '평균급여이하' )
from employees;

# 사원의 급여에 대해 평균을 계산하고
# 정수로 변환해서 출력하세요
select cast(avg(salary) as integer) from employees;

# 사원들을 입사일자가 빠른 순으로
# 정렬한 뒤 본인보다 입사일자가 빠른
# 사원의 급여를 본인의 급여와 함께
# 출력하세요
select last_name,hire_date,salary,lag(last_name) over (order by hire_date),lag(salary) over (order by hire_date) from employees order by hire_date asc;

# AND나 BETWEEN을 사용하지 않고
# 2002 년도에 입사한 직원의 이름과
# 월급을 출력하세요.
select last_name,salary from employees where hire_date like '2002%';
select hire_date from employees where left(hire_date,4) = '2002';
select hire_date from employees where substring(hire_date,1,4) = '2002';
select hire_date from employees where year(hire_date) = 2002;

# 사원 테이블에서 사원의 이름이
# 5글자인 사원의 이름을
# 첫글자만 대문자로 출력하세요.
select concat(upper(substring(last_name,1,1)),lower(substring(last_name,2))) from employees where last_name like '_____';
select first_name,upper(left(first_name,1)) from employees where char_length(first_name) = 5;

# 사원 테이블에서 이름과 입사일자
# 그리고 현재날까지의 경과일을 산출하세요
# (소숫점을 빼버리고 해딩이름을
# 경과일로 바꾸세요)
select last_name,date(hire_date),current_date,abs(datediff(hire_date,current_date))경과일 from employees;

# 이전문제에서 경과일을 개월수로 바꿔서
# 산출하세요. 소숫점을 빼버리고
# 해당이름을 경과개월수로 바꾸세요
select last_name,hire_date,timestampdiff(month ,hire_date,current_date)경과개월수 from employees;

# 사원 테이블에서 입사후 6개월이
# 지난날짜 바로 다음 일요일을 구하세요.
-- //6개월지난 요일까지는 구햇음.
select dayofweek(date_add(date(hire_date), interval 6 month)) from employees;

select if(dayofweek(date_add(date(hire_date), interval 6 month))=1,date_add(date(hire_date), interval 6 month),
          if(dayofweek(date_add(date(hire_date), interval 6 month))=2,date_add(date_add(date(hire_date), interval 6 month),interval 6 day),
       ) from employees;

select dayofweek(current_date)오늘요일,
       date_add(current_date,interval  3 day) 다음주일요일;
select date_add(curdate(), interval 7 - dayofweek(current_date) + 1 day);

select hire_date, date_add(date_add(hire_date, interval 6 month ), interval 7 - dayofweek(date_add(hire_date, interval 6 month ))+1 day)  from employees;

-- 교육시작일이 2020-11-02인 경우 , 5개월이 지난 후 돌아오는 첫번째 금요일이 언제인지 출력하라 //금요일은 6
select date_add('2020-11-02', interval 18 week),
       date_add(date_add('2020-11-02', interval 18 week) ,
           interval 7 - dayofweek(date_add('2020-11-02', interval 18 week)) + 6 day);


-- 사원 테이블에서 입사 후 첫 휴일(일요일)은 언제인지 구하시오
select date(hire_date) 입사일,
       date_add(date(hire_date), interval 7 - dayofweek(date(hire_date)) +1 day) as 다음주첫일요일
    from employees;

select 'steven' as first_name,'2020-06-17' as hire_date, dayofweek('2020-06-17') 요일,
       date_add('2020-06-17', interval 7 - dayofweek('2020-06-17') +1 day) as 처음맞는일요일;

# 오늘날짜를 "xx년 xx월 xx일"
# 형식으로 출력하세요
select date_format(current_date,'%y년 %m월 %d일');

# 지금 현재 '몇시 몇분'인지 출력하세요.
-- AWS RDS의 시간은 미국 기준
-- 한국 기준시로 변경하고 싶다면 서버설정변경 필요
select @@global.time_zone; -- UTC
select @@session.time_zone;

select time_format(date_add(current_time, interval 9 hour),'%p %h시 %i분');

set global time_zone = 'Asia/seoul'; -- 관리자권한 필요
set time_zone = 'asia/seoul'; -- session
select now();
select now(), time(now()),date_format(time(now()), '%h시 %i분 %p');

# 이번 년도 12월 31일까지 몇일이
# 남았는지 출력하세요.
select datediff('2020-12-31',current_date);


# 사원들의 입사일에서
# 입사 년도와 입사 달을 조회하세요
select year(hire_date)입사년도, month(hire_date)입사달 from employees;
select date(hire_date), date_format(hire_date,'%Y년 %m월') from employees;

# 9월에 입사한 사원을 조회하세요
select last_name, date(hire_date) from employees where month(hire_date) = 9;


# 사원들의 입사일을 출력하되,
# 요일까지 함께 조회하세요
select hire_date 입사일, substring('일월화수목금토',dayofweek(hire_date),1) from employees;
select first_name, left(hire_date,10), substring('일월화수목금토' , dayofweek(hire_date),1), date_format(hire_date,'%a') from employees;


# 사원들의 급여를 통화 기호를 앞에 붙이고
# 천 단위마다 콤마를 붙여서 조회하세요
-- format(값, 반올림자릿수) : 숫자에 컴마를 붙여 출력
select concat('$',format(salary,0)) from employees;


# 사원들의 급여를 10자리로 출력하되
# 자릿수가 남는 경우 빈칸으로
# 채워서 조회하세요
select lpad(salary,10,' ') from employees;

# 각 사원들의 근무한 개월 수를 현재를
# 기준으로 구하세요
select timestampdiff(month, hire_date, current_date) from employees;

# 각 사원들의 입사일에서
# 4개월을 추가한 날짜를 조회하세요
select date(date_add(hire_date,interval 4 month)) from employees;

# 각 사원들의 입사한 달의 마지막 날을
# 조회하세요
select date(hire_date),day(last_day(date(hire_date))) from employees;


