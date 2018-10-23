package com.bitcamp.pc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/loginForm")
public class LoginController {
	
	// 메인페이지에서 로그인 클릭 
	@RequestMapping(method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	// 로그인 페이지에서 로그인 클릭
	@RequestMapping(method=RequestMethod.POST)
	public String login() {
		boolean isLogin = true; // 로그인 성공 여부 검사
		boolean isAdmin = true; // 관리자 로그인 검사
		
		if(isLogin) {
			if(isAdmin) {
				return "adminMain";
			}
			
			else {
				return "userMain";
			}
		}
		
		return "login";
	}
}
