package com.smhrd.domain;

import java.util.Date;

public class ChatRoomVO {
	private int cr_idx;
	private int cr_limit;
	private String user_id;
	private Date created_at;	
	
	public ChatRoomVO() {
		super();
	}


	public ChatRoomVO(int cr_idx, int cr_limit, String user_id, Date created_at) {
		super();
		this.cr_idx = cr_idx;
		this.cr_limit = cr_limit;
		this.user_id = user_id;
		this.created_at = created_at;
	}


	public int getCr_idx() {
		return cr_idx;
	}


	public void setCr_idx(int cr_idx) {
		this.cr_idx = cr_idx;
	}


	public int getCr_limit() {
		return cr_limit;
	}


	public void setCr_limit(int cr_limit) {
		this.cr_limit = cr_limit;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
}
