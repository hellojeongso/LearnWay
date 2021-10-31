package com.webrtc.biz;

import java.util.Map;

import com.webrtc.dao.WebrtcDao;
import com.webrtc.dto.WebrtcDto;

public class WebrtcBiz {
	private WebrtcDao dao = new WebrtcDao();
	
	public String selectOne(String class_title) {
		return dao.selectOne(class_title);
	}
	
	public int insert(WebrtcDto dto) {
		return dao.insert(dto);
	}
	
	public int update(Map map) {
		return dao.update(map);
	}
	
}

