package com.media.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.media.dto.MediaDto;

public class MediaDao extends SqlMapConfig {

	private String namespace = "com.media.mapper.";
	
	public List<MediaDto> videoList(String class_title){
		SqlSession session = getSessionFactory().openSession();
		List<MediaDto> list = session.selectList(namespace+"videoList",class_title);
		
		session.close();
		return list;
	}
	
	
	public MediaDto mediaOne(String class_title) {
		
		SqlSession session = null;
		MediaDto dto = null;
		
		 session=getSessionFactory().openSession();
		 dto = session.selectOne(namespace+"mediaOne", class_title);
		
		 session.close();
		
		return dto;
	}
	
	public int mediainsert(MediaDto dto) {
		
		int res = 0;

		try(SqlSession session = getSessionFactory().openSession(true)){

			res = session.insert(namespace+"mediainsert",dto);	
		}	
		return res;
		
	}
	
	
}
