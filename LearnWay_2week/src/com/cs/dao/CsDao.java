package com.cs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.cs.dto.CsDto;

public class CsDao extends SqlMapConfig{

	private String namespace = "com.cs.mapper.";
	
	public List<CsDto> selectList(){
		
		SqlSession session = getSqlSessionFactory().openSession();
		List<CsDto> list = session.selectList(namespace + "selectList");
		session.close();
		
		return list;				
	}
	
	
	public int insert(CsDto dto) {
		int res = 0;
		
		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.insert(namespace + "insert", dto);
		}
		return res;
	}
	
	public CsDto selectOne(int board_no) {
		SqlSession session = null;
		CsDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "selectOne", board_no); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}
	
	public int update(int board_no, String board_content, String board_title) {
		
		Map map = new HashMap();
		map.put("item1", board_no);
		map.put("item2", board_title);
		map.put("item3", board_content);
		
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.update(namespace + "update", map);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
		
	}
	
	
	public int delete(int board_no) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.delete(namespace+"delete", board_no);
		}
		return res;
		
	}
	
	public int answerUpdate(int boardgroup_no, String board_id, String board_title, String board_content) {
		
		Map map = new HashMap();
		map.put("item1", boardgroup_no);
		map.put("item2", board_id);
		map.put("item3", board_title);
		map.put("item4", board_content);
		
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.insert(namespace + "answerupdate", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int answerInsert(CsDto dto) {
		System.out.println("-----");
		System.out.println(dto.getBoardgroup_no());
		System.out.println(dto.getBoard_id());
		System.out.println(dto.getBoard_title());
		System.out.println(dto.getBoard_content());
		System.out.println("-----");
		
		Map map = new HashMap();
		map.put("boardgroup_no", dto.getBoardgroup_no());
		map.put("board_id", dto.getBoard_id());
		map.put("board_title", dto.getBoard_title());
		map.put("board_content", dto.getBoard_content());
		
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.insert(namespace + "answerinsert", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public List<CsDto> searchList(String text){
		
		SqlSession session = getSqlSessionFactory().openSession();
		List<CsDto> list = session.selectList(namespace + "searchlist",text);
		session.close();
		
		return list;
	}
	

}
