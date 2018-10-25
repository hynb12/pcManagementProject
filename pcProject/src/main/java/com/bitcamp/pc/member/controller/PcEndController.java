package com.bitcamp.pc.member.controller;
//로그인후 컴퓨터 사용종료때 컨트롤러


//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//@Controller
//@RequestMapping("/member/login")
//public class PcStartController {
//	
//	// 메인페이지에서 로그인 클릭 
//	@RequestMapping(method=RequestMethod.GET)
//	public String loginForm() {
//		return "member/loginForm";
//	}
//	
//	// 로그인 페이지에서 로그인 클릭
//	@RequestMapping(method=RequestMethod.POST)
//	public String login() {
//		boolean isLogin = true; // 로그인 성공 여부 검사
//		boolean isAdmin = true; // 관리자 로그인 검사
//		
//		if(isLogin) {
//			if(isAdmin) {
//				return "admin/adminMain";
//			}
//			
//			else {
//				return "user/userMain";
//			}
//		}
//		
//		return "member/login";
//	}
//}
