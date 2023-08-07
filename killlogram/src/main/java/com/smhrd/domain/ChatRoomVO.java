package com.smhrd.domain;

import java.sql.Date;

public class ChatRoomVO {
	private int cr_idx;
	private String cr_title;
	private String cr_info;
	private int cr_limit;
	private String user_id;
	private Date created_at;
	private String cr_status;
	private int chat_pw;	
		
	public ChatRoomVO() {
		super();
	}

	public ChatRoomVO(int cr_idx, String cr_title, String cr_info, int cr_limit, String user_id, Date created_at,
			int chat_pw) {
		super();
		this.cr_idx = cr_idx;
		this.cr_title = cr_title;
		this.cr_info = cr_info;
		this.cr_limit = cr_limit;
		this.user_id = user_id;
		this.created_at = created_at;
		this.chat_pw = chat_pw;
	}


	public ChatRoomVO(int cr_idx, String cr_title, String cr_info, int cr_limit, String user_id, Date created_at,
			String cr_status, int chat_pw) {
		super();
		this.cr_idx = cr_idx;
		this.cr_title = cr_title;
		this.cr_info = cr_info;
		this.cr_limit = cr_limit;
		this.user_id = user_id;
		this.created_at = created_at;
		this.cr_status = cr_status;
		this.chat_pw = chat_pw;
	}

	public int getCr_idx() {
		return cr_idx;
	}

	public void setCr_idx(int cr_idx) {
		this.cr_idx = cr_idx;
	}

	public String getCr_title() {
		return cr_title;
	}

	public void setCr_title(String cr_title) {
		this.cr_title = cr_title;
	}

	public String getCr_info() {
		return cr_info;
	}

	public void setCr_info(String cr_info) {
		this.cr_info = cr_info;
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

	public String getCr_status() {
		return cr_status;
	}

	public void setCr_status(String cr_status) {
		this.cr_status = cr_status;
	}

	public int getChat_pw() {
		return chat_pw;
	}

	public void setChat_pw(int chat_pw) {
		this.chat_pw = chat_pw;
	}

	
	
}
