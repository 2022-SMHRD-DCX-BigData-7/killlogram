package com.smhrd.domain;

public class PostVO {

	private int post_idx;
	private String post_title;
	private String post_content;
	private String user_id;
	private String created_at;
	private String post_file;
	private int post_likes;


	public PostVO(String post_title, String post_content, String user_id, String post_file) {
		super();
		this.post_title = post_title ;
		this.post_content = post_content;
		this.user_id = user_id;
		this.post_file = post_file;
	}
	public PostVO(int post_idx, String post_title, String post_content, String user_id, String created_at,
			String post_file, int post_likes) {
		super();
		this.post_idx = post_idx;
		this.post_title = post_title;
		this.post_content = post_content;
		this.user_id = user_id;
		this.created_at = created_at;
		this.post_file = post_file;
		this.post_likes = post_likes;
		
	}
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
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
	public String getPost_file() {
		return post_file;
	}
	public void setPost_file(String post_file) {
		this.post_file = post_file;
	}
	public int getPost_likes() {
		return post_likes;
	}
	public void setPost_likes(int post_likes) {
		this.post_likes = post_likes;
	}
	
	@Override
	public String toString() {
		return "PostVO [post_idx=" + post_idx + ", post_title=" + post_title + ", post_content=" + post_content
				+ ", user_id=" + user_id + ", created_at=" + created_at + ", post_file=" + post_file + ", post_likes="
				+ post_likes + "]";
	}
	
	public PostVO() {
		super();
	}
	
	
}