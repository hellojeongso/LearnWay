package com.login.dao;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;

import com.login.dto.LoginDto;

public class LoginDao extends SqlMapConfig {
	
	private String namespace = "com.login.mapper.";
	
	public List<LoginDto> selectList(){
		
		SqlSession session = getSessionFactory().openSession();
		List<LoginDto> list = session.selectList("com.login.mapper."+"selectList");
		
		session.close();
		return list;
	}
	
	public List<LoginDto> mapList(){
		
		SqlSession session = getSessionFactory().openSession();
		List<LoginDto> list = session.selectList("com.login.mapper."+"mapList");
		
		session.close();
		return list;
	}
	
	
	public int insert(LoginDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSessionFactory().openSession(true)){
			
			if (dto.getMember_platform() == null){
				res = session.insert(namespace+"insert",dto);
			} else {
				res = session.insert(namespace+"insert2",dto);
			}
			
		} 
		
		
		
		return res;
	}
	


	
	
	public int  update(LoginDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSessionFactory().openSession(true)){
			res = session.insert(namespace+"update",dto);
			
		}
		
		return res;
	}

	
	public int delete(int member_no) {
		
		int res = 0;
		
		try(SqlSession session = getSessionFactory().openSession(true)){
			res = session.delete(namespace+"delete",member_no);
			
		}
		
		return res;
		
		
	}
	
	public String findId(Map map) {
		SqlSession session = null;
		String findid = null;
		
		session = getSessionFactory().openSession();
		findid = session.selectOne(namespace+"findid",map);
		
		session.close();
		
		return findid;
	}
	public String findPw(Map map) {
		SqlSession session = null;
		String findpw = null;
		
		session = getSessionFactory().openSession();
		findpw = session.selectOne(namespace+"findpw",map);
		
		session.close();
		
		return findpw;
	}
	
	public String idCheck(String member_id) {
		SqlSession session = null;
		String id = null;
		
		session = getSessionFactory().openSession();
		id = session.selectOne(namespace+"idcheck",member_id);
		session.close();
		
		return id;
		
	}
	
	public LoginDto login(Map map) {
		
		SqlSession session = null;
		LoginDto login = null;
		
		session = getSessionFactory().openSession();
		login = session.selectOne(namespace+"login",map);
		
		session.close();
		return login;
		
	}
	
	public Integer loginCheck(Map map) { 
		
		SqlSession session = null;
		Integer check = null;
		
		session = getSessionFactory().openSession();
		check = session.selectOne(namespace+"loginCheck",map);
		
		session.close();
		return check;
	}
	
	
	
	public String selectCheck(String member_id) {
		SqlSession session = null;
		String id = null;
		
		session = getSessionFactory().openSession();
		id = session.selectOne(namespace+"selectcheck",member_id);
		session.close();
		
		return id;
		
	}
	
	public LoginDto mypageView(String member_id) {
		SqlSession session = null;
		LoginDto dto = null;
		
		session = getSessionFactory().openSession();
		
		dto = session.selectOne(namespace+"mypageView", member_id);
		session.close();
		
		return dto;
	}
	
	
	//마이 페이지
	
	public int memberdel(String member_id) {
		SqlSession session = null;
		int res = 0;
		
		session = getSessionFactory().openSession();
		res = session.update(namespace+"memberdel",member_id);
		
		session.commit();
		
		session.close();
		
		return res;
	}
	
	public int mypageupdate(Map map) {
		SqlSession session = null;
		int res = 0;
		
		session = getSessionFactory().openSession();
		res = session.update(namespace+"mypageupdate",map);
		
		session.commit();
		
		session.close();
		
		return res;
	}

//     네이버.
	    public String selectone(String email, String platform) {
		SqlSession session = null;
		String res = null;
		
		Map map = new HashMap();  
		map.put("email", email);
		map.put("platform",platform);
		
		session = getSessionFactory().openSession();
		res = session.selectOne(namespace+"selectone", map);
		
		session.commit();
		session.close();
		
		return res;
	}
}


