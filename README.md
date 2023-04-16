# egrad_web

CREATE TABLE egrad_user (
   userid NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(50),
    email VARCHAR2(50),
    pwd VARCHAR2(30),
    age NUMBER(2),
    gender varchar2(1),
    clg_addr VARCHAR2(300),
    branch VARCHAR2(5),
    skills VARCHAR2(10)
  );



CREATE TABLE egrad_exam( 
    SUB VARCHAR2(5), 
    QNO NUMERIC(2), 
    QUESTION VARCHAR2(350), 
    OP_1 VARCHAR2(100), 
    OP_2 VARCHAR2(100), 
    OP_3 VARCHAR2(100), 
    OP_4 VARCHAR2(100), 
    ANS VARCHAR2(100), 
    CONSTRAINT PK_QUIZ PRIMARY KEY (SUB,QNO)
);


CREATE TABLE egrad_post(
    user_id numeric(4),
    user_name varchar2(50),
    post_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR2(200),
    content VARCHAR2(1700)
);

CREATE TABLE egrad_post_reply(
    user_name varchar2(50),
    post_id numeric(4),
    content VARCHAR2(700)
);
