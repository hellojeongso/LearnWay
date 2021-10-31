package com.adminPage.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.adminPage.dto.adminPageDto;
import com.adminPage.dto.learnDto;

public class adminListDao extends SqlMapConfig {

	public List<adminPageDto> selectList(){
		
		SqlSession session = getSessionFactory().openSession();
		List<adminPageDto> list = session.selectList("com.member.mapper."+"selectList");
		
		session.close();
		return list;
	}
	
	public List<learnDto> learnList(){
		SqlSession session = getSessionFactory().openSession();
		List<learnDto> list = session.selectList("com.member.mapper."+"learnList");

		session.close();
		return list;
	}
	
	public int adminCheck(String member_id) {
		
		SqlSession session = getSessionFactory().openSession();
		int member_select = session.selectOne("com.member.mapper." + "adminCheck", member_id);
		session.close();
		return member_select;
	}
}
