-- 테이블에서 데이터 검색
-- (1) projection: 테이블에서 원하는 컬럼들을 검색
-- (2) selection: 테이블에서 조건에 만족하는 레코드(행)들을 검색

-- select 컬럼, ... from 테이블 where 조건식 [order by 정렬 기준 컬럼];

-- 직원 테이블(emp)에서 10번 부서에서 근무하는 직원들의 부서번호, 사번, 이름을 검색
select deptno, empno, ename
from emp
where deptno = 10;

--비교 연산자: =, !=, >, >=, <, <=, is null, is not null
-- 논리 연산자: and, or, not 

-- 직원테이블(emp)에서 수당(comm)이 있는 직원들의 사번, 이름, 수당을 검색.
-- 출력 순서는 이름의 오름차순
select empno, ename, comm
from emp
where comm is not null
order by ename;

-- 급여직원 테이블에서 급여(sal)가 2000 이상인 직원들의 이름과 급여를 검색
-- 출력 순서는  급여의 내림차순으로 정렬
select ename, sal
from emp
where sal >= 2000
order by sal desc;

--직원 테이브렝서 급여가 3000이상 4000 이하인 직원들의 사번, 이름, 직책, 급여
-- 급여의 내림차순 정렬
select empno, ename, job, sal
from emp
where sal >= 2000 and sal <= 3000
order by sal desc;

select empno, ename, job, sal
from emp
where sal between 2000 and 3000 
order by sal desc;

-- 직원 테이블에서 10번 또는 20번 부서에서 근무하는  부서번호, 이름, 급여를 검색
-- (1) 부서번호, (2) 이름 오름차순 정렬
select deptno, ename, sal 
from emp
where deptno = 10 or deptno=20
order by deptno,ename;

-- in( 조건식)
select deptno, ename, sal 
from emp
where deptno in(10,20)
order by deptno,ename;

-- SQL에서는 숫자 문열을 비교할 때도 비교 연산자(  =, !=, >, ...)을 사용
-- 직원 테이블에서 직책이 'CLERK'인 직원들의 직책, 이름 급여를 출력
-- 이름 오름차순 순서로 출력

select job, ename, sal
from emp
where job = 'CLERK'
order by ename;

--SQL에서 문자열은 작은따옴표('')를 사용
-- 테이블에 저장된 데이터(문자열)은 대/소문자를 구분.

-- 직원 테이블에서 직책이 CLERK 또는 MANAGER인 직원들의 직책, 이름 급여를 출력
-- (1) 직책 (2) 급여 
select job, ename, sal
from emp
where job in('CLERK','MANAGER')
order by job,sal;

select job, ename, sal
from emp
where job = 'CLERK' or job = 'MANAGER'
order by job,sal;

-- 직원 테이블에서 20번 부서에서 근무하는 CLERK의 모든 정보
select * from emp
where job ='CLERK' and deptno = 20;

-- 직원 테이블 에서 20번 부서에서 근무하거나 또는 직책이 CLERK인 직원들의 몬든 정보를 검색
select* from emp
where deptno = 20 or job = 'CLERK';

--직원 테이블에서 CLERK, ANALYST, MANAGER가 아닌 직원들의 사번, 이름 직책, 급여를 검색
-- 사번 오름차순 정렬
select empno, ename, job, sal
from emp
where job != 'CLERK' or job!= 'ANALYST' or job != 'MANAGER'
order by empno;

select empno, ename, job, sal
from emp
where not (job = 'CLERK'or  job = 'ANALYST' or job = 'MANAGER')
order by empno;

select empno, ename, job, sal
from emp
where job not in('CLERK', 'ANALYST', 'MANAGER')
order by empno;

--교재에 목차 Part 1

--대소문자 변환 함수
--UPPER, LOWER, INITCAP
select upper(ename), lower(ename), initcap(ename)
    from emp;

select ename, sal
from emp
where lower(ename) = 'scott';

select substr('SMITH',1,3)
from dual;

--숫자, 날짜, 문자열 타입들은 모두 크기 (대/소) 비교가 가능.

-- '1987/01/01' (포함) 이후에 입사한 사원들의 레코드(모든 컬럼)를 검색
-- 임사입 오름차순으로출력
select * 
    from emp
        where hiredate >= '1987/01/01'
            order by hiredate;
-- 'D'보다 큰 이름을 같는 직원들의 레코드를 검색. 이름의 오름차순으로 출력
select * 
from emp
where ename > 'D'
order by ename;


-- 특정 문자(열)로 시작 또는 포함하는 단어를 검색
-- 'A'로 시작하는 이름을 갖는 직원들의 이름을 오름차순으로 출력.
select ename
from emp
where ename like 'A%'  -- 이름(ename)의 글자수는 제한이 없고, A로 시작.
order by ename;

select ename
from emp
where ename like 'A_'  -- 이름(ename)이 두 글자로 이루어져 있고, A로 시작.
order by ename;

select * from emp
where job like '_LERK';  -- ALERK, BLERK, CLERK, DLERK, ...

-- 직원 이름에 'E'가 포함된 직원들의 레코드(모든 컬럼)를 검색. 이름 오름차순 출력.
select * from emp
where ename like '%E%'
order by ename;

-- 30번 부서에서 근무하는 직책이 SALES로 시작하는 직원들의 
-- 사번, 이름, 급여, 부서번호, 직책을 검색. 사번 오름차순 출력.
select empno, ename, sal, deptno, job
from emp
where (deptno = 30) and (job like 'SALES%')
order by empno;

-- 20번, 30번 부서에서 근무하는 직원들 중에서 급여가 2000을 초과하는
-- 직원들의 사번, 부서번호, 이름, 급여를 검색.
-- 출력 순서 (1) 부서번호 오름차순 (2) 사번 오름차순
select empno, deptno, ename, sal
from emp
where deptno in (20, 30) and sal > 2000
order by deptno, empno;

select empno, deptno, ename, sal
from emp
where (deptno = 20 or deptno = 30) and sal > 2000
order by deptno, empno;

-- 수당이 null이고, 매니저는 있고(not null), 직책이 MANAGER 또는 CLERK인
-- 직원들의 레코드를 검색. 사번 오름차순으로 출력.
select *
from emp
where comm is null and mgr is not null and job in ('MANAGER', 'CLERK')
order by empno;

select *
from emp
where comm is null 
    and mgr is not null 
    and (job = 'MANAGER' or job = 'CLERK')
order by empno;

select ename, regexp_replace(sal, '[0-3]', '*') as sakary
from emp;

create table TEST_ENAME
(ENAME VARCHAR2(10));

insert into TEST_ENAME VALUES('김인호');
insert into TEST_ENAME VALUES('안상수');
insert into TEST_ENAME VALUES('최영희');
commit;

select replace(ENAME, SUBSTR(ENAME,2,1), '*') as "전광판_이름"
from test_ename;

-- 월급 컬럼의 자릿수를 10자리로 하고 월급을 출력하고 나머지 자리에 별표 채우기
select ename, lpad(sal,10,'*') as salary1, rpad(sal,10,'*') as salary2
from emp;

-- LPAD나 RPAD를 이용하면 SQL로 데이터를 시각화하기 유용하다.
-- 이름과 월급을 출력하는데 월급 100을 네모(■)하나로 출력
select ename, sal, lpad('■', round(sal/100), '■') as var_chart
from emp;

--특정 철자 잘라내기
--(TRIM, RTRIM, LTRIM)
