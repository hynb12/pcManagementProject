package com.bitcamp.pc.member.dao;

import com.bitcamp.pc.member.model.AdminVO;

public interface AdminDaoInterface {
	
	// Admin 회원가입
	public int insertAdmin(AdminVO admin);
	
	// Admin 로그인
	public AdminVO loginAdmin(String userId);
	
}
