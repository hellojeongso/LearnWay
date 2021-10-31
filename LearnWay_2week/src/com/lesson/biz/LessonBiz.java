package com.lesson.biz;

import java.util.List;

import com.lesson.dao.LessonDao;
import com.lesson.dto.LessonDto;

public class LessonBiz {

	
	private LessonDao dao = new LessonDao();
	
	public List<LessonDto> selectList(){
		return dao.selectList();	
	}
	
	
	////////////////////////////////////////////
	
	public List<LessonDto> eventList(){
		return dao.eventList();
	}
	
	public List<LessonDto> viewList(){
		return dao.viewList();
	}
	
	public List<LessonDto> classSearch(String text){
		return dao.classSearch(text);
	}
	
	////////////////////////////////////////////////
	
	
	
   public List<LessonDto> select_tchlist(String class_writer){
	   
	   return dao.select_tchlist(class_writer);
   }
   
   
   public List<LessonDto> classList(int class_tag){
	   return dao.classList(class_tag);
   }

	public LessonDto selectOne(int class_no) {		
		return dao.selectOne(class_no);			
	}
	
	
	
	
	public int insert(LessonDto dto) {
		if(dto.getClass_eventprice() < 0 ){
			dto.setClass_eventprice(0);
		}
		return dao.insert(dto);
		

	}
	
	public int update(LessonDto dto) {
		return dao.update(dto);
	}
	
	public int viewupdate(String title) {
		return dao.viewupdate(title);
	}
	
	public int delete(int class_no) {
		return dao.delete(class_no);
	}
}
