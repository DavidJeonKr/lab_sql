-- JDBC(Java Database Connentivity)
-- Java 프로그램에서 데이터베이스 시스템에 접속해서 select/insert/update/delete

-- 블로그 작성 테이블
create table blogs (
    blog_no     number(4) primary key,
    title       varchar2(100 char) not null,
    content     varchar2(1000 char) not null,
    update_time timestamp default sysdate    
);
--테이블 편집 -> blog_no 컬럼에 열 시퀸스를 설정.
-- -> insert할 때 blog_no의 숫자가 자동으로 1씩 증가되면서 삽입되도록 하기 위해서

-- 새 블로그 글 작성(insert)
insert into blogs(title,content)
values('새 글 작성 테스트', '안녕하세요... 블로그 첫 작성글입니다');

insert into blogs(title, content)
values('두번째 작성글', 'Hello, This is my second blog content...');

insert into blogs(title, content)
values('test3', 'test content3...');

select *from blogs;

UPDATE blogs 
SET title = 'title 변경', content = 'Hello, 첫번째 변경 테스트', update_time = sysdate 
where blog_no = 1
;

DELETE FROM blogs WHERE blog_no = 6;

commit;


