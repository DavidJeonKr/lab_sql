--제약조건(constraints)
-- 테이블에 데이터들이 insert될 때 조건에 만족하는 값들만 insert될 수 있도록 만들어주는 제약
-- 테이블을 create(생성)할 때
-- 테이블을 alter(변경)할 때
-- 종류 : primary key(고유키), not null, unique, check, foreign key(외래키)
-- 행에 제약을 거는건데.
-- primary key ( 유일한 키), (고유키) 단 하나의 숫자만 설정할 수 있는 그런 제약조건

-- 테이블을 만들면서 제약조건을 주는 방법 1: 어떻게 써야되느지? 어떻게 써야 할까? 이해가 안되는데?

create table ex01 (
    ex_id       number(2) primary key ,
    ex_name     varchar2(10char) not null,
    ex_ucol     varchar2(10char) unique,
    ex_ccol     number(2) check(ex_ccol > 0),
    ex_col      number(2)
    );
    
    
insert into ex01
values(1, '홍길동', 'test', 10, 99);

insert into ex01 (ex_id, ex_name, ex_ucol)
values(1, '홍길동', '테스트');
-- Primary Key: Unique(유일한 값, 중복되지 않는 값) + Not Null
-- 이미 ex_id에 값 1이 insert가 되어 있어서 같은 값이 또 insert될 수 없음!

insert into ex01 (ex_id, ex_name, ex_ucol)
values(null, '홍길동', '테스트');
-- primary key는 null이 될 수 없다!

insert into ex01 (ex_id)
values(2);
-- ex_name은 Null이 될 수 없다

select * from ex01;

-- foreign key: 다른 테이블의 primary key를 참조하는 제약 조건.
-- insert할 때 다른 테이블 primary key에 없는 값은 insert되지 않도록 하기 위해서.

create table ex_dept(
 deptno     number(2) primary key,
 dname      varchar2(10) not null
);

select * from ex_dept;

create table ex_emp(
    empno   number(4) primary key,
    ename   varchar2(10) not null,
    deptno  number(2) references ex_dept(deptno) -- 외래키(foreign key)
);

select * from ex_emp;

insert into ex_emp values(100, 'abc', 10);
-- 에러: ex_dept 테이블에 deptno=10인 레코드가 없기 때문에.

-- ex_dept 테이블에 데이터 삽입
insert into ex_dept values(10, 'HR');
insert into ex_dept values(20, '회계');

insert into ex_emp values(100, 'abc', 10);
-- 성공: ex_dept 테이블에 deptno=20인 레코드가 있기 때문에

insert into ex_emp values(200, '홍길동', 20); --성공
insert into ex_emp values(300, '오쌤', 30); --실패


