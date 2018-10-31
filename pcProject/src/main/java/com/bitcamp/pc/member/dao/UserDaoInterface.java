package com.bitcamp.pc.member.dao;

import com.bitcamp.pc.member.model.OrderVO;
import com.bitcamp.pc.member.model.UserVO;

public interface UserDaoInterface {

	// 유저 회원가입 메서드	
	public int insertUser(UserVO user);
	
	// 유저 로그인 메서드
	public UserVO loginUser(String userId);
	
	// 유저 ID 찾기
	public UserVO searchId(String userPhone);
	
	// 유저 PW 찾기
	public UserVO searchPw(String userId);
	
	// 마이페이지 메서드
	public UserVO getMyPage(String userId);
	
	// 유저 수정
	public int editUser(UserVO user);

	// 유저 삭제
	public int deleteUser(String userId);
	
	// 주문 정보
	public int insertOrder(OrderVO order);
	
	// 아이디 중복 체크
	public int checkOverId(String userId);
}
