package com.noti.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.noti.dto.NotiDto;

public class NotiDao extends SqlMapConfig {

	private String namespace = "com.noti.mapper.";

	public List<NotiDto> selectList() {

		SqlSession session = getSqlSessionFactory().openSession();
		List<NotiDto> list = session.selectList(namespace + "selectList");
		session.close();

		return list;
	}

	public NotiDto selectOne(int board_no) {
		SqlSession session = null;
		NotiDto dto = null;

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

	public int insert(NotiDto dto) {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.insert(namespace + "insert", dto);
		}
		return res;
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
		try (SqlSession session = getSqlSessionFactory().openSession(true)) {
			res = session.delete(namespace + "delete", board_no);
		}

		return res;
	}
	
	public List<NotiDto> searchList(String text) {

		SqlSession session = getSqlSessionFactory().openSession();
		List<NotiDto> list = session.selectList(namespace + "searchList",text);
		session.close();

		return list;
	}

}
