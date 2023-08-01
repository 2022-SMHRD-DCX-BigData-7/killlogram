package com.smhrd.domain;

public class CommentVO {


	private int cmt_idx;
	private int post_idx;
	private String cmt_content;
	private String created_at;
	
	public CommentVO(int post_idx, String cmt_content, String user_id) {
		super();
		this.post_idx = post_idx;
		this.cmt_content = cmt_content;
		this.user_id = user_id;
	}

	private String user_id;

	public CommentVO(String cmt_content, String user_id) {
		super();
		this.cmt_content = cmt_content;
		this.user_id = user_id;
	}
	
	public int getCmt_idx() {
		return cmt_idx;
	}

	public void setCmt_idx(int cmt_idx) {
		this.cmt_idx = cmt_idx;
	}

	public int getPost_idx() {
		return post_idx;
	}

	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	public CommentVO(int cmt_idx, int post_idx, String cmt_content, String created_at, String user_id) {
		super();
		this.cmt_idx = cmt_idx;
		this.post_idx = post_idx;
		this.cmt_content = cmt_content;
		this.created_at = created_at;
		this.user_id = user_id;
	}

	public CommentVO() {
		super();
	}
	
	
}
