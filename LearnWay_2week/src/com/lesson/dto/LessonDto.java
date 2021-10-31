package com.lesson.dto;

import java.util.Date;

public class LessonDto {
	private int class_no;
	private String class_title;
	private String class_writer;
	private String class_content;
	private int class_price;
	private int class_count;
	private Date class_startdate;
	private Date class_lastdate;
	private String class_tag;
	private int class_eventcheck;
	private int class_eventprice;
	private Date class_eventstartdate;
	private Date class_eventlastdate;
	private int class_view;
	
	public LessonDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LessonDto(int class_no, String class_title, String class_writer, String class_content, int class_price,
			int class_count, Date class_startdate, Date class_lastdate, String class_tag, int class_eventcheck,
			int class_eventprice, Date class_eventstartdate, Date class_eventlastdate, int class_view) {
		super();
		this.class_no = class_no;
		this.class_title = class_title;
		this.class_writer = class_writer;
		this.class_content = class_content;
		this.class_price = class_price;
		this.class_count = class_count;
		this.class_startdate = class_startdate;
		this.class_lastdate = class_lastdate;
		this.class_tag = class_tag;
		this.class_eventcheck = class_eventcheck;
		this.class_eventprice = class_eventprice;
		this.class_eventstartdate = class_eventstartdate;
		this.class_eventlastdate = class_eventlastdate;
		this.class_view = class_view;
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

	public String getClass_content() {
		return class_content;
	}

	public void setClass_content(String class_content) {
		this.class_content = class_content;
	}

	public int getClass_price() {
		return class_price;
	}

	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}

	public int getClass_count() {
		return class_count;
	}

	public void setClass_count(int class_count) {
		this.class_count = class_count;
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

	public String getClass_tag() {
		return class_tag;
	}

	public void setClass_tag(String class_tag) {
		this.class_tag = class_tag;
	}

	public int getClass_eventcheck() {
		return class_eventcheck;
	}

	public void setClass_eventcheck(int class_eventcheck) {
		this.class_eventcheck = class_eventcheck;
	}

	public int getClass_eventprice() {
		return class_eventprice;
	}

	public void setClass_eventprice(int class_eventprice) {
		this.class_eventprice = class_eventprice;
	}

	public Date getClass_eventstartdate() {
		return class_eventstartdate;
	}

	public void setClass_eventstartdate(Date class_eventstartdate) {
		this.class_eventstartdate = class_eventstartdate;
	}

	public Date getClass_eventlastdate() {
		return class_eventlastdate;
	}

	public void setClass_eventlastdate(Date class_eventlastdate) {
		this.class_eventlastdate = class_eventlastdate;
	}

	public int getClass_view() {
		return class_view;
	}

	public void setClass_view(int class_view) {
		this.class_view = class_view;
	}
	
	
	
	
	}
