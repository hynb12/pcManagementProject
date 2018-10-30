package com.bitcamp.pc.member.dao;

import java.util.List;

import com.bitcamp.pc.member.model.AdminVO;
import com.bitcamp.pc.member.model.UserVO;

public interface AdminDaoInterface {
	
	// Admin 회원가입
	public int insertAdmin(AdminVO admin);
	
	// Admin 로그인
	public AdminVO loginAdmin(String userId);
	
	// User List 출력
	public List<UserVO> getUserList();
	
}
