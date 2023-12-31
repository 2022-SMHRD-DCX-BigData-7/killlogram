package com.smhrd.domain;

public class KilllogramVO {

	
	private String id;
	private String password;
	private String name;
	private String nick;
	

	public KilllogramVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	
	
	public KilllogramVO(String id, String password, String nick) {
		super();
		this.id = id;
		this.password = password;
		this.nick = nick;
	}
	
	public KilllogramVO(String id, String password, String name, String nick) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nick = nick;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNick() {
		return nick;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}
	

	
}
