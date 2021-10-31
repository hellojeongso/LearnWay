package com.media.dto;

public class MediaDto {
	private int media_no;
	private String class_title;
	private String media_extension;
	private String media_path;
	
	public MediaDto() {
		// TODO Auto-generated constructor stub
	}

	public MediaDto(int media_no, String class_title, String media_extension, String media_path) {
		this.media_no = media_no;
		this.class_title = class_title;
		this.media_extension = media_extension;
		this.media_path = media_path;
	}

	public int getMedia_no() {
		return media_no;
	}

	public void setMedia_no(int media_no) {
		this.media_no = media_no;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	public String getMedia_extension() {
		return media_extension;
	}

	public void setMedia_extension(String media_extension) {
		this.media_extension = media_extension;
	}

	public String getMedia_path() {
		return media_path;
	}

	public void setMedia_path(String media_path) {
		this.media_path = media_path;
	}
	
	
	
}
