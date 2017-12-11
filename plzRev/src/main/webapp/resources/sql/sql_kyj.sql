show user;

drop TABLE tbl_serviceCenter 

-- 고객센터 테이블
CREATE TABLE tbl_serviceCenter 
(	serviceno number      NOT NULL,              -- 글번호 시퀀스
	categoryno        number(1)     NOT NULL,        -- 1/공지사항, 2/1:1문의
  title     VARCHAR(300) NOT NULL,                  /* 제목 */
	msg       VARCHAR(2000) NOT NULL,                /* 내용 */
	writedate DATE DEFAULT sysdate NOT NULL,         /* 등록일 */
	cnt       number DEFAULT 0 NOT NULL,             /* 조회수 */
	status    number(1) DEFAULT 1 NOT NULL,          /* 상태 */
	commentCount number DEFAULT 0 NOT NULL,          /* 댓글수 */
	fk_email     VARCHAR2(50),                       /* 이메일 */
  important        NUMBER(1) DEFAULT 0 NOT NULL      /* 공지여부 */
  ,fk_theaterno NUMBER           NOT NULL           /* 극장번호 */
  
  ,CONSTRAINT PK_tbl_serviceCenter primary key(serviceno)
  ,CONSTRAINT FK_tbl_serviceCenter_email foreign  key(fk_email)references tbl_email(email)
  ,CONSTRAINT FK_tbl_serviceCenter_theaterno foreign  key(fk_theaterno)references tbl_theater(theaterno)
  ,CONSTRAINT CK_tbl_serviceCenter_status check (status in(0,1))
  ,CONSTRAINT CK_tbl_serviceCenter_col check (important in(0,1))
);

insert into tbl_serviceCenter(serviceno,categoryno,title, msg, writedate, cnt, status, commentCount,fk_email, important, fk_theaterno)
values(seq_serviceno.nextval,1, '제주 영업 종료 안내','
롯데시네마 제주는 2009년 2월 26일 오픈 이후,<br/>
고객 여러분의 아낌없는 성원과 사랑을 받으며, 제주시의 대표 문화공간으로 성장할 수 있었습니다.<br/>
더욱 쾌적한 환경을 제공하며 그 성원에 보답하고자 노력하였으나,<br/>
2017년 8월 20일(일)부로 영업을 종료하게 되었습니다.<br/>
그동안 롯데시네마 제주를 이용해 주셨던 고객님께 진심을 담아 감사하다는 말씀을 드리며,<br/>
거리는 멀어도 마음은 가까운 롯데시네마 서귀포를 애용해 주시길 부탁드립니다.<br/>
고객님의 앞날에 행복과 행운이 가득하시길 롯데시네마 제주가 항상 응원하겠습니다.<br/>
다시 한번, 그동안 저희를 사랑해주신 고객님께 진심으로 감사드리며, 훗날 다시 뵙기를 고대하겠습니다.', default,default,default,default,'admin@admin.com',0,8)
;
update tbl_serviceCenter set fk_theaterno = 31
where serviceno = 15

select * 
from tbl_serviceCenter
where fk_regionno=8


commit
rollback
select * from tbl_serviceCenter
insert into tbl_serviceCenter(serviceno,categoryno,title, msg, writedate, cnt, status, commentCount,fk_email, important, fk_theaterno)
values(seq_serviceno.nextval,2, '예매내용 확인어떻게 하나요?
','어디서 확인해야되죠?', default,default,default,default,'admin@admin.com',0,1)

select* from tbl_theater
COMMENT ON TABLE tbl_serviceCenter IS '고객센터';
COMMENT ON COLUMN tbl_serviceCenter.fk_serviceno IS '공지사항시퀀스';
COMMENT ON COLUMN tbl_serviceCenter.title IS '제목';
COMMENT ON COLUMN tbl_serviceCenter.msg IS '내용';
COMMENT ON COLUMN tbl_serviceCenter.writedate IS '등록일';
COMMENT ON COLUMN tbl_serviceCenter.cnt IS '조회수';
COMMENT ON COLUMN tbl_serviceCenter.status IS '0- 삭제/ 1- 정상';
COMMENT ON COLUMN tbl_serviceCenter.commentCount IS '댓글수';
COMMENT ON COLUMN tbl_serviceCenter.fk_email IS '이메일';
COMMENT ON COLUMN tbl_serviceCenter.col IS '0-일반글 1-공지';

drop sequence seq_fk_serviceno

create sequence seq_serviceno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

drop table tbl_serviceCenter
commit
drop sequence seq_fk_serviceno
-- 자주묻는질문 테이블
CREATE TABLE tbl_FAQ (

	faqno    number                NOT NULL, /* 고객센터번호 */
  categorycode VARCHAR2(10) DEFAULT 0 /* 고객센터코드 */
	,title       VARCHAR2(100)          NOT NULL, /* 제목 */
	content     VARCHAR2(2000)        NOT NULL, /* 내용 */
	status      number(1) DEFAULT 1   not null /* 상태  0- 삭제/ 1- 정상 */
  ,CONSTRAINT PK_tbl_FAQ primary key(faqno)
  ,CONSTRAINT CK_tbl_FAQ_status check (status in(0,1))
);

drop table tbl_FAQ
select * from tbl_FAQ
commit
rollback

insert into tbl_FAQ(faqno,categorycode, title, content, status)
values(seq_fk_faqno.nextval, 3, '	
8월 21일 화재경보기 오작동에 따른 안내', '', default);

rollback
select * from tbl_FAQ;
commit
drop su
COMMENT ON TABLE tbl_FAQ IS '자주묻는질문';
COMMENT ON COLUMN tbl_FAQ.fk_faqno IS '고객센터번호';
COMMENT ON COLUMN tbl_FAQ.title IS '제목';
COMMENT ON COLUMN tbl_FAQ.content IS '내용';
COMMENT ON COLUMN tbl_FAQ.writedate IS '등록일';
COMMENT ON COLUMN tbl_FAQ.cnt IS '조회수';
COMMENT ON COLUMN tbl_FAQ.status IS '0- 삭제/ 1- 정상';



create sequence seq_fk_faqno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



-- 답글 테이블
CREATE TABLE tbl_comment 
( fk_commentno  number NOT NULL, /* 답글번호 */
  content       VARCHAR2(2000) NOT NULL, /* 댓글내용 */
  comment_date  DATE DEFAULT sysdate NOT NULL, /* 작성일자 */
  status number(1) DEFAULT 1 NOT NULL /* 상태 0- 삭제/ 1- 정상 */
  ,CONSTRAINT PK_tbl_comment primary key(fk_commentno)
  ,CONSTRAINT FK_tbl_comment_fk_commentno foreign  key(fk_commentno)references tbl_serviceCenter(serviceno)
  ,CONSTRAINT CK_tbl_comment_status check (status in(0,1))
);

select * from tbl_comment;
drop  sequence seq_companyno
COMMENT ON TABLE tbl_comment IS '답글';

COMMENT ON COLUMN tbl_comment.no IS '답글번호';
COMMENT ON COLUMN tbl_comment.fk_commentno IS '고객센터번호';
COMMENT ON COLUMN tbl_comment.content IS '댓글내용';
COMMENT ON COLUMN tbl_comment.comment_date IS '작성일자';
COMMENT ON COLUMN tbl_comment.status IS '1 : 사용가능한 글,  0 : 삭제된 글';


create sequence seq_fk_commentno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
commit


CREATE TABLE tbl_card_company (
	companyno number NOT NULL, /* 카드회사번호 */
	name VARCHAR(20) NOT NULL /* 회사이름 */
, CONSTRAINT PK_tbl_card_company primary key(companyno)
);
select * from tbl_card_company
COMMENT ON TABLE tbl_card_company IS 'tbl_card_company';
COMMENT ON COLUMN tbl_card_company.companyno IS '카드회사번호';
COMMENT ON COLUMN tbl_card_company.name IS '회사이름';

drop sequence seq_companyno



insert into tbl_card_company(companyno,name)
values(seq_companyno.nextval,'우리카드');
select * from tbl_card_company

commit
rollback
drop  TABLE tbl_card
CREATE TABLE tbl_card (
	cardno         number       NOT NULL,       /* 카드번호 */
	fk_seq_company number       NOT NULL,     /* 카드회사번호 */
	name           VARCHAR(200) NOT NULL,     /* 카드이름 */
	type           number DEFAULT 2 NOT NULL, /* 할인구분 -- 0: 현장할인1: 인터넷할인 2: 둘다'*/
	contents       VARCHAR(2000) NOT NULL     /* 할인내용 */
  ,img          varchar2(1000) not null     -- 카드이미지
  , CONSTRAINT PK_tbl_card_seq_card primary key(cardno)
  ,CONSTRAINT FK_tbl_card_seq_company foreign  key(fk_seq_company)references tbl_card_company(companyno)
);

select* from tbl_card
select cardno, fk_seq_company, name, type, contents,img
from tbl_card

select B.name,A.fk_seq_company, A.name, A.type, A.contents
from tbl_card A
join tbl_card_company B
on A.fk_seq_company = B.companyno

select * from tbl_card

select name 
from tbl_card_company

insert into tbl_card(cardno,fk_seq_company,name,type,contents, img)
values(seq_cardno.nextval,3,'KB국민은행 티머니 체크카드',2, '- 청구할인<br/>
- 1만원 이상 결제 시 20% 환급할인<br/>
- 1회 최대 6,000원 할인 가능, 월 최대 2만원까지 할인<br/>
- 최초 발급 후 사용등록일로부터 60일까지는 월간 통합할인한도<br/>
- 1만원 이내에서 할인"','국민티머니.png');
commit

create sequence seq_companyno
start with 5
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


COMMENT ON TABLE tbl_card IS 'tbl_card';

COMMENT ON COLUMN tbl_card.cardno IS '카드번호';

COMMENT ON COLUMN tbl_card.fk_seq_company IS '카드회사번호';

COMMENT ON COLUMN tbl_card.name IS '카드이름';

COMMENT ON COLUMN tbl_card.type IS '0: 현장할인
1: 인터넷할인
2: 둘다';

COMMENT ON COLUMN tbl_card.contents IS '할인내용';


select *from tbl_card;

select rownum as rno, V.name, V.cardno,V.fk_seq_company,V.
(
select A.name, B.cardno, B.fk_seq_company, B.name
			 , case when B.type = 0 then '현장할인' 
			 		when B.type = 1 then '인터넷할인'
			 		when B.type = 2 then '현장할인, 인터넷할인'
			 else ' ' end as type		
			 , B.contents, B.img
from tbl_card_company A join tbl_card B
on A.companyno = B.fk_seq_company
)
where A.name like '%'||'국'||'%'
and B.name like '%'||'국민'||'%'


commit;

select * from tbl_store;
select * from tbl_serviceCenter;
select * from tbl_serviceCategory;
select * from tbl_comment;
select * from tbl_FAQ;
select *from tbl_member;
select *from tbl_theater;

select *
from tbl_theater
where theatername = '제주'

commit
select A.CATEGORYNO, A.CATEGORYCODE, B.TITLE, B.CONTENT
from tbl_serviceCategory A join tbl_FAQ B
on A.categoryno = B.fk_faqno


select case when CATEGORYCODE = 0 then '전체'
            when CATEGORYCODE = 1 then '영화관이용' 
            when CATEGORYCODE = 2 then '회원'
            when CATEGORYCODE = 3 then '온라인'
            when CATEGORYCODE = 4 then '할인혜택'
            when CATEGORYCODE = 5 then '관람권'
            when CATEGORYCODE = 6 then '기프트샵'
       else '-' end as CATEGORYCODE
    , TITLE, CONTENT 
from tbl_FAQ 
where CATEGORYCODE = 2
	

-- 공지목록




select serviceno, categoryno,theatername,title,msg,important,writedate, cnt
from
(
select rownum as rno, serviceno, categoryno,theatername,title,msg,important,writedate, cnt
from
(
select A.serviceno,A.categoryno, B.theatername
		 	,case when B.fk_regionno = 1 then '서울'
		             when B.fk_regionno = 2 then '경기'
		             when B.fk_regionno = 3 then '인천'
		             when B.fk_regionno = 4 then '대전/충청/세종'
		             when B.fk_regionno = 5 then '부산/대구/경상'
		             when B.fk_regionno = 6 then '광주/전라울'
		             when B.fk_regionno = 7 then '강원'
		             when B.fk_regionno = 8 then '제주'
				else '전체' end as fk_regionno , A.title, A.msg,A.important
			, to_char(A.writedate,'yyyy-mm-dd')as writedate, A.cnt
		from tbl_serviceCenter A join tbl_theater B
		on A.serviceno = B.theaterno
		order by A.important desc, A.serviceno desc
)V
)T
where T.RNO >= 1 and T.RNO <= 5

select count(*) as cnt
from
	(
		select cardno, fk_seq_company, name as cardname
		 , case when type = 0 then '현장할인' 
		 		when type = 1 then '인터넷할인'
		 		when type = 2 then '현장할인, 인터넷할인'
		 else ' ' end as type		
		 , contents, img
	from tbl_card
	)V



select case when categorycode =1 then '영화관이용'
       when categorycode = 1 then '영화관이용' 
       when categorycode = 2 then '회원'
       when categorycode = 3 then '온라인'
       when categorycode = 4 then '할인혜택'
       when categorycode = 5 then '관람권'
       when categorycode = 6 then '기프트샵'
       else '전체' end as categorycode
      ,count(*) as cnt
from tbl_FAQ
group by rollup(categorycode)


select categorycode
      , TITLE, CONTENT 
 from tbl_FAQ 
where  TITLE||CONTENT like '%'||'합니다.'||'%'
  
  	select case 
			       when categorycode = 1 then '영화관이용' 
			       when categorycode = 2 then '회원'
			       when categorycode = 3 then '온라인'
			       when categorycode = 4 then '할인혜택'
			       when categorycode = 5 then '관람권'
			       when categorycode = 6 then '기프트샵'
		        else '전체' end as categorycode
		      ,count(*) as cnt
		from tbl_FAQ
		group by rollup(categorycode)
		order by cnt desc
commit

	select case  when categorycode = 1 then '영화관이용' 
				       when categorycode = 2 then '회원'
				       when categorycode = 3 then '온라인'
				       when categorycode = 4 then '할인혜택'
				       when categorycode = 5 then '관람권'
				       when categorycode = 6 then '기프트샵'
		        else '전체' end as categorycode
    	  , TITLE, CONTENT 
		from tbl_FAQ 
		where categorycode = 6
    
    
  
  select case when categorycode = 0 then '전체'
              when categorycode = 1 then '영화관이용' 
              when categorycode = 2 then '회원'
              when categorycode = 3 then '온라인'
              when categorycode = 4 then '할인혜택'
              when categorycode = 5 then '관람권'
              when categorycode = 6 then '기프트샵'
         else '-' end as categorycode
      , TITLE, CONTENT 
  from tbl_FAQ 
    
-- FAQ 카테고리별 목록  
select case 
              when categorycode = 1 then '영화관이용' 
              when categorycode = 2 then '회원'
              when categorycode = 3 then '온라인'
              when categorycode = 4 then '할인혜택'
              when categorycode = 5 then '관람권'
              when categorycode = 6 then '기프트샵'
         else '전체' end as categoryname 
      ,categorycode
    ,count(*) as cnt
  from tbl_FAQ
  group by rollup(categorycode)
  order by cnt desc
  
  select V.*
  from
  (
  select row_number() over(order by faqno DESC)as rno
       ,case  when categorycode = 1 then '영화관이용' 
              when categorycode = 2 then '회원'
              when categorycode = 3 then '온라인'
              when categorycode = 4 then '할인혜택'
              when categorycode = 5 then '관람권'
              when categorycode = 6 then '기프트샵'
         else '전체' end as categorycode, title, content
  from tbl_FAQ
  WHERE categorycode = 3
  )V
  where V.rno between 1 and 5
 
 
 
 select theaterno,theatername
 from tbl_theater 
order by A.serviceno desc

select theaterno, fk_regionno, theatername
from tbl_theater
 
  select A.serviceno,A.categoryno, B.theatername
		 		,case when B.fk_regionno = 1 then '서울'
		              when B.fk_regionno = 2 then '경기'
		              when B.fk_regionno = 3 then '인천'
		              when B.fk_regionno = 4 then '대전/충청/세종'
		              when B.fk_regionno = 5 then '부산/대구/경상'
		              when B.fk_regionno = 6 then '광주/전라울'
		              when B.fk_regionno = 7 then '강원'
		              when B.fk_regionno = 8 then '제주'
				 else '전체' end as regionno 
		 		,B.fk_regionno, A.title, A.msg,A.important
			, to_char(A.writedate,'yyyy-mm-dd')as writedate, A.cnt
		from tbl_serviceCenter A join tbl_theater B
		on A.serviceno = B.theaterno
		order by A.important desc, A.serviceno desc
 	
 
 
 
 
 select case when fk_regionno = 1 then '서울'
             when fk_regionno = 2 then '경기'
             when fk_regionno = 3 then '인천'
             when fk_regionno = 4 then '대전/충청/세종'
             when fk_regionno = 5 then '부산/대구/경상'
             when fk_regionno = 6 then '광주/전라울'
             when fk_regionno = 7 then '강원'
             when fk_regionno = 8 then '제주'
				else '전체' end as regionno 
      ,count(*)as cnt
  from tbl_theater 
  group by rollup(fk_regionno)
  order by cnt desc


 select A.serviceno, A.categoryno, B.theatername, B.fk_regionno, A.title, A.msg, A.important
			, to_char(A.writedate,'yyyy-mm-dd')as writedate, A.cnt
		 from tbl_serviceCenter A join tbl_theater B
		 on A.serviceno = B.theaterno
		 where fk_regionno = 1
		 and theatername = '강남'
		 and TITLE || msg like '%'|| '.' ||'%' 
		 order by A.important desc, A.serviceno desc



select count(*)as cnt
from tbl_serviceCenter A join tbl_theater B
on A.serviceno = B.theaterno
where status = 1
and fk_regionno like '%' || '1' || '%'
and theatername like '%' || '강남' || '%'



 select A.serviceno, A.categoryno, B.theatername, B.fk_regionno, A.title, A.msg, A.important
			, to_char(A.writedate,'yyyy-mm-dd')as writedate, A.cnt
 from tbl_serviceCenter A join tbl_theater B
 on A.serviceno = B.theaterno
 where fk_regionno = 1
 and theatername = '강남'
 and TITLE || msg like '%'|| '.' ||'%' 
 order by A.important desc, A.serviceno desc

select*from tbl_FAQ
 
insert into tbl_FAQ(faqno,categorycode, title, content,status)
values(seq_fk_faqno.nextval,6 ,'	
기프트샵은 무엇인가요?','홈페이지에서 운영하는 온라인 몰이며, 영화관람권과 매점교환권을 구매하거나 선물할 수 있는 서비스 입니다.',default)

select case 
		            when categorycode = 1 then '영화관이용' 
		            when categorycode = 2 then '회원'
		            when categorycode = 3 then '온라인'
		            when categorycode = 4 then '할인혜택'
		            when categorycode = 5 then '관람권'
		            when categorycode = 6 then '기프트샵'
		       else '전체' end as categoryname 
				,nvl(categorycode, -1)
			,count(*) as cnt
		from tbl_FAQ
		group by rollup(categorycode)
		order by cnt desc


select case when categorycode = 1 then '영화관이용' 
            when categorycode = 2 then '회원'
            when categorycode = 3 then '온라인'
            when categorycode = 4 then '할인혜택'
            when categorycode = 5 then '관람권'
            when categorycode = 6 then '기프트샵'
       else '전체' end as categorycode
    , TITLE, CONTENT 
from tbl_FAQ 
where TITLE like '%'|| '?' ||'%'



select V.*
  from
  (
  select row_number() over(order by faqno DESC)as rno
        ,case when categorycode = 1 then '영화관이용' 
              when categorycode = 2 then '회원'
              when categorycode = 3 then '온라인'
              when categorycode = 4 then '할인혜택'
              when categorycode = 5 then '관람권'
              when categorycode = 6 then '기프트샵'
       else '전체' end as categorycode, title, content
  from tbl_FAQ
  )V
 where V.rno between 1 and 5
 
 
 
select V.*
  from
  (
  select row_number() over(order by faqno DESC)as rno
        ,case when categorycode = 1 then '영화관이용' 
              when categorycode = 2 then '회원'
              when categorycode = 3 then '온라인'
              when categorycode = 4 then '할인혜택'
              when categorycode = 5 then '관람권'
              when categorycode = 6 then '기프트샵'
       else '전체' end as categorycode, title, content
  from tbl_FAQ
  where categorycode = 3
  )V
 where V.rno between 1 and 5
 
 
 
 select theatername
 from
 (
 	select regionno
        , count(*)
  from tbl_region 
  group by rollup(regionno)
  )V 
  join tbl_theater B
  on V.regionno = B.fk_regionno
  where regionno = 1
 
select * from tbl_theater 
select * from tbl_region 
 
 
		select case 
		            when categorycode = 1 then '영화관이용' 
		            when categorycode = 2 then '회원'
		            when categorycode = 3 then '온라인'
		            when categorycode = 4 then '할인혜택'
		            when categorycode = 5 then '관람권'
		            when categorycode = 6 then '기프트샵'
		       else '전체' end as categorycode, TITLE, CONTENT 
		from tbl_FAQ 
		where categorycode = 1
 
 select *
 from
 (
  select regionno 
  from tbl_region 
  group by rollup(regionno)
  )V 
  join tbl_theater B
  on V.regionno = B.fk_regionno
	where fk_regionno = 1
  
  
  
  select theatername 
  from tbl_theater 
  where theatername like '%'||'목'||'%'
  
  select serviceno, categoryno, theatername, title, msg, important, writedate, cnt
  from
  (
  select rownum as rno, serviceno, categoryno, theatername, title, msg, important, writedate, cnt
  from
  (
   select A.serviceno, A.categoryno, B.theatername, B.fk_regionno, A.title, A.msg,A.important
        , to_char(A.writedate,'yyyy-mm-dd')as writedate, A.cnt
   from tbl_serviceCenter A join tbl_theater B
   on A.serviceno = B.theaterno
   where TITLE  like '%'||' ' ||'%' 
   and categoryno = 1
   order by A.important desc, A.serviceno desc
  )V
)T
where rno between 1 and 3
  
  
  select theaterno,theatername
   from
   (
    select regionno 
    from tbl_region 
    group by rollup(regionno)
    )V 
    join tbl_theater B
    on V.regionno = B.fk_regionno
    where fk_regionno = 1
  
select case when categorycode = 1 then '영화관이용' 
		            when categorycode = 2 then '회원'
		            when categorycode = 3 then '온라인'
		            when categorycode = 4 then '할인혜택'
		            when categorycode = 5 then '관람권'
		            when categorycode = 6 then '기프트샵'
		       else '전체' end as categorycode
		    , TITLE, CONTENT 
		from tbl_FAQ 
		where categorycode = 1
		and TITLE like '%'|| '안' ||'%'

select *from tbl_serviceCenter;
select *from tbl_FAQ



select case when categorycode = 1 then '영화관이용' 
            when categorycode = 2 then '회원'
            when categorycode = 3 then '온라인'
            when categorycode = 4 then '할인혜택'
            when categorycode = 5 then '관람권'
            when categorycode = 6 then '기프트샵'
       else '전체' end as categorycode
    , TITLE, CONTENT 
from tbl_FAQ 
where categorycode = 3
and TITLE like '%'|| '.'||'%'





