-- Sub Query: Query 문의 일부로 또다른 query 문이 사용되는 것.

-- 전체 직원의 급여 평균보다 더 많은 급여를 받는 직원들의 레코드를 검색
-- (1) 전체 직원의 급여 평균
select avg(sal) from emp;
-- (2) (1)에서 찾은 급여보다 더 많은 급여를 받는 직원
select * from emp
where sal > 2073;

select * from emp
where sal > (
    select avg(sal) from emp
);

-- ALLEN보다 적은 급여를 받는 직원들의 사번, 이름, 급여를 검색
select empno, ename, sal 
from emp
where sal < ( select sal from emp where ename = 'ALLEN')
order by sal;

-- ALLEN과 같은 직책의 직원들의 사번, 이름, 부서번호, 직책, 급여를 검색
select empno, ename, deptno, job, sal
from emp
where job in(
select job from emp where ename = 'ALLEN'
);
-- SALESMAN의 급여 최댓값보다 더 많은 급여를 받는 직원들의 사번, 이름, 급여, 직책을 검색
select empno, ename, sal, job
from emp
where sal > (select max(sal) from emp where job ='SALESMAN')
order by sal;
-- 연봉 = sal * 12 + comm. 만약 comm이 null이면 0으로 계산.
-- WARD의 연봉보다 더 많은 연봉을 받는 직원들의 사번, 이름, 급여, 수당, 연봉을 검색.
-- 연봉 내림차순으로 출력.
select empno, ename, sal, comm, sal * 12 + nvl(comm,0)
from emp
where sal*12+nvl(comm,0) > (
select sal*12+nvl(comm,0) from emp where ename='WARD');
-- 각 부서에서 급여가 가장 적은 직원들의 레코드를 검색
select * from emp
where (deptno,sal) in(select deptno,min(sal) from emp group by deptno);

-- 단일행 서브쿼리: 서브쿼리의 결과가 행이 1개인 경우
-- 다중행 서브쿼리: 서브쿼리의 결과가 행이 2개 이상인 경우

-- 각 부서에서 급여가 가장 많은 직원들의 레코드를 검색
select * from emp
where (deptno,sal) in(
select deptno,max(sal) from emp group by deptno);


--having sal in(select max(sal) from emp);

-- SCOTT과 같은 급여를 받는 직원들의 이름과 급여를 검색
select ename, sal
from emp
where sal in(select sal from emp where ename='SCOTT');
-- 위 결과에서 SCOTT은 제외하고 출력
select ename, sal
from emp
where sal in(select sal from emp where ename='SCOTT') and ename != 'SCOTT';
-- ALLEN보다 늦게 입사한 직원들의 이름, 입사날짜를 최근 입사일부터 출력
select ename, hiredate
from emp
where hiredate > (select hiredate from emp where ename = 'ALLEN') 
order by hiredate desc;
-- 매니저가 KING인 직원들의 사번, 이름을 검색.
select empno, ename
from emp
where mgr in(select empno from emp where ename = 'KING');
-- DALLAS에서 근무하는 직원들의 이름, 급여, 부서번호를 검색. 
-- (힌트) emp, dept 테이블을 사용.
select ename, sal, deptno
from emp
where deptno in(select deptno from dept where loc = 'DALLAS');

--다중행 서브쿼리에서 any와 all
-- any: 여러개들 중에서 적어도 하나
-- all: 여래개 모두와 비교했을 때
select sal from emp where septno = 10 ; -- 10번 부서 직원들의 급여(들)
select * from emp
where sal < all (
select sal from emp where deptno = 10);

select* from emp
where sal < any(select sal from emp where deptno = 10);

