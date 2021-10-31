package com.myclass.dto;

import java.util.Date;

public class MyclassDto {

	private int myclass_no;
	private int class_no;
	private String class_title;
	private String class_writer;
	private Date class_startdate;
	private Date class_lastdate;
	private String member_id;
	
	public MyclassDto() {
		// TODO Auto-generated constructor stub
	}

	public MyclassDto(int myclass_no, int class_no, String class_title, String class_writer, Date class_startdate,
			Date class_lastdate, String member_id) {
		this.myclass_no = myclass_no;
		this.class_no = class_no;
		this.class_title = class_title;
		this.class_writer = class_writer;
		this.class_startdate = class_startdate;
		this.class_lastdate = class_lastdate;
		this.member_id = member_id;
	}

	public int getMyclass_no() {
		return myclass_no;
	}

	public void setMyclass_no(int myclass_no) {
		this.myclass_no = myclass_no;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	public String getClass_writer() {
		return class_writer;
	}

	public void setClass_writer(String class_writer) {
		this.class_writer = class_writer;
	}

	public Date getClass_startdate() {
		return class_startdate;
	}

	public void setClass_startdate(Date class_startdate) {
		this.class_startdate = class_startdate;
	}

	public Date getClass_lastdate() {
		return class_lastdate;
	}

	public void setClass_lastdate(Date class_lastdate) {
		this.class_lastdate = class_lastdate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	
	
}
