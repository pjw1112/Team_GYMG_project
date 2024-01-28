package com.dto.hwan;

public class RestLikeDto {
	private int rest_like_no;
	private int user_no;
	private int rest_no;
	public RestLikeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestLikeDto(int rest_like_no, int user_no, int rest_no) {
		super();
		this.rest_like_no = rest_like_no;
		this.user_no = user_no;
		this.rest_no = rest_no;
	}
	@Override
	public String toString() {
		return "RestLikeDto [rest_like_no=" + rest_like_no + ", user_no=" + user_no + ", rest_no=" + rest_no + "]";
	}
	public int getRest_like_no() {
		return rest_like_no;
	}
	public void setRest_like_no(int rest_like_no) {
		this.rest_like_no = rest_like_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getRest_no() {
		return rest_no;
	}
	public void setRest_no(int rest_no) {
		this.rest_no = rest_no;
	}
	
	
}
