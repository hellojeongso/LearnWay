package com.myclass.biz;

import java.util.List;
import java.util.Map;

import com.myclass.dao.MyclassDao;
import com.myclass.dto.MyclassDto;

public class MyclassBiz {
	private MyclassDao dao = new MyclassDao();
	
	public List<MyclassDto> myclassList(String member_id){
		return dao.myclassList(member_id);
	}
	
	public String sugang(Map map) {
		return dao.sugang(map);
	}
	
	public int myclassInsert(MyclassDto dto) {
		return dao.myclassInsert(dto);
	}
}
