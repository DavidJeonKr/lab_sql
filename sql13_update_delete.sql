--DML(Data Mnipulation Language): insert, update, delete
-- insert into 테이블 이름(컬럼, ...) values(값, ...);
-- insert into 테이블 select ~;
-- update 테이블 이름 set 컬럼 = 값, ... where 조건식;
-- delete from 테이블 이름 where 조건식;
-- update와 delete에서 where 조건 구문이 없는 경우에는 테이블의 모든 행이 변경/삭제됨.
update ex02 set ex_id = 1 where ex_id > 0;

-- emp 테이블의 모든 내용을 emp2 테이블로 복사
create table emp2
as select *from emp;

select * from emp2; 
--emp2에서 empno=1004의 급여
update emp2 set sal = 10000;
-- 테이블의 모든 행(15개)이 업데이트

update emp2 set sal = 10000 where empno = 1004;

rollback;

delete from emp2;
-- delete는 rollback이 가능한 DML
-- truncate는 rollback이 불가능한 DDL

-- emp2 테이블에서 사번이 1004를 삭제할 때
delete from emp2 where empno= 1004;
commit;
select * from issuebook;
update book set book_rent = 0 where book_seq = 1;
select * from book where book_seq = 1;
select * from returnbook;
select* from issuebook;
select * from issuebook where book_seq = 1 and user_seq = 1;
insert into returnbook(book_seq, user_seq, bname, uname) values(4,5,'greate','david');