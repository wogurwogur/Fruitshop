---- **** fruitshop ?��미웹?��로젝?�� ?��?�� ?��?��?�� �? **** ----

-- ?��?��?�� 계정 ?��?��?�� ?��?��?��?�� SYS ?��?�� SYSTEM ?���? ?��결하?�� ?��?��?�� ?��?�� ?��?��?��. [SYS ?��?��] --
show user;
-- USER?��(�?) "SYS"?��?��?��.

-- ?��?��?�� 계정 ?��?��?�� 계정�? ?��?�� c## 붙이�? ?���? ?��?��?��?���? ?��겠습?��?��.
alter session set "_ORACLE_SCRIPT"=true;
-- Session?��(�?) �?경되?��?��?��?��.

-- ?��?��?�� 계정명�? MYMVC_USER ?���? ?��?��?�� gclass ?�� ?��?��?�� 계정?�� ?��?��?��?��?��.
create user fruitshop_user identified by gclass default tablespace users;
-- User MYMVC_USER?��(�?) ?��?��?��?��?��?��?��.

-- ?��?��?�� ?��?��?��?���? MYMVC_USER ?��?��?�� ?��?��?�� ?��반사?��?�� 계정?���? ?��?��?�� ?��버에 ?��?��?�� ?��?���?�?,
-- ?��?���? ?��?�� ?��?��?�� ?�� ?�� ?��?���? ?��?���?�? 권한?�� �??��?��주겠?��?��?��.
grant connect, resource, create view, unlimited tablespace to fruitshop_user;
-- Grant?��(�?) ?��공했?��?��?��.

-----------------------------------------------------------------------


show user;


/* 메인?��?���? 배너 ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_main_page
(
  imgno         NUMBER          NOT NULL
, imgname       NVARCHAR2(20)   NOT NULL
, imgfilename   NVARCHAR2(30)   NOT NULL

, CONSTRAINT PK_tbl_main_page_imgno PRIMARY KEY (imgno)
);

CREATE SEQUENCE seq_main_image
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

INSERT INTO tbl_main_page(imgno, imgname, imgfilename) VALUES (seq_main_image.NEXTVAL, 'pick', 'main_pick.png');
INSERT INTO tbl_main_page(imgno, imgname, imgfilename) VALUES (seq_main_image.NEXTVAL, 'bestseller', 'main_best.png');
INSERT INTO tbl_main_page(imgno, imgname, imgfilename) VALUES (seq_main_image.NEXTVAL, 'delivery', 'main_delivery.png');

COMMIT;
/* 메인?��?���? 배너 ?��?���? ?�� */



/* ?��?�� ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_member
( user_no           NUMBER          NOT NULL        /* ?��?��번호 */
, userid            VARCHAR2(20)    NOT NULL        /* ?��?��?��?��?�� */
, passwd            VARCHAR2(200)   NOT NULL        /* ?��?��비�?번호 */
, name              NVARCHAR2(10)   NOT NULL        /* ?��?��?���? */
, birthday          VARCHAR2(20)    NOT NULL        /* ?��?��?��?�� */
, email             VARCHAR2(200)   NOT NULL        /* ?��메일 */
, tel               VARCHAR2(15)                    /* ?��?���? */
, postcode          VARCHAR2(5)                     /* ?��?��번호 */
, address           VARCHAR2(200)                   /* 주소 */
, detailaddress     VARCHAR2(200)                   /* ?��?��주소 */
, extraadress       VARCHAR2(200)                   /* 참고?��?�� */
, gender            NVARCHAR2(2)                    /* ?���?(?��/?��) */
, point             NUMBER    DEFAULT 0             /* ?��립금 */
, registerday       DATE DEFAULT SYSDATE NOT NULL   /* �??��?�� */
, lastpwdchangedate DATE DEFAULT SYSDATE NOT NULL   /* 마�?�? 비�?번호 �?경일 */
, idle              NUMBER(1) DEFAULT 1  NOT NULL   /* ?��면상?��(0:?��면중, 1:?��?���?) */
, status            NUMBER(1) DEFAULT 1  NOT NULL   /* �??��?��?��(0:?��?��, 1:�??���?) */
, role              NUMBER(1) DEFAULT 1  NOT NULL   /* ?��??권한(1:?��반유??, 2:�?리자) */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_member_user_no PRIMARY KEY (user_no)
, CONSTRAINT UQ_tbl_member_userid  UNIQUE (userid)
, CONSTRAINT UQ_tbl_member_email   UNIQUE (email)
, CONSTRAINT CK_tbl_member_idle    CHECK (idle IN (0, 1))
, CONSTRAINT CK_tbl_member_status  CHECK (status IN (0, 1))
, CONSTRAINT CK_tbl_member_role    CHECK (role IN (1, 2))
);
-- Table TBL_MEMBER created.


COMMENT ON TABLE tbl_member IS '?��?�� ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_member.user_no IS '?��?��번호';

COMMENT ON COLUMN tbl_member.userid IS '?��?��?��?��?��';

COMMENT ON COLUMN tbl_member.passwd IS '?��?��비�?번호';

COMMENT ON COLUMN tbl_member.name IS '?��?��?���?';

COMMENT ON COLUMN tbl_member.birthday IS '?��?��?��?��';

COMMENT ON COLUMN tbl_member.email IS '?��메일';

COMMENT ON COLUMN tbl_member.tel IS '?��?���?';

COMMENT ON COLUMN tbl_member.postcode IS '?��?��번호';

COMMENT ON COLUMN tbl_member.address IS '주소';

COMMENT ON COLUMN tbl_member.detailaddress IS '?��?��주소';

COMMENT ON COLUMN tbl_member.extraadress IS '참고?��?��';

COMMENT ON COLUMN tbl_member.gender IS '?���?(?��/?��)';

COMMENT ON COLUMN tbl_member.point IS '?��립금';

COMMENT ON COLUMN tbl_member.registerday IS '�??��?��';

COMMENT ON COLUMN tbl_member.lastpwdchangedate IS '마�?�? 비�?번호 �?경일';

COMMENT ON COLUMN tbl_member.idle IS '?��면상?��(0:?��면중, 1:?��?���?)';

COMMENT ON COLUMN tbl_member.status IS '�??��?��?��(0:?��?��, 1:�??���?)';

COMMENT ON COLUMN tbl_member.role IS '?��??권한(1:?��반유??, 2:�?리자)';


CREATE SEQUENCE user_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence USER_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_MEMBER';
/* ?��?�� ?��?���? ?�� */








/* 로그?�� 기록 ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_loginhistory
( loghis_no         NUMBER          NOT NULL        /* 로그?��기록 번호 */
, fk_user_no        NUMBER          NOT NULL        /* ?��?��번호 */
, login_date        DATE DEFAULT SYSDATE NOT NULL   /* 로그?��?��?�� */
, clinetip          VARCHAR2(20)    NOT NULL        /* ?��?��?�� IP주소 */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_history_loghis_no   PRIMARY KEY (loghis_no)
, CONSTRAINT FK_tbl_history_fk_user_no  FOREIGN KEY (fk_user_no) REFERENCES tbl_member(user_no)
);
-- Table TBL_LOGINHISTORY created.


COMMENT ON TABLE tbl_loginhistory IS '로그?�� 기록?�� ?��기는 ?��?���?';

COMMENT ON COLUMN tbl_loginhistory.loghis_no IS '로그?�� 기록 번호';

COMMENT ON COLUMN tbl_loginhistory.fk_user_no IS '?��?��번호';

COMMENT ON COLUMN tbl_loginhistory.login_date IS '로그?�� ?��?��';

COMMENT ON COLUMN tbl_loginhistory.clinetip IS '?��?��?�� IP주소';



CREATE SEQUENCE login_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence USER_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_LOGINHISTORY';
/* 로그?�� 기록 ?��?���? ?�� */








/* 계절 ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_seasons
( season_no         NUMBER          NOT NULL        /* 계절번호 */
, season_name       NVARCHAR2(5)    NOT NULL        /* 계절�?(�?/?���?/�??��/겨울) */
, season_image      VARCHAR2(50)    NOT NULL        /* 계절???��?��미�? */

, CONSTRAINT PK_tbl_seasons_season_no   PRIMARY KEY (season_no)
);
-- Table TBL_SEASONS created.


COMMENT ON TABLE tbl_seasons IS '계절 ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_seasons.season_no IS '계절번호';

COMMENT ON COLUMN tbl_seasons.season_name IS '계절�?(�?/?���?/�??��/겨울)';

COMMENT ON COLUMN tbl_seasons.season_image IS '계절???��?��미�?';


--INSERT INTO tbl_seasons(season_no, season_name, season_image) VALUES (1, '�?', 'sping.png');

--INSERT INTO tbl_seasons(season_no, season_name, season_image) VALUES (2, '?���?', 'summer.png');

--INSERT INTO tbl_seasons(season_no, season_name, season_image) VALUES (3, '�??��', 'autumn.png');

--INSERT INTO tbl_seasons(season_no, season_name, season_image) VALUES (4, '겨울', 'winter.png');

--COMMIT;


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_SEASONS';
/* 계절 ?��?���? ?�� */








/* ?��?�� ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_products
( prod_no           NUMBER          NOT NULL        /* ?��?��번호 */
, prod_name         NVARCHAR2(20)   NOT NULL        /* ?��?���? */
, prod_cost         NUMBER          NOT NULL        /* ?��?��?���? */
, prod_price        NUMBER          NOT NULL        /* ?��?���?�? */
, prod_thumnail     VARCHAR2(100)                   /* ?��?��?��?��?�� */
, prod_descript     VARCHAR2(100)                   /* ?��?�� ?���? ?��?��?��?�� */
, prod_inventory    NUMBER(1)       DEFAULT 0       /* ?��?��?��고량 */
, fk_season_no      NUMBER          NOT NULL        /* 계절번호 */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_products_prod_no        PRIMARY KEY (prod_no)
, CONSTRAINT FK_tbl_products_fk_season_no   FOREIGN KEY (fk_season_no) REFERENCES tbl_seasons(season_no)
);
-- Table TBL_PRODUCTS created.


COMMENT ON TABLE tbl_products IS '?��?�� ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_products.prod_no IS '?��?��번호';

COMMENT ON COLUMN tbl_products.prod_name IS '?��?���?';

COMMENT ON COLUMN tbl_products.prod_cost IS '?��?��?���?';

COMMENT ON COLUMN tbl_products.prod_price IS '?��?���?�?';

COMMENT ON COLUMN tbl_products.prod_thumnail IS '?��?��?��?��?��';

COMMENT ON COLUMN tbl_products.prod_descript IS '?��?�� ?���? ?��?��?��?��';

COMMENT ON COLUMN tbl_products.prod_inventory IS '?��?��?��고량';

COMMENT ON COLUMN tbl_products.fk_season_no IS '계절번호';



CREATE SEQUENCE prod_no
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence PROD_NO created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_PRODUCTS';
/* ?��?�� ?��?���? ?�� */








/* 배송�? ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_ship
( ship_no            NUMBER          NOT NULL        /* 배송�?번호 */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, ship_name          NVARCHAR2(10)   NOT NULL        /* 배송�?�? */
, ship_postcode      VARCHAR2(5)                     /* ?��?��번호 */
, ship_address       VARCHAR2(200)                   /* 주소 */
, ship_detailaddress VARCHAR2(200)                   /* ?��?��주소 */
, ship_extraadress   VARCHAR2(200)                   /* 참고?��?�� */
, ship_default       NUMBER(1)     DEFAULT 0         /* 기본배송�??��?��?���?(0:그외, 1:기본) */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_ship_ship_no      PRIMARY KEY (ship_no)
, CONSTRAINT FK_tbl_ship_fk_user_no   FOREIGN KEY (fk_user_no) REFERENCES tbl_member(user_no)
);
-- Table TBL_SHIP created.


COMMENT ON TABLE tbl_ship IS '배송�? ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_ship.ship_no IS '배송�?번호';

COMMENT ON COLUMN tbl_ship.fk_user_no IS '?��?��번호';

COMMENT ON COLUMN tbl_ship.ship_name IS '배송�?�?';

COMMENT ON COLUMN tbl_ship.ship_postcode IS '배송�??��?��번호';

COMMENT ON COLUMN tbl_ship.ship_address IS '배송�?주소';

COMMENT ON COLUMN tbl_ship.ship_detailaddress IS '배송�? ?��?��주소';

COMMENT ON COLUMN tbl_ship.ship_extraadress IS '배송�? 참고?��?��';

COMMENT ON COLUMN tbl_ship.ship_default IS '기본배송�??��?��?���?(0:그외, 1:기본)';



CREATE SEQUENCE ship_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence SHIP_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_SHIP';
/* 배송�? ?��?���? ?�� */







/* 찜목�? ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_wish
( wish_no            NUMBER          NOT NULL        /* 찜번?�� */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, fk_prod_no         NUMBER          NOT NULL        /* ?��?��번호 */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_wish_wish_no      PRIMARY KEY (wish_no)
, CONSTRAINT FK_tbl_wish_fk_user_no   FOREIGN KEY (fk_user_no) REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_wish_fk_prod_no   FOREIGN KEY (fk_prod_no) REFERENCES tbl_products(prod_no)
);
-- Table TBL_WISH created.


COMMENT ON TABLE tbl_wish IS '찜목�? ?��보�?? ?���? 꺼내?�� ?��?���?';

COMMENT ON COLUMN tbl_wish.wish_no IS '배송�?번호';

COMMENT ON COLUMN tbl_wish.fk_user_no IS '?��?��번호';

COMMENT ON COLUMN tbl_wish.fk_prod_no IS '?��?��번호';


CREATE SEQUENCE wish_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence WISH_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_WISH';
/* 찜목�? ?��?���? ?�� */








/* 구매?���? ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_reviews
( review_no          NUMBER          NOT NULL        /* 구매?��기번?�� */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, fk_prod_no         NUMBER          NOT NULL        /* ?��?��번호 */
, review_title       NVARCHAR2(100)  NOT NULL        /* 구매?��기제�? */
, review_contents    NVARCHAR2(200)  NOT NULL        /* 구매?��기내?�� */
, review_status      NUMBER(1)  DEFAULT 1            /* 구매?��기상?�� (0:?��?��, 1:게시�?) */
, review_viewcount   NUMBER     DEFAULT 0            /* 구매?���? 조회?�� */
, review_image       VARCHAR2(100)                   /* 구매?���? ?��미�? */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_reviews_review_no    PRIMARY KEY (review_no)
, CONSTRAINT FK_tbl_reviews_fk_user_no   FOREIGN KEY (fk_user_no) REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_reviews_fk_prod_no   FOREIGN KEY (fk_prod_no) REFERENCES tbl_products(prod_no)
);
-- Table TBL_REVIEWS created.


COMMENT ON TABLE tbl_reviews IS '구매?��기�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_reviews.review_no IS '?���? 번호';

COMMENT ON COLUMN tbl_reviews.fk_user_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_reviews.fk_prod_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_reviews.review_title IS '구매?��기제�?';

COMMENT ON COLUMN tbl_reviews.review_contents IS '구매?��기내?��';

COMMENT ON COLUMN tbl_reviews.review_status IS '구매?��기상?�� (0:?��?��, 1:게시�?)';

COMMENT ON COLUMN tbl_reviews.review_viewcount IS '구매?���? 조회?��';

COMMENT ON COLUMN tbl_reviews.review_image IS '구매?���? ?��미�?';



CREATE SEQUENCE review_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence REVIEW_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_REVIEWS';
/* 구매?���? ?��?���? ?�� */







/* 구매?��기댓�? ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_comments
( comment_no         NUMBER          NOT NULL        /* 구매?��기댓�?번호 */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, fk_review_no       NUMBER          NOT NULL        /* ?��기번?�� */
, comment_contents   NVARCHAR2(100)  NOT NULL        /* ?��기댓�? ?��?�� */
, comments_pwd       VARCHAR2(200)   NOT NULL        /* ?��기댓�? 비�?번호 */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_comments_comment_no    PRIMARY KEY (comment_no)
, CONSTRAINT FK_tbl_comments_fk_user_no    FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_comments_fk_review_no  FOREIGN KEY (fk_review_no) REFERENCES tbl_reviews(review_no)
);
-- Table TBL_COMMENTS created.


COMMENT ON TABLE tbl_comments IS '구매?��기�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_comments.comment_no IS '?��기댓�? 번호';

COMMENT ON COLUMN tbl_comments.fk_user_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_comments.fk_review_no IS '?���? 번호';

COMMENT ON COLUMN tbl_comments.comment_contents IS '?��기댓�? ?��?��';

COMMENT ON COLUMN tbl_comments.comments_pwd IS '?��기댓�? 비�?번호';


CREATE SEQUENCE comment_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence COMMENT_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_COMMENTS';
/* 구매?��기댓�? ?��?���? ?�� */










/* 문의게시?�� ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_qna
( qna_no             NUMBER          NOT NULL        /* 문의번호 */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, fk_prod_no         NUMBER          NOT NULL        /* ?��?��번호 */
, qna_title          NVARCHAR2(100)  NOT NULL        /* 문의?���? */
, qna_contents       NVARCHAR2(200)  NOT NULL        /* 문의?��?�� */
, qna_regidate       DATE DEFAULT SYSDATE            /* 문의?��록일?�� */
, qna_status         NUMBER     DEFAULT 1            /* 문의�??��?��(0:?��?��, 1:게시�?) */
, qna_viewcount      NUMBER     DEFAULT 0            /* 문의�? 조회?�� */
, qna_answer         NVARCHAR2(200)                  /* ?���??��?�� */

/* ?��?��조건 */
, CONSTRAINT PK_tbl_qna_qna_no        PRIMARY KEY (qna_no)
, CONSTRAINT FK_tbl_qna_fk_user_no    FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_qna_fk_prod_no    FOREIGN KEY (fk_prod_no)   REFERENCES tbl_products(prod_no)
, CONSTRAINT CK_tbl_qna_qna_status    CHECK (qna_status IN (0, 1))
);
-- Table TBL_QNA created.


COMMENT ON TABLE tbl_qna IS '문의게시?�� ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_qna.qna_no IS '문의 번호';

COMMENT ON COLUMN tbl_qna.fk_user_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_qna.fk_prod_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_qna.qna_title IS '문의 ?���?';

COMMENT ON COLUMN tbl_qna.qna_contents IS '문의 ?��?��';

COMMENT ON COLUMN tbl_qna.qna_regidate IS '문의 ?��록일?��';

COMMENT ON COLUMN tbl_qna.qna_status IS '문의�??��?��(0:?��?��, 1:게시�?)';

COMMENT ON COLUMN tbl_qna.qna_viewcount IS '문의�? 조회?��';

COMMENT ON COLUMN tbl_qna.qna_answer IS '?���? ?��?��';


CREATE SEQUENCE qna_answer
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence QNA_ANSWER created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_QNA';
/* 문의게시?�� ?��?���? ?�� */










/* 주문 ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_order
( order_no           NUMBER          NOT NULL        /* 주문번호 */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, order_date         DATE   DEFAULT SYSDATE          /* 주문?��?�� */
, order_request      NVARCHAR2(50)                   /* ?���??��?�� */
, order_tprice       NUMBER                          /* 총주문금?�� */
, order_status       NUMBER(1)    DEFAULT 1          /* 주문 ?��?�� (1: 주문 / 2: 교환/반품 / 3: ?���? / 4: 취소 / 5: 구매?��?��) */
, order_changedate   DATE   DEFAULT SYSDATE          /* 주문 ?��?�� �?경일?�� */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_order_order_no      PRIMARY KEY (order_no)
, CONSTRAINT FK_tbl_order_fk_user_no    FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT CK_tbl_order_order_status  CHECK (order_status IN (1, 2, 3, 4, 5))
);
-- Table TBL_ORDER created.


COMMENT ON TABLE tbl_order IS '주문 ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_order.order_no IS '주문 번호';

COMMENT ON COLUMN tbl_order.fk_user_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_order.order_date IS '주문 ?��?��';

COMMENT ON COLUMN tbl_order.order_request IS '?���? ?��?��';

COMMENT ON COLUMN tbl_order.order_tprice IS '�? 주문금액';

COMMENT ON COLUMN tbl_order.order_status IS '주문 ?��?�� (1: 주문 / 2: 교환/반품 / 3: ?���? / 4: 취소 / 5: 구매?��?��)';

COMMENT ON COLUMN tbl_order.order_changedate IS '주문 ?��?�� �?경일?��';


CREATE SEQUENCE order_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence ORDER_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_ORDER';
/* 주문 ?��?���? ?�� */








/* 주문?��?�� ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_orderdetail
( ordetail_no        NUMBER          NOT NULL        /* 주문?��?��번호 */
, fk_order_no        NUMBER          NOT NULL        /* 주문번호 */
, fk_prod_no         NUMBER          NOT NULL        /* ?��?��번호 */
, ordetail_count     NUMBER                          /* ?��?��?��?�� */
, ordetail_price     NUMBER                          /* 개별 ?��?�� 금액 */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_ordetail_ordetail_no   PRIMARY KEY (ordetail_no)
, CONSTRAINT FK_tbl_ordetail_fk_order_no   FOREIGN KEY (fk_order_no)  REFERENCES tbl_order(order_no)
, CONSTRAINT FK_tbl_ordetail_fk_prod_no    FOREIGN KEY (fk_prod_no)   REFERENCES tbl_products(prod_no)
);
-- Table TBL_ORDERDETAIL created.


COMMENT ON TABLE tbl_orderdetail IS '주문 ?��?�� ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_orderdetail.ordetail_no IS '주문 ?��?�� 번호';

COMMENT ON COLUMN tbl_orderdetail.fk_order_no IS '주문 번호';

COMMENT ON COLUMN tbl_orderdetail.fk_prod_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_orderdetail.ordetail_count IS '?��?�� ?��?��';

COMMENT ON COLUMN tbl_orderdetail.ordetail_price IS '개별 ?��?�� 금액';


CREATE SEQUENCE orderdetail_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence ORDERDETAIL_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_ORDERDETAIL';
/* 주문?��?�� ?��?���? ?�� */









/* 결제 ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_payments
( pay_no             NUMBER          NOT NULL        /* 결제번호 */
, fk_order_no        NUMBER          NOT NULL        /* 주문번호 */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, pay_date           DATE       DEFAULT SYSDATE      /* 결제?��?�� */
, pay_refund         NUMBER(1)  DEFAULT 0            /* ?���? ?���?(0: 미환�?, 1: ?���?) */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_payments_pay_no        PRIMARY KEY (pay_no)
, CONSTRAINT FK_tbl_payments_fk_order_no   FOREIGN KEY (fk_order_no)  REFERENCES tbl_order(order_no)
, CONSTRAINT FK_tbl_payments_fk_user_no    FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT CK_tbl_payments_pay_refund  CHECK (pay_refund IN (0, 1))
);
-- Table TBL_PAYMENTS created.


COMMENT ON TABLE tbl_payments IS '결제 ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_payments.pay_no IS '결제 번호';

COMMENT ON COLUMN tbl_payments.fk_order_no IS '주문 번호';

COMMENT ON COLUMN tbl_payments.fk_user_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_payments.pay_date IS '결제?��?��';

COMMENT ON COLUMN tbl_payments.pay_refund IS '?���? ?���?(0: 미환�?, 1: ?���?)';


CREATE SEQUENCE payments_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence PAYMENTS_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_PAYMENTS';
/* 결제 ?��?���? ?�� */








/* ?��바구?��?�� 주문 ?���? ?�� ?��?�� ?��?��?�� ?��?? ?��?��?��?�� delete ?��?�� ?�� */
/* ?��바구?�� ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_cart
( cart_no            NUMBER          NOT NULL        /* ?��바구?��번호 */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, fk_prod_no         NUMBER          NOT NULL        /* ?��?��번호 */
, cart_prodcount     NUMBER          NOT NULL        /* ?��?�� ?��?�� */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_cart_cart_no      PRIMARY KEY (cart_no)
, CONSTRAINT FK_tbl_cart_fk_user_no   FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_cart_fk_prod_no   FOREIGN KEY (fk_prod_no)   REFERENCES tbl_products(prod_no)
);
-- Table TBL_CART created.


COMMENT ON TABLE tbl_cart IS '?��바구?��?�� ?��?? ?��?�� ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_cart.cart_no IS '?��바구?�� 번호';

COMMENT ON COLUMN tbl_cart.fk_user_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_cart.fk_prod_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_cart.cart_prodcount IS '?��?�� ?��?��';



CREATE SEQUENCE cart_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence CART_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_CART';
/* ?��바구?�� ?��?���? ?�� */










/* 공�??��?�� ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_notice
( notice_no          NUMBER          NOT NULL        /* 공�??��?��번호 */
, notice_title       NVARCHAR2(100)  NOT NULL        /* 공�??��?��?���? */
, notice_contents    NVARCHAR2(200)  NOT NULL        /* 공�??��?��?��?�� */
, notice_regidate    DATE   DEFAULT SYSDATE          /* 공�??��?�� ?��?��?��?�� */
, notice_status      NUMBER(1)     DEFAULT 1         /* 게시�? ?��?�� (0: ?��?��, 1:게시�?) */
, notice_viewcount   NUMBER        DEFAULT 0         /* 공�??��?�� 조회?�� */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_notice_notice_no      PRIMARY KEY (notice_no)
, CONSTRAINT CK_tbl_notice_notice_status  CHECK (notice_status IN (0, 1))
);
-- Table TBL_NOTICE created.


COMMENT ON TABLE tbl_notice IS '공�??��?�� �? ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_notice.notice_no IS '공�??��?�� 번호';

COMMENT ON COLUMN tbl_notice.notice_title IS '공�??��?�� ?���?';

COMMENT ON COLUMN tbl_notice.notice_contents IS '공�??��?�� ?��?��';

COMMENT ON COLUMN tbl_notice.notice_regidate IS '공�??��?�� ?��록일?��';

COMMENT ON COLUMN tbl_notice.notice_status IS '공�??��?�� �? ?��?�� (0: ?��?��, 1:게시�?)';

COMMENT ON COLUMN tbl_notice.notice_viewcount IS '공�??��?�� 조회?��';


CREATE SEQUENCE notice_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence NOTICE_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_NOTICE';
/* 공�??��?�� ?��?���? ?�� */










/* ?��주하?��질문 ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_faq
( faq_no             NUMBER          NOT NULL        /* ?��주하?��질문 번호 */
, faq_title          NVARCHAR2(100)  NOT NULL        /* ?��주하?��질문 ?���? */
, faq_contents       NVARCHAR2(200)  NOT NULL        /* ?��주하?��질문 ?��?�� */
, faq_regidate       DATE   DEFAULT SYSDATE          /* ?��주하?��질문 ?��?��?��?�� */
, faq_status         NUMBER(1)     DEFAULT 1         /* ?��주하?��질문 ?��?�� (0: ?��?��, 1:게시�?) */
, faq_viewcount      NUMBER        DEFAULT 0         /* ?��주하?��질문 조회?�� */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_faqe_faq_no     PRIMARY KEY (faq_no)
, CONSTRAINT CK_tbl_faq_faq_status  CHECK (faq_status IN (0, 1))
);
-- Table TBL_FAQ created.


COMMENT ON TABLE tbl_faq IS '?��주하?��질문 �? ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_faq.faq_no IS '?��주하?��질문 �? 번호';

COMMENT ON COLUMN tbl_faq.faq_title IS '?��주하?��질문 �? ?���?';

COMMENT ON COLUMN tbl_faq.faq_contents IS '?��주하?��질문 �? ?��?��';

COMMENT ON COLUMN tbl_faq.faq_regidate IS '?��주하?��질문 �? ?��록일?��';

COMMENT ON COLUMN tbl_faq.faq_status IS '?��주하?��질문 �? ?��?�� (0: ?��?��, 1:게시�?)';

COMMENT ON COLUMN tbl_faq.faq_viewcount IS '?��주하?��질문 �? 조회?��';


CREATE SEQUENCE faq_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence FAQ_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_FAQ';
/* ?��주하?��질문 ?��?���? ?�� */









/* 쿠폰 ?��?���? ?��?�� ?��?�� */
CREATE TABLE tbl_coupons
( coupon_no          NUMBER          NOT NULL        /* 쿠폰번호 */
, fk_user_no         NUMBER          NOT NULL        /* ?��?��번호 */
, coupon_name        VARCHAR2(50)    NOT NULL        /* 쿠폰�? */
, coupon_descript    VARCHAR2(50)    NOT NULL        /* 쿠폰?���? */
, coupon_expire      DATE            NOT NULL        /* 쿠폰 만료?��?�� */
, coupon_discount    NUMBER          NOT NULL        /* ?��?��금액 */


/* ?��?��조건 */
, CONSTRAINT PK_tbl_coupons_coupon_no   PRIMARY KEY (coupon_no)
, CONSTRAINT FK_tbl_coupons_fk_user_no  FOREIGN KEY (fk_user_no)  REFERENCES tbl_member(user_no)
);
-- Table TBL_COUPONS created.


COMMENT ON TABLE tbl_coupons IS '쿠폰 ?��보�? ?���? ?��?���?';

COMMENT ON COLUMN tbl_coupons.coupon_no IS '쿠폰 번호';

COMMENT ON COLUMN tbl_coupons.fk_user_no IS '?��?�� 번호';

COMMENT ON COLUMN tbl_coupons.coupon_name IS '쿠폰�?';

COMMENT ON COLUMN tbl_coupons.coupon_descript IS '쿠폰 ?���?';

COMMENT ON COLUMN tbl_coupons.coupon_expire IS '쿠폰 만료 ?��?��';

COMMENT ON COLUMN tbl_coupons.coupon_discount IS '?��?�� 금액';


CREATE SEQUENCE coupon_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;
-- Sequence ORDERDETAIL_SEQ created.


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_COUPONS';
/* 쿠폰 ?��?���? ?�� */

select *
from tbl_member;

select user_no, userid, passwd, name, birthday, email, tel,
                postcode, address, detailaddress, extraaddress, gender, point,
				   registerday, lastpwdchangedate, idle, status, role 
				   from tbl_member;

SELECT * FROM tab;

6 4 11 15 
select * from user_recyclebin;

purge recyclebin;

tbl_member

SELECT * FROM tbl_member;
