package com.smhrd.domain; 

import java.util.Date;

public class LikeVO {
    private int like_idx;
    private String user_id;
    private int post_idx;
    private Date created_at;

    // 생성자
    public LikeVO() {
    }

    public LikeVO(String user_id, int post_idx) {
		super();
		this.user_id = user_id;
		this.post_idx = post_idx;
	}

	public LikeVO(int like_idx, String user_id, int post_idx, Date created_at) {
        this.like_idx = like_idx;
        this.user_id = user_id;
        this.post_idx = post_idx;
        this.created_at = created_at;
    }

    // Getter와 Setter
    public int getLike_idx() {
        return like_idx;
    }

    public void setLike_idx(int like_idx) {
        this.like_idx = like_idx;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getPost_idx() {
        return post_idx;
    }

    public void setPost_idx(int post_idx) {
        this.post_idx = post_idx;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
