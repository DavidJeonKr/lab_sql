--scott 계정 사용

--함수(function)

select ename, lower(ename)
from emp;

select hiredate, to_char(hiredate, 'RR/MM/DD')
from emp;

-- nvl(컬럼이름, value): 컬럼의 값이 null 아니면 자기 자신을 리턴, null 이면 value를 리턴
-- nvl2(컬럼이름, value1, value2): 컬럼의 값이 null 아니면 value1을, null 이면 value2를 리턴.
select comm, nvl(comm,-1) ,nvl2(comm, comm,-1)
from emp;

--2. 그룹 함수(다중 행 함수) :
--   여러 개의 행(row)이 한꺼번에 함수의 argument로 전달되고, 
--   여러 개의 행에서 하나의 결과를 리턴하는 함수. 
-- 예) count(개수), sum(합계), avg(평균), max(최댓값), min(최솟값), variance(분산), stddev(표준편차)
select count(ename), count(mgr), count(comm) from emp;
select sum(sal), round(avg(sal)), max(sal), min(sal), round(variance(sal)), round(stddev(sal))
from emp;

-- 부서별 급여의 최댓값, 최솟값
select max(sal), min(sal)
from emp
where deptno = 10 or deptno = 20;

select deptno, max(sal), min(sal)
from emp
group by deptno
order by deptno;

--부서별 급여의 평균, 표준편차 찾기. 소수점 2자리까지 반올림.
-- 부서번호 순으로 오름차순
select deptno, round(avg(sal),2) as avg, round(variance(sal),2) as var
from emp
group by deptno
order by deptno;

-- 직책별 직원수, 급여의 최댓값, 평균, 최솟값 검색
-- 소수점 2자리까지 표시. 직책 오름차순 정렬
select job,count(*), max(sal) as MAX_SAL, 
round(avg(sal),2) as AVG_SAL, min(sal) as MIN_SAL
from emp
group by job
order by job;
--부서별, 직책별 부서번호, 직책, 직원수, 급여 평균
-- 소수점 2자리까지 표시. 정렬 순서는 (1) 부서번호 (2) 직책
select deptno, job, count(*), round(avg(sal),2) as AVG_SAL
from emp
group by deptno, job 
order by deptno, job;
-- 입사연도별 사원수(count) 힌트 to_char(날짜, 포맷)
-- 연도 사원수
-- 80년  1명
-- 81년  2명
select to_char(hiredate, 'YYYY') || '년' as hiredate, count(hiredate)
from emp
group by to_char(hiredate,'YYYY')
order by hiredate;
-- select 절에서 만든 별명은 where, group by, having에서는 사용할 수 없고
-- order by에서만 사용 가능!

/* SELECT 구문 순서
select 컬럼, ...
from 테이블
where (그룹 묶기 전에 검사할) 조건식
group by 그룹을 묶어줄 컬럼이름
having 그룹을 묶은 다음에 검사할 조건식
order by 출력순서를 설정할 컬럼,...;
*/
--부서별 부서 번호, 급여 평균을 검색
--부서별 급여 평균이 2000이상인 부서들만 출력
--부서 번호 오름차순
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000
order by deptno;

select v.ename, v.sal, v.순위
from (select ename, sal, rank() over (order by sal desc) 순위 from emp) v
where v.순위 <= 1 or v.순위 <=4 ;

--emp 테이블에서 mgr가 null이 아닌 직원들 중에서
--부서별 급여 평균을 검색. 부서번호 오름차순 출력.
select deptno, round(avg(sal),2) 
from emp
where mgr is not null
group by deptno
order by deptno;


--직책별 사원수를 검색
--직책이 president는 제외
-- 직책별 사원수가 3명 이상인 경우만 선택
-- 직책 오름차순 출력
select job, count(*) as job_count 
from emp
where job != 'PRESIDENT'
group by job
having count(*) >= 3
order by job;

select job, count(*) as job_count 
from emp
group by job
having job != 'president' and count(*) >= 3
order by job;

-- 입사연도, 부서 번호, 입사연도별 부서별 입사한 사원수 검색
-- 1980년 제외
-- 연도별 부서별 사원수가 2명 이상인 경우 선택
-- 연도 오름차순 출력
select to_char(hiredate,'YYYY') as hire_date, deptno, count(*)
from emp
group by to_char(hiredate, 'YYYY'), deptno
having count(to_char(hiredate,'YYYY')) >= 2
order by to_char(hiredate, 'YYYY');

select to_char(hiredate, 'YYYY') as YEAR,deptno, count(*)
from emp
where to_char(hiredate, 'YYYY') != '1980'
group by to_char(hiredate, 'YYYY'), deptno
having count(*) >= 2
order by YEAR;