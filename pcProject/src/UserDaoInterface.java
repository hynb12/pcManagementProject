package com.bitcamp.pc.member.dao;

import com.bitcamp.pc.member.model.UserVO;

public interface UserDaoInterface {

	// 유저 회원가입 메서드	
	public int insertUser(UserVO user);
	
	// 유저 로그인 메서드
	public UserVO loginUser(String userId);

	// 마이페이지 메서드
	public UserVO getMyPage(String userId);
	
	// 유저 수정
	public int editUser(UserVO user);

	// 유저 삭제
	public int deleteUser(String userId);
}
