package com.webrtc.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.webrtc.dto.WebrtcDto;

public class WebrtcDao extends SqlMapConfig {
	private String namespace = "com.webrtc.mapper.";
	
	public String selectOne(String class_title) {
		
		SqlSession session = null;
		String link = null;
		
		session=getSessionFactory().openSession();
		link = session.selectOne(namespace+"selectOne", class_title);
		
		
		return link;
	}
	
	
	public int insert(WebrtcDto dto) {
		
		int res = 0;

		try(SqlSession session = getSessionFactory().openSession(true)){

			res = session.insert(namespace+"webrtcinsert",dto);	
		}	
		return res;
		
		
	}
	
	public int update(Map map) {
		
		int res = 0;

		try(SqlSession session = getSessionFactory().openSession(true)){

			res = session.update(namespace+"webrtcupdate",map);	
		}	
		return res;
		
	}
	
}
