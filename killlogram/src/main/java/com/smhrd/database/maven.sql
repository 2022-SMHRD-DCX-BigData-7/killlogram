


CREATE TABLE post_info
(
    post_idx        NUMBER(18, 0)     NOT NULL, 
    post_title      VARCHAR2(500)     NOT NULL, 
    post_content    VARCHAR2(4000)    NULL, 
    user_id         VARCHAR2(20)      NOT NULL, 
    created_at      DATE              NOT NULL, 
    post_file       VARCHAR2(500)     NULL, 
    post_likes      NUMBER(18, 0)     NOT NULL, 
     PRIMARY KEY (post_idx)
);

alter table post_info drop column post_views;

select * from post_info;

create sequence num_post increment by 1 start with 1;

drop triger 
drop sequence num_post;

delete from post_info;

ALTER TABLE post_info ALTER COLUMN post_file VARCHAR2(500) NULL;

select * from post_info;

ALTER SEQUENCE post_info_SEQ INCREMENT START WITH 0 BY 1; 

insert into post_info(post_idx, post_title, post_content, user_id, created_at, post_file, post_likes) values
(post_info_SEQ.nextval ,'다이어트 오늘부터 시작!!', '#다이어트 #시작', '55', sysdate, null, 3);

delete from post_info;

DROP TRIGGER post_info_AI_TRG; 

DROP SEQUENCE post_info_SEQ; 

-- Auto Increment를 위한 Sequence 추가 SQL - post_info.post_idx
CREATE SEQUENCE post_info_SEQ
START WITH 0
MINVALUE 0
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - post_info.post_idx
CREATE OR REPLACE TRIGGER post_info_AI_TRG
BEFORE INSERT ON post_info 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT post_info_SEQ.NEXTVAL
    INTO :NEW.post_idx
    FROM DUAL
END

commit;