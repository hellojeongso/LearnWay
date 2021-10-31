package com.lesson.dao;
import java.util.List;
import java.util.Date;
import org.apache.ibatis.session.SqlSession;

import com.lesson.dto.LessonDto;

import oracle.sql.DATE;

public class LessonDao extends SqlMapConfig{

	private String namespace = "com.lesson.mapper.";

	
	
	
	public List<LessonDto> selectList(){
		SqlSession session = getSessionFactory().openSession();
        List<LessonDto> list = session.selectList("com.lesson.mapper."+"selectList");
		
        session.close();
        return list;
	}
	
	//이벤트 강의 리스트
	public List<LessonDto> eventList(){
		SqlSession session = getSessionFactory().openSession();
        List<LessonDto> list = session.selectList("com.lesson.mapper."+"eventList");
		
        session.close();
        return list;
	}
	
	//인기 강의 리스트
	public List<LessonDto> viewList(){
		SqlSession session = getSessionFactory().openSession();
        List<LessonDto> list = session.selectList("com.lesson.mapper."+"viewList");
		
        session.close();
        return list;
	}
	
	//선생 강의 리스트	
	public List<LessonDto> select_tchlist(String class_writer){
		
		SqlSession session = getSessionFactory().openSession();    
		List<LessonDto> list = session.selectList(namespace + "select_tchlist", class_writer); 
		                           
		return list;
		
	}
	
	public List<LessonDto> classSearch(String text){
		SqlSession session = getSessionFactory().openSession();    
		List<LessonDto> list = session.selectList(namespace + "classSearch", text); 
		                           
		return list;
	}

	//각 클래스별 강의 리스트
	public List<LessonDto> classList(int class_tag){
		SqlSession session = getSessionFactory().openSession();
        List<LessonDto> list = session.selectList("com.lesson.mapper."+"classList",class_tag);
		
        session.close();
        return list;
	}
	
	//selectOne
	public LessonDto selectOne(int no) {
		SqlSession session = null;
		LessonDto dto = null;
		try {
			session = getSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectOne", no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}
	
	//insert
	
	
	public int insert(LessonDto dto) {
		int res = 0;

		try(SqlSession session = getSessionFactory().openSession(true)){

			res = session.insert(namespace+"insert",dto);	
		}	
		return res;
	}
	
	//update
	public int update(LessonDto dto) {
		int res = 0;

		try(SqlSession session = getSessionFactory().openSession(true)){
			res = session.update(namespace+"update",dto);	
		}	
		return res;
	}
	
	public int viewupdate(String title) {
		int res = 0;

		try(SqlSession session = getSessionFactory().openSession(true)){
			res = session.update(namespace+"viewupdate",title);	
		}	
		return res;
	}
	
	
	//delete
	public int delete(int class_no) {
		int res = 0;

		try(SqlSession session = getSessionFactory().openSession(true)){
			res = session.update(namespace+"delete",class_no);	
		}
		return res;
	}
}
