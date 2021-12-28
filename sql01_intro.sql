--DDl(Data Definition Language) : CREATE, DROP, ALTER, TRUNCATE [정의]
--DQL(Data Query language) : SELECT [질의]
--DML(Data Manipulation Language) : INSERT, UPDATE, DELETE [조작]
--TCL(Transaction Control Language) : COMMIT, ROLLBACK

--Talbe
-- Column(열), Variables(변수들), Fileds, Attributes(속성)
-- ROw(행), Observation(관찰), Records(기록), Examples

-- 실습계정 만들기
--sqlplus / as sysdba
--create user scott(계정) identified by tiger(패스워드);
-- Grant 권한 설정
--GRANT connect, resouce TO scott;

--inline comment(주석)
--SHOW user; --현재 DMBS에 접속한 사용자 계정 이름 보여주기
SELECT sysdate from dual;  --DBMS의 현재 시간 정보 출력
-- dual
-- 오라클 자체에서 제공되는 테이블
-- 간단하게 함수를 이용해서 계산 결과값을 확인 할 때 사용하는 테이블
-- SYS사용자가 소유하는 오라클의 표준 테이블
-- SYS사용자가 소유하지만 어느 사용자에게 접근 가능한 테이블

-- SQL 문장은 세미콜론(;)으로 끝남
-- Ctrl+Enter: 커서가 위치한 곳의 SQL 한 문장(명령어)을 실행.
-- F5: 스크립트 실행. 파일의 처음부터 끝까지 모든 문장(명령어)를 실행.
-- select 문의 실행 결과는 [질의 결과] 탭에 출력.

show user;
-- Oracle에서만 사용하는 비표준 명령어
-- oracle 

describe emp;
-- describe 테이블 이름;    (설명하다)
-- 테이블의 구조(컬럼 이름, Null 가능 여부, 변수타입)를 출력
--describe는 desc로 줄여서 쓸 수 있음

desc dept;

-- Oracle의 데이터 타입(data type)
-- number: 숫자 타입(정수, 실수). 
-- 예) nubmer(2): 2자리 정수(-99~0~99). number(7,2): 소수점 이하 2자리까지 표현가능
-- varchar: variable-length characters.(가변길이 문자열)
-- 예) varchar2(10 byte): 최대 10바이트까지 저장할 수 있는 문자열
-- 예) varchar2(10 char): 최대 10글자까지 저장할 수 있는 문자열
-- date: 날짜와 시간.