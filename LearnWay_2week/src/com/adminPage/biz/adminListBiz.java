package com.adminPage.biz;

import java.util.List;
import com.adminPage.dao.adminListDao;
import com.adminPage.dto.adminPageDto;
import com.adminPage.dto.learnDto;

public class adminListBiz {

	private adminListDao dao = new adminListDao();
	
	public List<adminPageDto> selectList(){
		return dao.selectList();
	}
	public List<learnDto> learnList(){
		return dao.learnList();
	}
	public int adminCheck(String member_id) {
		return dao.adminCheck(member_id);
	}
}
