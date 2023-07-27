


CREATE TABLE post_info
(
    post_idx        NUMBER(18, 0)     NOT NULL, 
    post_title      VARCHAR2(500)     NOT NULL, 
    post_content    VARCHAR2(4000)    NULL, 
    user_id         VARCHAR2(20)      NOT NULL, 
    created_at      DATE              NOT NULL, 
    post_file       VARCHAR2(500)     NULL, 
    post_views      NUMBER(18, 0)     NOT NULL, 
    post_likes      NUMBER(18, 0)     NOT NULL, 
     PRIMARY KEY (post_idx)
);


create sequence num_post increment by 1 start with 1;


select * from post_info;

insert into post_info(post_idx, post_title, post_content, user_id, created_at, post_file, post_views, post_likes) values
(num_post.nextval, '점심은 샐러드로~', '#다이어트 #시작', '33', sysdate, null, 5, 3);

delete from post_info;


commit;