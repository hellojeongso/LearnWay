package com.noti.biz;

import java.util.List;

import com.noti.dao.NotiDao;
import com.noti.dto.NotiDto;

public class NotiBiz {

	private NotiDao dao = new NotiDao();

	public List<NotiDto> selectList() {
		return dao.selectList();
	}

	public NotiDto selectOne(int boardno) {
		return dao.selectOne(boardno);

	}

	public int insert(NotiDto dto) {
		return dao.insert(dto);
	}

	public int update(int board_no, String board_content, String board_title) {
		return dao.update(board_no, board_content, board_title);
	}
	public int delete(int board_no) {
		return dao.delete(board_no);
	}
	public List<NotiDto> searchList(String text) {
		return dao.searchList(text);
	}
	
}
