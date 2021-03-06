package com.bitcamp.pc.member.dao;

import java.util.List;

import com.bitcamp.pc.member.model.AdminVO;
import com.bitcamp.pc.member.model.FoodVO;
import com.bitcamp.pc.member.model.OrderVO;
import com.bitcamp.pc.member.model.UserVO;

public interface AdminDaoInterface {
	
	// Admin 회원가입
	public int insertAdmin(AdminVO admin);
	
	// Admin 로그인
	public AdminVO loginAdmin(String userId);
	
	// User List 출력
	public List<UserVO> getUserList();
	
	// Admin 아이디 중복 검사
	public int checkOverId(String adminId);
	
	// 주문 정보 가져오기
	public List<OrderVO> getOrderList();
	
	// 음식 정보 가져오기
	public FoodVO getOrderFoodList(int orderFoodid);
	
	// 주문 리스트 처리
	public int deleteOrderList(int comId);
}
