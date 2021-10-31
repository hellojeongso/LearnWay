package com.login.dto;

import java.sql.Date;

public class LoginDto {
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_birth;
	private String member_platform;
	private String member_addr;
	private String member_phone;
	private String member_email;
	private String member_gender;
	private int member_select;
	private String member_question;
	private String member_answer;
	private int member_del;
	private Date member_regdate;
	
	
	
	
	public LoginDto() {

	}




	public LoginDto(int member_no, String member_id, String member_pw, String member_name, String member_birth,
			String member_platform, String member_addr, String member_phone, String member_email, String member_gender,
			int member_select, String member_question, String member_answer, int member_del, Date member_regdate) {
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_birth = member_birth;
		this.member_platform = member_platform;
		this.member_addr = member_addr;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_gender = member_gender;
		this.member_select = member_select;
		this.member_question = member_question;
		this.member_answer = member_answer;
		this.member_del = member_del;
		this.member_regdate = member_regdate;
	}
	
	public LoginDto(String member_id) {
		this.member_id = member_id;
	}

	public int getMember_no() {
		return member_no;
	}




	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}




	public String getMember_id() {
		return member_id;
	}




	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}




	public String getMember_pw() {
		return member_pw;
	}




	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}




	public String getMember_name() {
		return member_name;
	}




	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}




	public String getMember_birth() {
		return member_birth;
	}




	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}




	public String getMember_platform() {
		return member_platform;
	}




	public void setMember_platform(String member_platform) {
		this.member_platform = member_platform;
	}




	public String getMember_addr() {
		return member_addr;
	}




	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}




	public String getMember_phone() {
		return member_phone;
	}




	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}




	public String getMember_email() {
		return member_email;
	}




	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}




	public String getMember_gender() {
		return member_gender;
	}




	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}




	public int getMember_select() {
		return member_select;
	}




	public void setMember_select(int member_select) {
		this.member_select = member_select;
	}




	public String getMember_question() {
		return member_question;
	}




	public void setMember_question(String member_question) {
		this.member_question = member_question;
	}




	public String getMember_answer() {
		return member_answer;
	}




	public void setMember_answer(String member_answer) {
		this.member_answer = member_answer;
	}




	public int getMember_del() {
		return member_del;
	}




	public void setMember_del(int member_del) {
		this.member_del = member_del;
	}




	public Date getMember_regdate() {
		return member_regdate;
	}




	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	
	
}