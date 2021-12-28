--hr계정의 employees 테이블 사용

--employess 테이블의 구조 확인
desc employees;
-- 이름이 'J'로 시작하는 직원들의 사번, 이름을 출력
select employee_id, first_name ||' ' || last_name as Name
from employees
where last_name like 'J%';
-- 이름에 'E' 또는 'e'가 포함된 직원들의 사번, 이름을 출력
select employee_id, last_name || ' ' || first_name as Name
from employees
where last_name like in('%e%','%E%');  
-- where 절에 like in이 동작하지 않고 아래 구문에서는 정상 작동 되는데
-- in을 쓰지 못하는 이유가 있나요?
--last_name like '%e%' or last_name like '%E%'; 

-- 전화번호가 '011'로 시작하는 직원들의 사번, 이름, 전화번호를 출력
select employee_id, first_name ||' ' || last_name as Name, phone_number
from employees
where phone_number like '011%';
--급여가 3000이상 5000이하인 직원들의 사번, 이름 급여를 검색
-- 급여의 내림차순 출력
select employee_id, first_name ||' ' || last_name as Name, salary
from employees
where salary >= 3000 and salary <= 5000
order by salary desc;
-- 수당이 있는(not null) 직원들의 사번, 이름, 급여, 1년 연봉을 검색
-- commission_pct 컬럼: 수당의 퍼센티지(percentage) salary*12
-- 수당 포함 연봉 = 월급 * 12 + 특별 수당
--                = 월급 * 12 + (월급 *12) * percentage
--                = (월급*12)*(1+percentage)
select employee_id, first_name ||' ' || last_name as Name, salary as "급여", (salary*12) * (1+commission_pct) as "1년 연봉"
from employees
where commission_pct is not null;

