package com.smhrd.domain;

import java.sql.Date;

public class ChattingVO {
	private int chat_idx;
	private int cr_idx;
	private String talker;
	private String talk;
	private String emoticon;
	private Date created_at;
	private String chat_file;
	
	
	public ChattingVO() {
		super();
	}


	
	public ChattingVO(String talker, String talk) {
		super();
		this.talker = talker;
		this.talk = talk;
	}



	public ChattingVO(String talker, String talk, String emoticon, Date created_at, String chat_file) {
		super();
		this.talker = talker;
		this.talk = talk;
		this.emoticon = emoticon;
		this.created_at = created_at;
		this.chat_file = chat_file;
	}



	public ChattingVO(int chat_idx, int cr_idx, String talker, String talk, String emoticon, Date created_at,
			String chat_file) {
		super();
		this.chat_idx = chat_idx;
		this.cr_idx = cr_idx;
		this.talker = talker;
		this.talk = talk;
		this.emoticon = emoticon;
		this.created_at = created_at;
		this.chat_file = chat_file;
	}



	public int getChat_idx() {
		return chat_idx;
	}



	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
	}



	public int getCr_idx() {
		return cr_idx;
	}



	public void setCr_idx(int cr_idx) {
		this.cr_idx = cr_idx;
	}



	public String getTalker() {
		return talker;
	}



	public void setTalker(String talker) {
		this.talker = talker;
	}



	public String getTalk() {
		return talk;
	}



	public void setTalk(String talk) {
		this.talk = talk;
	}



	public String getEmoticon() {
		return emoticon;
	}



	public void setEmoticon(String emoticon) {
		this.emoticon = emoticon;
	}



	public Date getCreated_at() {
		return created_at;
	}



	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}



	public String getChat_file() {
		return chat_file;
	}



	public void setChat_file(String chat_file) {
		this.chat_file = chat_file;
	}
	
	
}
