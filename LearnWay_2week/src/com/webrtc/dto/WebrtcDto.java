package com.webrtc.dto;

public class WebrtcDto {
	private String class_title;
	private String webrtc_link;
	
	public WebrtcDto() {
		// TODO Auto-generated constructor stub
	}

	public WebrtcDto(String class_title, String webrtc_link) {
		this.class_title = class_title;
		this.webrtc_link = webrtc_link;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	public String getWebrtc_link() {
		return webrtc_link;
	}

	public void setWebrtc_link(String webrtc_link) {
		this.webrtc_link = webrtc_link;
	}
	
	
	
}
