---- **** fruitshop ?Έλ―ΈμΉ?λ‘μ ?Έ ?? ??? κ²? **** ----

-- ?€?Ό?΄ κ³μ  ??±? ??΄?? SYS ?? SYSTEM ?Όλ‘? ?°κ²°ν?¬ ??? ?΄?Ό ?©??€. [SYS ??] --
show user;
-- USER?΄(κ°?) "SYS"???€.

-- ?€?Ό?΄ κ³μ  ??±? κ³μ λͺ? ?? c## λΆμ΄μ§? ?κ³? ??±??λ‘? ?κ² μ΅??€.
alter session set "_ORACLE_SCRIPT"=true;
-- Session?΄(κ°?) λ³?κ²½λ??΅??€.

-- ?€?Ό?΄ κ³μ λͺμ? MYMVC_USER ?΄κ³? ??Έ? gclass ?Έ ?¬?©? κ³μ ? ??±?©??€.
create user fruitshop_user identified by gclass default tablespace users;
-- User MYMVC_USER?΄(κ°?) ??±???΅??€.

-- ??? ??±??΄μ§? MYMVC_USER ?΄?Ό? ?€?Ό?΄ ?Όλ°μ¬?©? κ³μ ?κ²? ?€?Ό?΄ ?λ²μ ? ??΄ ??΄μ§?κ³?,
-- ??΄λΈ? ??± ?±?±? ?  ? ??λ‘? ?¬?¬κ°?μ§? κΆν? λΆ??¬?΄μ£Όκ² ?΅??€.
grant connect, resource, create view, unlimited tablespace to fruitshop_user;
-- Grant?(λ₯?) ?±κ³΅ν?΅??€.

-----------------------------------------------------------------------


show user;


/* λ©μΈ??΄μ§? λ°°λ ??΄λΈ? ??± ?? */
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
/* λ©μΈ??΄μ§? λ°°λ ??΄λΈ? ? */



/* ?? ??΄λΈ? ??± ?? */
CREATE TABLE tbl_member
( user_no           NUMBER          NOT NULL        /* ??λ²νΈ */
, userid            VARCHAR2(20)    NOT NULL        /* ????΄? */
, passwd            VARCHAR2(200)   NOT NULL        /* ??λΉλ?λ²νΈ */
, name              NVARCHAR2(10)   NOT NULL        /* ???΄λ¦? */
, birthday          VARCHAR2(20)    NOT NULL        /* ????Ό */
, email             VARCHAR2(200)   NOT NULL        /* ?΄λ©μΌ */
, tel               VARCHAR2(15)                    /* ?°?½μ²? */
, postcode          VARCHAR2(5)                     /* ?°?Έλ²νΈ */
, address           VARCHAR2(200)                   /* μ£Όμ */
, detailaddress     VARCHAR2(200)                   /* ??Έμ£Όμ */
, extraadress       VARCHAR2(200)                   /* μ°Έκ³ ?¬?­ */
, gender            NVARCHAR2(2)                    /* ?±λ³?(?¨/?¬) */
, point             NUMBER    DEFAULT 0             /* ? λ¦½κΈ */
, registerday       DATE DEFAULT SYSDATE NOT NULL   /* κ°???Ό */
, lastpwdchangedate DATE DEFAULT SYSDATE NOT NULL   /* λ§μ?λ§? λΉλ?λ²νΈ λ³?κ²½μΌ */
, idle              NUMBER(1) DEFAULT 1  NOT NULL   /* ?΄λ©΄μ?(0:?΄λ©΄μ€, 1:??μ€?) */
, status            NUMBER(1) DEFAULT 1  NOT NULL   /* κ°????(0:??΄, 1:κ°??μ€?) */
, role              NUMBER(1) DEFAULT 1  NOT NULL   /* ? ??κΆν(1:?Όλ°μ ??, 2:κ΄?λ¦¬μ) */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_member_user_no PRIMARY KEY (user_no)
, CONSTRAINT UQ_tbl_member_userid  UNIQUE (userid)
, CONSTRAINT UQ_tbl_member_email   UNIQUE (email)
, CONSTRAINT CK_tbl_member_idle    CHECK (idle IN (0, 1))
, CONSTRAINT CK_tbl_member_status  CHECK (status IN (0, 1))
, CONSTRAINT CK_tbl_member_role    CHECK (role IN (1, 2))
);
-- Table TBL_MEMBER created.


COMMENT ON TABLE tbl_member IS '?? ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_member.user_no IS '??λ²νΈ';

COMMENT ON COLUMN tbl_member.userid IS '????΄?';

COMMENT ON COLUMN tbl_member.passwd IS '??λΉλ?λ²νΈ';

COMMENT ON COLUMN tbl_member.name IS '???΄λ¦?';

COMMENT ON COLUMN tbl_member.birthday IS '????Ό';

COMMENT ON COLUMN tbl_member.email IS '?΄λ©μΌ';

COMMENT ON COLUMN tbl_member.tel IS '?°?½μ²?';

COMMENT ON COLUMN tbl_member.postcode IS '?°?Έλ²νΈ';

COMMENT ON COLUMN tbl_member.address IS 'μ£Όμ';

COMMENT ON COLUMN tbl_member.detailaddress IS '??Έμ£Όμ';

COMMENT ON COLUMN tbl_member.extraadress IS 'μ°Έκ³ ?¬?­';

COMMENT ON COLUMN tbl_member.gender IS '?±λ³?(?¨/?¬)';

COMMENT ON COLUMN tbl_member.point IS '? λ¦½κΈ';

COMMENT ON COLUMN tbl_member.registerday IS 'κ°???Ό';

COMMENT ON COLUMN tbl_member.lastpwdchangedate IS 'λ§μ?λ§? λΉλ?λ²νΈ λ³?κ²½μΌ';

COMMENT ON COLUMN tbl_member.idle IS '?΄λ©΄μ?(0:?΄λ©΄μ€, 1:??μ€?)';

COMMENT ON COLUMN tbl_member.status IS 'κ°????(0:??΄, 1:κ°??μ€?)';

COMMENT ON COLUMN tbl_member.role IS '? ??κΆν(1:?Όλ°μ ??, 2:κ΄?λ¦¬μ)';


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
/* ?? ??΄λΈ? ? */








/* λ‘κ·Έ?Έ κΈ°λ‘ ??΄λΈ? ??± ?? */
CREATE TABLE tbl_loginhistory
( loghis_no         NUMBER          NOT NULL        /* λ‘κ·Έ?ΈκΈ°λ‘ λ²νΈ */
, fk_user_no        NUMBER          NOT NULL        /* ??λ²νΈ */
, login_date        DATE DEFAULT SYSDATE NOT NULL   /* λ‘κ·Έ?Έ?Ό? */
, clinetip          VARCHAR2(20)    NOT NULL        /* ? ?? IPμ£Όμ */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_history_loghis_no   PRIMARY KEY (loghis_no)
, CONSTRAINT FK_tbl_history_fk_user_no  FOREIGN KEY (fk_user_no) REFERENCES tbl_member(user_no)
);
-- Table TBL_LOGINHISTORY created.


COMMENT ON TABLE tbl_loginhistory IS 'λ‘κ·Έ?Έ κΈ°λ‘?΄ ?΄κΈ°λ ??΄λΈ?';

COMMENT ON COLUMN tbl_loginhistory.loghis_no IS 'λ‘κ·Έ?Έ κΈ°λ‘ λ²νΈ';

COMMENT ON COLUMN tbl_loginhistory.fk_user_no IS '??λ²νΈ';

COMMENT ON COLUMN tbl_loginhistory.login_date IS 'λ‘κ·Έ?Έ ?Ό?';

COMMENT ON COLUMN tbl_loginhistory.clinetip IS '? ?? IPμ£Όμ';



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
/* λ‘κ·Έ?Έ κΈ°λ‘ ??΄λΈ? ? */








/* κ³μ  ??΄λΈ? ??± ?? */
CREATE TABLE tbl_seasons
( season_no         NUMBER          NOT NULL        /* κ³μ λ²νΈ */
, season_name       NVARCHAR2(5)    NOT NULL        /* κ³μ λͺ?(λ΄?/?¬λ¦?/κ°??/κ²¨μΈ) */
, season_image      VARCHAR2(50)    NOT NULL        /* κ³μ ????΄λ―Έμ? */

, CONSTRAINT PK_tbl_seasons_season_no   PRIMARY KEY (season_no)
);
-- Table TBL_SEASONS created.


COMMENT ON TABLE tbl_seasons IS 'κ³μ  ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_seasons.season_no IS 'κ³μ λ²νΈ';

COMMENT ON COLUMN tbl_seasons.season_name IS 'κ³μ λͺ?(λ΄?/?¬λ¦?/κ°??/κ²¨μΈ)';

COMMENT ON COLUMN tbl_seasons.season_image IS 'κ³μ ????΄λ―Έμ?';


--INSERT INTO tbl_seasons(season_no, season_name, season_image) VALUES (1, 'λ΄?', 'sping.png');

--INSERT INTO tbl_seasons(season_no, season_name, season_image) VALUES (2, '?¬λ¦?', 'summer.png');

--INSERT INTO tbl_seasons(season_no, season_name, season_image) VALUES (3, 'κ°??', 'autumn.png');

--INSERT INTO tbl_seasons(season_no, season_name, season_image) VALUES (4, 'κ²¨μΈ', 'winter.png');

--COMMIT;


SELECT column_name, comments
  FROM user_col_comments
 WHERE table_name = 'TBL_SEASONS';
/* κ³μ  ??΄λΈ? ? */








/* ?? ??΄λΈ? ??± ?? */
CREATE TABLE tbl_products
( prod_no           NUMBER          NOT NULL        /* ??λ²νΈ */
, prod_name         NVARCHAR2(20)   NOT NULL        /* ??λͺ? */
, prod_cost         NUMBER          NOT NULL        /* ???κ°? */
, prod_price        NUMBER          NOT NULL        /* ??κ°?κ²? */
, prod_thumnail     VARCHAR2(100)                   /* ???Έ?€?Ό */
, prod_descript     VARCHAR2(100)                   /* ?? ?€λͺ? ??Έ?΄?© */
, prod_inventory    NUMBER(1)       DEFAULT 0       /* ???¬κ³ λ */
, fk_season_no      NUMBER          NOT NULL        /* κ³μ λ²νΈ */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_products_prod_no        PRIMARY KEY (prod_no)
, CONSTRAINT FK_tbl_products_fk_season_no   FOREIGN KEY (fk_season_no) REFERENCES tbl_seasons(season_no)
);
-- Table TBL_PRODUCTS created.


COMMENT ON TABLE tbl_products IS '?? ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_products.prod_no IS '??λ²νΈ';

COMMENT ON COLUMN tbl_products.prod_name IS '??λͺ?';

COMMENT ON COLUMN tbl_products.prod_cost IS '???κ°?';

COMMENT ON COLUMN tbl_products.prod_price IS '??κ°?κ²?';

COMMENT ON COLUMN tbl_products.prod_thumnail IS '???Έ?€?Ό';

COMMENT ON COLUMN tbl_products.prod_descript IS '?? ?€λͺ? ??Έ?΄?©';

COMMENT ON COLUMN tbl_products.prod_inventory IS '???¬κ³ λ';

COMMENT ON COLUMN tbl_products.fk_season_no IS 'κ³μ λ²νΈ';



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
/* ?? ??΄λΈ? ? */








/* λ°°μ‘μ§? ??΄λΈ? ??± ?? */
CREATE TABLE tbl_ship
( ship_no            NUMBER          NOT NULL        /* λ°°μ‘μ§?λ²νΈ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, ship_name          NVARCHAR2(10)   NOT NULL        /* λ°°μ‘μ§?λͺ? */
, ship_postcode      VARCHAR2(5)                     /* ?°?Έλ²νΈ */
, ship_address       VARCHAR2(200)                   /* μ£Όμ */
, ship_detailaddress VARCHAR2(200)                   /* ??Έμ£Όμ */
, ship_extraadress   VARCHAR2(200)                   /* μ°Έκ³ ?¬?­ */
, ship_default       NUMBER(1)     DEFAULT 0         /* κΈ°λ³Έλ°°μ‘μ§??€? ?¬λΆ?(0:κ·ΈμΈ, 1:κΈ°λ³Έ) */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_ship_ship_no      PRIMARY KEY (ship_no)
, CONSTRAINT FK_tbl_ship_fk_user_no   FOREIGN KEY (fk_user_no) REFERENCES tbl_member(user_no)
);
-- Table TBL_SHIP created.


COMMENT ON TABLE tbl_ship IS 'λ°°μ‘μ§? ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_ship.ship_no IS 'λ°°μ‘μ§?λ²νΈ';

COMMENT ON COLUMN tbl_ship.fk_user_no IS '??λ²νΈ';

COMMENT ON COLUMN tbl_ship.ship_name IS 'λ°°μ‘μ§?λͺ?';

COMMENT ON COLUMN tbl_ship.ship_postcode IS 'λ°°μ‘μ§??°?Έλ²νΈ';

COMMENT ON COLUMN tbl_ship.ship_address IS 'λ°°μ‘μ§?μ£Όμ';

COMMENT ON COLUMN tbl_ship.ship_detailaddress IS 'λ°°μ‘μ§? ??Έμ£Όμ';

COMMENT ON COLUMN tbl_ship.ship_extraadress IS 'λ°°μ‘μ§? μ°Έκ³ ?¬?­';

COMMENT ON COLUMN tbl_ship.ship_default IS 'κΈ°λ³Έλ°°μ‘μ§??€? ?¬λΆ?(0:κ·ΈμΈ, 1:κΈ°λ³Έ)';



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
/* λ°°μ‘μ§? ??΄λΈ? ? */







/* μ°λͺ©λ‘? ??΄λΈ? ??± ?? */
CREATE TABLE tbl_wish
( wish_no            NUMBER          NOT NULL        /* μ°λ²?Έ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, fk_prod_no         NUMBER          NOT NULL        /* ??λ²νΈ */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_wish_wish_no      PRIMARY KEY (wish_no)
, CONSTRAINT FK_tbl_wish_fk_user_no   FOREIGN KEY (fk_user_no) REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_wish_fk_prod_no   FOREIGN KEY (fk_prod_no) REFERENCES tbl_products(prod_no)
);
-- Table TBL_WISH created.


COMMENT ON TABLE tbl_wish IS 'μ°λͺ©λ‘? ? λ³΄λ?? ?΄κ³? κΊΌλ΄? ??΄λΈ?';

COMMENT ON COLUMN tbl_wish.wish_no IS 'λ°°μ‘μ§?λ²νΈ';

COMMENT ON COLUMN tbl_wish.fk_user_no IS '??λ²νΈ';

COMMENT ON COLUMN tbl_wish.fk_prod_no IS '??λ²νΈ';


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
/* μ°λͺ©λ‘? ??΄λΈ? ? */








/* κ΅¬λ§€?κΈ? ??΄λΈ? ??± ?? */
CREATE TABLE tbl_reviews
( review_no          NUMBER          NOT NULL        /* κ΅¬λ§€?κΈ°λ²?Έ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, fk_prod_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, review_title       NVARCHAR2(100)  NOT NULL        /* κ΅¬λ§€?κΈ°μ λͺ? */
, review_contents    NVARCHAR2(200)  NOT NULL        /* κ΅¬λ§€?κΈ°λ΄?© */
, review_status      NUMBER(1)  DEFAULT 1            /* κ΅¬λ§€?κΈ°μ? (0:?­? , 1:κ²μμ€?) */
, review_viewcount   NUMBER     DEFAULT 0            /* κ΅¬λ§€?κΈ? μ‘°ν? */
, review_image       VARCHAR2(100)                   /* κ΅¬λ§€?κΈ? ?΄λ―Έμ? */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_reviews_review_no    PRIMARY KEY (review_no)
, CONSTRAINT FK_tbl_reviews_fk_user_no   FOREIGN KEY (fk_user_no) REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_reviews_fk_prod_no   FOREIGN KEY (fk_prod_no) REFERENCES tbl_products(prod_no)
);
-- Table TBL_REVIEWS created.


COMMENT ON TABLE tbl_reviews IS 'κ΅¬λ§€?κΈ°κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_reviews.review_no IS '?κΈ? λ²νΈ';

COMMENT ON COLUMN tbl_reviews.fk_user_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_reviews.fk_prod_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_reviews.review_title IS 'κ΅¬λ§€?κΈ°μ λͺ?';

COMMENT ON COLUMN tbl_reviews.review_contents IS 'κ΅¬λ§€?κΈ°λ΄?©';

COMMENT ON COLUMN tbl_reviews.review_status IS 'κ΅¬λ§€?κΈ°μ? (0:?­? , 1:κ²μμ€?)';

COMMENT ON COLUMN tbl_reviews.review_viewcount IS 'κ΅¬λ§€?κΈ? μ‘°ν?';

COMMENT ON COLUMN tbl_reviews.review_image IS 'κ΅¬λ§€?κΈ? ?΄λ―Έμ?';



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
/* κ΅¬λ§€?κΈ? ??΄λΈ? ? */







/* κ΅¬λ§€?κΈ°λκΈ? ??΄λΈ? ??± ?? */
CREATE TABLE tbl_comments
( comment_no         NUMBER          NOT NULL        /* κ΅¬λ§€?κΈ°λκΈ?λ²νΈ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, fk_review_no       NUMBER          NOT NULL        /* ?κΈ°λ²?Έ */
, comment_contents   NVARCHAR2(100)  NOT NULL        /* ?κΈ°λκΈ? ?΄?© */
, comments_pwd       VARCHAR2(200)   NOT NULL        /* ?κΈ°λκΈ? λΉλ?λ²νΈ */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_comments_comment_no    PRIMARY KEY (comment_no)
, CONSTRAINT FK_tbl_comments_fk_user_no    FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_comments_fk_review_no  FOREIGN KEY (fk_review_no) REFERENCES tbl_reviews(review_no)
);
-- Table TBL_COMMENTS created.


COMMENT ON TABLE tbl_comments IS 'κ΅¬λ§€?κΈ°κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_comments.comment_no IS '?κΈ°λκΈ? λ²νΈ';

COMMENT ON COLUMN tbl_comments.fk_user_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_comments.fk_review_no IS '?κΈ? λ²νΈ';

COMMENT ON COLUMN tbl_comments.comment_contents IS '?κΈ°λκΈ? ?΄?©';

COMMENT ON COLUMN tbl_comments.comments_pwd IS '?κΈ°λκΈ? λΉλ?λ²νΈ';


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
/* κ΅¬λ§€?κΈ°λκΈ? ??΄λΈ? ? */










/* λ¬Έμκ²μ? ??΄λΈ? ??± ?? */
CREATE TABLE tbl_qna
( qna_no             NUMBER          NOT NULL        /* λ¬Έμλ²νΈ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, fk_prod_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, qna_title          NVARCHAR2(100)  NOT NULL        /* λ¬Έμ? λͺ? */
, qna_contents       NVARCHAR2(200)  NOT NULL        /* λ¬Έμ?΄?© */
, qna_regidate       DATE DEFAULT SYSDATE            /* λ¬Έμ?±λ‘μΌ? */
, qna_status         NUMBER     DEFAULT 1            /* λ¬ΈμκΈ???(0:?­? , 1:κ²μμ€?) */
, qna_viewcount      NUMBER     DEFAULT 0            /* λ¬ΈμκΈ? μ‘°ν? */
, qna_answer         NVARCHAR2(200)                  /* ?΅λ³??΄?© */

/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_qna_qna_no        PRIMARY KEY (qna_no)
, CONSTRAINT FK_tbl_qna_fk_user_no    FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_qna_fk_prod_no    FOREIGN KEY (fk_prod_no)   REFERENCES tbl_products(prod_no)
, CONSTRAINT CK_tbl_qna_qna_status    CHECK (qna_status IN (0, 1))
);
-- Table TBL_QNA created.


COMMENT ON TABLE tbl_qna IS 'λ¬Έμκ²μ? ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_qna.qna_no IS 'λ¬Έμ λ²νΈ';

COMMENT ON COLUMN tbl_qna.fk_user_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_qna.fk_prod_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_qna.qna_title IS 'λ¬Έμ ? λͺ?';

COMMENT ON COLUMN tbl_qna.qna_contents IS 'λ¬Έμ ?΄?©';

COMMENT ON COLUMN tbl_qna.qna_regidate IS 'λ¬Έμ ?±λ‘μΌ?';

COMMENT ON COLUMN tbl_qna.qna_status IS 'λ¬ΈμκΈ???(0:?­? , 1:κ²μμ€?)';

COMMENT ON COLUMN tbl_qna.qna_viewcount IS 'λ¬ΈμκΈ? μ‘°ν?';

COMMENT ON COLUMN tbl_qna.qna_answer IS '?΅λ³? ?΄?©';


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
/* λ¬Έμκ²μ? ??΄λΈ? ? */










/* μ£Όλ¬Έ ??΄λΈ? ??± ?? */
CREATE TABLE tbl_order
( order_no           NUMBER          NOT NULL        /* μ£Όλ¬Έλ²νΈ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, order_date         DATE   DEFAULT SYSDATE          /* μ£Όλ¬Έ?Ό? */
, order_request      NVARCHAR2(50)                   /* ?μ²??¬?­ */
, order_tprice       NUMBER                          /* μ΄μ£Όλ¬ΈκΈ?‘ */
, order_status       NUMBER(1)    DEFAULT 1          /* μ£Όλ¬Έ ?? (1: μ£Όλ¬Έ / 2: κ΅ν/λ°ν / 3: ?λΆ? / 4: μ·¨μ / 5: κ΅¬λ§€?? ) */
, order_changedate   DATE   DEFAULT SYSDATE          /* μ£Όλ¬Έ ?? λ³?κ²½μΌ? */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_order_order_no      PRIMARY KEY (order_no)
, CONSTRAINT FK_tbl_order_fk_user_no    FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT CK_tbl_order_order_status  CHECK (order_status IN (1, 2, 3, 4, 5))
);
-- Table TBL_ORDER created.


COMMENT ON TABLE tbl_order IS 'μ£Όλ¬Έ ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_order.order_no IS 'μ£Όλ¬Έ λ²νΈ';

COMMENT ON COLUMN tbl_order.fk_user_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_order.order_date IS 'μ£Όλ¬Έ ?Ό?';

COMMENT ON COLUMN tbl_order.order_request IS '?μ²? ?¬?­';

COMMENT ON COLUMN tbl_order.order_tprice IS 'μ΄? μ£Όλ¬ΈκΈμ‘';

COMMENT ON COLUMN tbl_order.order_status IS 'μ£Όλ¬Έ ?? (1: μ£Όλ¬Έ / 2: κ΅ν/λ°ν / 3: ?λΆ? / 4: μ·¨μ / 5: κ΅¬λ§€?? )';

COMMENT ON COLUMN tbl_order.order_changedate IS 'μ£Όλ¬Έ ?? λ³?κ²½μΌ?';


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
/* μ£Όλ¬Έ ??΄λΈ? ? */








/* μ£Όλ¬Έ??Έ ??΄λΈ? ??± ?? */
CREATE TABLE tbl_orderdetail
( ordetail_no        NUMBER          NOT NULL        /* μ£Όλ¬Έ??Έλ²νΈ */
, fk_order_no        NUMBER          NOT NULL        /* μ£Όλ¬Έλ²νΈ */
, fk_prod_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, ordetail_count     NUMBER                          /* ???? */
, ordetail_price     NUMBER                          /* κ°λ³ ?? κΈμ‘ */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_ordetail_ordetail_no   PRIMARY KEY (ordetail_no)
, CONSTRAINT FK_tbl_ordetail_fk_order_no   FOREIGN KEY (fk_order_no)  REFERENCES tbl_order(order_no)
, CONSTRAINT FK_tbl_ordetail_fk_prod_no    FOREIGN KEY (fk_prod_no)   REFERENCES tbl_products(prod_no)
);
-- Table TBL_ORDERDETAIL created.


COMMENT ON TABLE tbl_orderdetail IS 'μ£Όλ¬Έ ??Έ ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_orderdetail.ordetail_no IS 'μ£Όλ¬Έ ??Έ λ²νΈ';

COMMENT ON COLUMN tbl_orderdetail.fk_order_no IS 'μ£Όλ¬Έ λ²νΈ';

COMMENT ON COLUMN tbl_orderdetail.fk_prod_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_orderdetail.ordetail_count IS '?? ??';

COMMENT ON COLUMN tbl_orderdetail.ordetail_price IS 'κ°λ³ ?? κΈμ‘';


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
/* μ£Όλ¬Έ??Έ ??΄λΈ? ? */









/* κ²°μ  ??΄λΈ? ??± ?? */
CREATE TABLE tbl_payments
( pay_no             NUMBER          NOT NULL        /* κ²°μ λ²νΈ */
, fk_order_no        NUMBER          NOT NULL        /* μ£Όλ¬Έλ²νΈ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, pay_date           DATE       DEFAULT SYSDATE      /* κ²°μ ?Ό? */
, pay_refund         NUMBER(1)  DEFAULT 0            /* ?λΆ? ?¬λΆ?(0: λ―ΈνλΆ?, 1: ?λΆ?) */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_payments_pay_no        PRIMARY KEY (pay_no)
, CONSTRAINT FK_tbl_payments_fk_order_no   FOREIGN KEY (fk_order_no)  REFERENCES tbl_order(order_no)
, CONSTRAINT FK_tbl_payments_fk_user_no    FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT CK_tbl_payments_pay_refund  CHECK (pay_refund IN (0, 1))
);
-- Table TBL_PAYMENTS created.


COMMENT ON TABLE tbl_payments IS 'κ²°μ  ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_payments.pay_no IS 'κ²°μ  λ²νΈ';

COMMENT ON COLUMN tbl_payments.fk_order_no IS 'μ£Όλ¬Έ λ²νΈ';

COMMENT ON COLUMN tbl_payments.fk_user_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_payments.pay_date IS 'κ²°μ ?Ό?';

COMMENT ON COLUMN tbl_payments.pay_refund IS '?λΆ? ?¬λΆ?(0: λ―ΈνλΆ?, 1: ?λΆ?)';


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
/* κ²°μ  ??΄λΈ? ? */








/* ?₯λ°κ΅¬?? μ£Όλ¬Έ ?λ£? ? ?΄?Ή ???΄ ?΄?? ???€? delete ?΄?Ό ?¨ */
/* ?₯λ°κ΅¬? ??΄λΈ? ??± ?? */
CREATE TABLE tbl_cart
( cart_no            NUMBER          NOT NULL        /* ?₯λ°κ΅¬?λ²νΈ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, fk_prod_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, cart_prodcount     NUMBER          NOT NULL        /* ?? ?? */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_cart_cart_no      PRIMARY KEY (cart_no)
, CONSTRAINT FK_tbl_cart_fk_user_no   FOREIGN KEY (fk_user_no)   REFERENCES tbl_member(user_no)
, CONSTRAINT FK_tbl_cart_fk_prod_no   FOREIGN KEY (fk_prod_no)   REFERENCES tbl_products(prod_no)
);
-- Table TBL_CART created.


COMMENT ON TABLE tbl_cart IS '?₯λ°κ΅¬?? ?΄?? ?? ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_cart.cart_no IS '?₯λ°κ΅¬? λ²νΈ';

COMMENT ON COLUMN tbl_cart.fk_user_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_cart.fk_prod_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_cart.cart_prodcount IS '?? ??';



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
/* ?₯λ°κ΅¬? ??΄λΈ? ? */










/* κ³΅μ??¬?­ ??΄λΈ? ??± ?? */
CREATE TABLE tbl_notice
( notice_no          NUMBER          NOT NULL        /* κ³΅μ??¬?­λ²νΈ */
, notice_title       NVARCHAR2(100)  NOT NULL        /* κ³΅μ??¬?­? λͺ? */
, notice_contents    NVARCHAR2(200)  NOT NULL        /* κ³΅μ??¬?­?΄?© */
, notice_regidate    DATE   DEFAULT SYSDATE          /* κ³΅μ??¬?­ ??±?Ό? */
, notice_status      NUMBER(1)     DEFAULT 1         /* κ²μκΈ? ?? (0: ?­? , 1:κ²μμ€?) */
, notice_viewcount   NUMBER        DEFAULT 0         /* κ³΅μ??¬?­ μ‘°ν? */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_notice_notice_no      PRIMARY KEY (notice_no)
, CONSTRAINT CK_tbl_notice_notice_status  CHECK (notice_status IN (0, 1))
);
-- Table TBL_NOTICE created.


COMMENT ON TABLE tbl_notice IS 'κ³΅μ??¬?­ κΈ? ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_notice.notice_no IS 'κ³΅μ??¬?­ λ²νΈ';

COMMENT ON COLUMN tbl_notice.notice_title IS 'κ³΅μ??¬?­ ? λͺ?';

COMMENT ON COLUMN tbl_notice.notice_contents IS 'κ³΅μ??¬?­ ?΄?©';

COMMENT ON COLUMN tbl_notice.notice_regidate IS 'κ³΅μ??¬?­ ?±λ‘μΌ?';

COMMENT ON COLUMN tbl_notice.notice_status IS 'κ³΅μ??¬?­ κΈ? ?? (0: ?­? , 1:κ²μμ€?)';

COMMENT ON COLUMN tbl_notice.notice_viewcount IS 'κ³΅μ??¬?­ μ‘°ν?';


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
/* κ³΅μ??¬?­ ??΄λΈ? ? */










/* ?μ£Όν?μ§λ¬Έ ??΄λΈ? ??± ?? */
CREATE TABLE tbl_faq
( faq_no             NUMBER          NOT NULL        /* ?μ£Όν?μ§λ¬Έ λ²νΈ */
, faq_title          NVARCHAR2(100)  NOT NULL        /* ?μ£Όν?μ§λ¬Έ ? λͺ? */
, faq_contents       NVARCHAR2(200)  NOT NULL        /* ?μ£Όν?μ§λ¬Έ ?΄?© */
, faq_regidate       DATE   DEFAULT SYSDATE          /* ?μ£Όν?μ§λ¬Έ ??±?Ό? */
, faq_status         NUMBER(1)     DEFAULT 1         /* ?μ£Όν?μ§λ¬Έ ?? (0: ?­? , 1:κ²μμ€?) */
, faq_viewcount      NUMBER        DEFAULT 0         /* ?μ£Όν?μ§λ¬Έ μ‘°ν? */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_faqe_faq_no     PRIMARY KEY (faq_no)
, CONSTRAINT CK_tbl_faq_faq_status  CHECK (faq_status IN (0, 1))
);
-- Table TBL_FAQ created.


COMMENT ON TABLE tbl_faq IS '?μ£Όν?μ§λ¬Έ κΈ? ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_faq.faq_no IS '?μ£Όν?μ§λ¬Έ κΈ? λ²νΈ';

COMMENT ON COLUMN tbl_faq.faq_title IS '?μ£Όν?μ§λ¬Έ κΈ? ? λͺ?';

COMMENT ON COLUMN tbl_faq.faq_contents IS '?μ£Όν?μ§λ¬Έ κΈ? ?΄?©';

COMMENT ON COLUMN tbl_faq.faq_regidate IS '?μ£Όν?μ§λ¬Έ κΈ? ?±λ‘μΌ?';

COMMENT ON COLUMN tbl_faq.faq_status IS '?μ£Όν?μ§λ¬Έ κΈ? ?? (0: ?­? , 1:κ²μμ€?)';

COMMENT ON COLUMN tbl_faq.faq_viewcount IS '?μ£Όν?μ§λ¬Έ κΈ? μ‘°ν?';


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
/* ?μ£Όν?μ§λ¬Έ ??΄λΈ? ? */









/* μΏ ν° ??΄λΈ? ??± ?? */
CREATE TABLE tbl_coupons
( coupon_no          NUMBER          NOT NULL        /* μΏ ν°λ²νΈ */
, fk_user_no         NUMBER          NOT NULL        /* ??λ²νΈ */
, coupon_name        VARCHAR2(50)    NOT NULL        /* μΏ ν°λͺ? */
, coupon_descript    VARCHAR2(50)    NOT NULL        /* μΏ ν°?€λͺ? */
, coupon_expire      DATE            NOT NULL        /* μΏ ν° λ§λ£?Ό? */
, coupon_discount    NUMBER          NOT NULL        /* ? ?ΈκΈμ‘ */


/* ? ?½μ‘°κ±΄ */
, CONSTRAINT PK_tbl_coupons_coupon_no   PRIMARY KEY (coupon_no)
, CONSTRAINT FK_tbl_coupons_fk_user_no  FOREIGN KEY (fk_user_no)  REFERENCES tbl_member(user_no)
);
-- Table TBL_COUPONS created.


COMMENT ON TABLE tbl_coupons IS 'μΏ ν° ? λ³΄κ? ?΄κΈ? ??΄λΈ?';

COMMENT ON COLUMN tbl_coupons.coupon_no IS 'μΏ ν° λ²νΈ';

COMMENT ON COLUMN tbl_coupons.fk_user_no IS '?? λ²νΈ';

COMMENT ON COLUMN tbl_coupons.coupon_name IS 'μΏ ν°λͺ?';

COMMENT ON COLUMN tbl_coupons.coupon_descript IS 'μΏ ν° ?€λͺ?';

COMMENT ON COLUMN tbl_coupons.coupon_expire IS 'μΏ ν° λ§λ£ ?Ό?';

COMMENT ON COLUMN tbl_coupons.coupon_discount IS '? ?Έ κΈμ‘';


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
/* μΏ ν° ??΄λΈ? ? */

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
