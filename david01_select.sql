select ename, replace(sal, 0, '*')
from emp;

-- 중고거래 프로그램
-- 당근마켓
-- 좋죠
-- 필요한 기능만 골라서 구현하면 되니까
-- 아이디어 좋네요
-- 이미지 추가
-- 일단 뷰를 대충이나마 만들고
-- 구현에 집중했어요!!! 코드 뭐든
-- 더럽든 돌아갈 수 있게끔
-- 

-- 도서관 관리 프로그램
-- id password ->
-- login 
-- create

-- ㅁadd book
-- 저자:
-- 책 이름
-- 책 분류
-- ㅁ  ㅁ add student
-- ㅁissue book ㅁ ㅁ 
-- Rank

select ename, job,sal, rank() over(order by sal desc) 순위
from emp
where job in('ALNLYST','MANAGER');

-- 서브쿼리 
-- 1강부터 간단하게 리뷰








-- 문제: 사번이 '7521'인 사원의 job 과 동일하고
--'7900'인 사번의 급여보다 많은 급여를 받는 사원의 사번, 이름, job,급여를 출력하라 - scott- emp
select empno, ename, job, sal
from emp
where sal > (select sal from emp where empno = '7900') 
and job in(select job from emp where empno= '7521');

select * from users where user_seq = 1;
select * from book;
commit;









