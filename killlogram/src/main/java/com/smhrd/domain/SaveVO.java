package com.smhrd.domain;

public class SaveVO {

	private int save_idx;
	private int post_idx;
	private String user_id;
	private String created_at;

	public SaveVO(int save_idx, int post_idx, String user_id, String created_at) {
		super();
		this.save_idx = save_idx;
		this.post_idx = post_idx;
		this.user_id = user_id;
		this.created_at = created_at;
	}

	public SaveVO(int post_idx, String user_id) {
		super();
		this.post_idx = post_idx;
		this.user_id = user_id;
	}

	public int getSave_idx() {
		return save_idx;
	}

	public void setSave_idx(int save_idx) {
		this.save_idx = save_idx;
	}

	public int getPost_idx() {
		return post_idx;
	}

	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}


	
}
