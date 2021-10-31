package com.myclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.myclass.dto.MyclassDto;

public class MyclassDao extends SqlMapConfig{
	private String namespace = "com.myclass.mapper.";
	
	public List<MyclassDto> myclassList(String member_id){
		SqlSession session = getSessionFactory().openSession();
		List<MyclassDto> list = session.selectList(namespace+"myclassList", member_id);
		session.close();
		
		return list;
	}
	
	public String sugang(Map map) {
		SqlSession session = null;
		String sugang = null;
		
		session = getSessionFactory().openSession();
		sugang = session.selectOne(namespace+"sugang", map);
		
		session.close();
		
		return sugang;
	}
	
	
	public int myclassInsert(MyclassDto dto) {
		int res = 0;

		try(SqlSession session = getSessionFactory().openSession(true)){

			res = session.insert(namespace+"myclassInsert", dto);
		}	
		return res;
		
	}

}
