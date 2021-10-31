package com.login.biz;

import java.util.List;
import java.util.Map;

import com.login.dao.LoginDao;
import com.login.dto.LoginDto;


public class LoginBiz {

	
	private LoginDao dao = new LoginDao();

	public List<LoginDto> selectList(){
		return dao.selectList();
		
	}
	public List<LoginDto> mapList(){
		return dao.mapList();
	}
	
	public int insert(LoginDto dto) {
		return dao.insert(dto);
	}

	public String idCheck(String member_id) {
		return dao.idCheck(member_id);
	}
	public int update(LoginDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int member_no) {
		return dao.delete(member_no);
	}
	
	public String findId(Map map) {
		return dao.findId(map);
	}
	public String findPw(Map map) {
		return dao.findPw(map);
	}
	
	public LoginDto login(Map map) {
		return dao.login(map);
	}
	
	public Integer loginCheck(Map map) {
		return  dao.loginCheck(map);
	}
	public String selectCheck(String member_id) {
		return dao.selectCheck(member_id);
	}
	
	public LoginDto mypageView(String member_id) {
		return dao.mypageView(member_id);
	}
	
	//���� ������
	
	public int memberdel(String member_id) {
		return dao.memberdel(member_id);
	}
	
	public int mypageupdate(Map map) {
		return dao.mypageupdate(map);
	}
	
	public String selectone(String email,String platform){
		return dao.selectone(email, platform);
	}
	
}
