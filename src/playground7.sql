-- mariadb 내장함수
-- 사용자의 편의를 위해 미리 작성해둔 함수
-- 숫자/문자/날짜/시간/변환/집계/분석 함수등이 제공

-- 숫자함수
-- 절대값 계산 : abs
select abs(-4.5), abs(4.5);

-- 반올림 : round(값,자리수)
select round(4.1), round(4.5);
select round(123.456,1), round(123.456,2);

-- 무조건 내림 : floor(값)
select floor(4.1), floor(4.5);
select floor(-4.1), floor(-4.5);

-- 무조건 올림 : ceil(값)
select ceil(4.1), ceil(4.5);
select ceil(-4.1), ceil(-4.5);

select abs(-78), abs(78);

select round(4.875,1);

select round(avg((saleprice)),-2) 고객별평균주문금액 from bookorders group by cusid;

-- 나머지연산 : mod(분자, 분모)
select mod(10,5);
-- 난수 생성 : rand (0~1사이 실수값 출력)
select rand();
select floor(rand()*10);

-- n~m 사이 임의의 정수 생성
-- n + rand() * (m-n+1)

select floor(rand()*45 + 1);

-- 문자함수
-- 문자의 ASCII 코드 출력 : ascii(문자)
select ascii('a') , ascii('A') , ascii('0');

-- ASCII 코드의 문자 출력 : char(숫자)
select char(97), char(65), char(48);

-- 문자열 길이 : length(문자열)
-- 영문자 : 1byte
-- 윈도우코드 (완성형,조합형,euc-kr,win949) : 2byte
-- 유니코드 : 3byte
select length('hello, world!!');

-- 문자열 연결 : concat(문자열1, 문자열2, ...);
select concat('hello',',','world');

-- bookmembers 테이블을 기준으로 이름과 주소, 전화번호등을 다음과 같은 형식으로 출력하라.
-- 홍길동 고객의 주소는 ???이고, 전화번호는 ???입니다.
select concat(name,' 고객의 주소는 ',address,'이고, 전화번호는 ',phone,' 입니다.') from bookmembers;

-- 문자열 추출 : left(문자열,길이) , right(문자열,길이)
-- mid (문자열, 시작, 길이)

select left('가나다라마바',5);
select right('가나다라마바',5);
select mid('가나다라마바',4,2);

-- 고급 문자열 추출 : substring(문자열, 시작, 길이)
-- substring(문자열, 시작)

-- 대소문자 변환 : upper , lower, ucase, lcase
select upper('abc'), lower('DEF');
select ucase('abc'), lcase('DEF');

-- 공백처리 :  trim , ltrim, rtrim
select trim(' ab c  '), ltrim('  abc  ') , rtrim('  abc  ');

-- 문자열 채움: pad(문자열,총길이,채움문자)
select lpad('가나다라마', 10,'_');

-- 문자열 바꾸기 : replace(문자열, 찾을문자, 바꿀문자)
select replace('hello,world','world','mariaDB');

-- 문자열 뒤집기 : reverse
select reverse('12345');

-- 문자열 위치찾기 : instr(문자열, 찾을문자열)
select instr('hello,world','w'),instr('hello,world','h'),instr('hello,world','!');

-- 'Hello_Wolrd_!!' 에서 2번째 _의 위치를 알고싶음
-- 적절한 질의문은?
select instr('hello_world_!!','_');
select instr(substring('hello_world_!!',instr('hello_world_!!','_')+1),'_') + instr('hello_world_!!','_');

-- substring_index 함수를 이용하면 편하게 할 수 있음
select length(substring_index('Hello_Wolrd_!!','_',2))+1;

-- World_Of_Warcraft_Shadow_Land에서 3번째 _의 위치는?
select length(substring_index('World_Of_Warcraft_Shadow_Land','_',3))+1;

-- 도서제목에 야구가 포함된 도서를 농구로 변경한 뒤 변경결과를 출력하세요
select bookname,replace(bookname,'야구','농구') from books;

-- 굿 스포츠에서 출판한 도서의 제목과 제목의 글자수를 조회하세요
select char_length(trim(bookname)),bookname from books where publisher = '굿스포츠';
select char_length(replace(bookname,' ','')) from books where publisher = '굿스포츠';

-- 고객 중 같은 성을 가진 고객의 수를 조회하세요
select substring(name,1,1) as 성, count(name) from bookmembers group by 성;

