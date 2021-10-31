package com.cs.biz;

import java.util.List;

import com.cs.dao.CsDao;
import com.cs.dto.CsDto;


public class CsBiz {

	private CsDao dao = new CsDao();

	public List<CsDto> selectList(){
		return dao.selectList();
	}
	
	public int insert(CsDto dto) {
		return dao.insert(dto);
	}
	
	public CsDto selectOne(int board_no) {
		return dao.selectOne(board_no);
	}
	
	public int update(int board_no, String board_content, String board_title) {
		return dao.update(board_no, board_content, board_title);
	}
	
	public int delete(int board_no) {
		return dao.delete(board_no);
	}
	
	public int answerUpdate(int boardgroup_no, String board_id, String board_title, String board_content) {
		return dao.answerUpdate(boardgroup_no, board_id, board_title, board_content);
	}
	
	public int answerInsert(CsDto dto) {
		return dao.answerInsert(dto);
	}
	public List<CsDto> searchList(String text){
		return dao.searchList(text);
	}
	

}
