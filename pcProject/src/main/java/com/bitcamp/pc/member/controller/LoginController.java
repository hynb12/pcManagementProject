package com.bitcamp.pc.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/login")
public class LoginController {

	// 메인페이지에서 로그인 클릭
	@RequestMapping(method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그인 페이지에서 로그인 클릭
	@RequestMapping(method = RequestMethod.POST)
	public String login() {
		boolean isLogin = true; // 로그인 성공 여부 검사
		boolean isAdmin = true; // 관리자 로그인 검사
		
		// 관리자 로그인 여부 확인하기 위해 메인 컨트롤러로 넘겨준다.
		String url = "redirect:/member/main?isAdmin="+isAdmin;

		if (isLogin) {
			if (isAdmin) {
				url = "redirect:/member/main?isAdmin="+isAdmin;
			}
		} else {
			url = "member/loginForm";
		}
		
		return url;
	}
}
