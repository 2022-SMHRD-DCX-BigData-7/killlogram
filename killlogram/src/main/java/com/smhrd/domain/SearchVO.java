package com.smhrd.domain;

import java.util.List;

public class SearchVO {
	
	private int post_idx;
	private String post_title;
	private String post_content;
	private String user_id;
	private String created_at;
	private String post_file;
	private int post_views;
	private int post_likes;
	
    private String keyword;
    private List<String> searchResults;
    
    
    
    public SearchVO(String post_title, String post_content, String user_id) {
		super();
		this.post_title = post_title;
		this.post_content = post_content;
		this.user_id = user_id;
	}



	public SearchVO(int post_idx, String post_title, String post_content, String user_id, String created_at,
			String post_file, int post_views, int post_likes, String keyword, List<String> searchResults) {
		super();
		this.post_idx = post_idx;
		this.post_title = post_title;
		this.post_content = post_content;
		this.user_id = user_id;
		this.created_at = created_at;
		this.post_file = post_file;
		this.post_views = post_views;
		this.post_likes = post_likes;
		this.keyword = keyword;
		this.searchResults = searchResults;
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



	public int getPost_views() {
		return post_views;
	}



	public void setPost_views(int post_views) {
		this.post_views = post_views;
	}



	public int getPost_likes() {
		return post_likes;
	}



	public void setPost_likes(int post_likes) {
		this.post_likes = post_likes;
	}



	public String getKeyword() {
		return keyword;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	public List<String> getsearchResults() {
		return searchResults;
	}



	public void setsearchResults(List<String> searchResults) {
		this.searchResults = searchResults;
	}

    
	/*
	 * public SearchVO(String keyword, List<String> searchResults) { this.keyword =
	 * keyword; this.searchResults = searchResults; }
	 * 
	 * public String getKeyword() { return keyword; }
	 * 
	 * public List<String> getsearchResults() { return searchResults; }
	 */
}
