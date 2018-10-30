package com.bitcamp.pc.member.dao;

import com.bitcamp.pc.member.model.UserVO;

public interface UserDaoInterface {

	// 유저 회원가입 메서드	
	public int insertUser(UserVO user);
	
	// 유저 로그인 메서드
	public UserVO loginUser(String userId);
	
	// 유저 ID 찾기
	public UserVO searchId(String userPhone);
}
