package com.bitcamp.pc.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.pc.admin.service.AdminLoginService;
import com.bitcamp.pc.user.service.UserLoginService;

@Controller
@RequestMapping("/member/login")
public class LoginController {

	@Autowired
	private UserLoginService userLoginService;
	@Autowired
	private AdminLoginService adminLoginService;

	// 메인페이지에서 로그인 클릭
	@RequestMapping(method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그인 페이지에서 로그인 클릭
	@RequestMapping(method = RequestMethod.POST)
	public String login(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw,
			HttpSession session) {

		boolean isUser = userLoginService.userLogin(userId, userPw, session); // 로그인 성공 여부 검사
		boolean isAdmin = adminLoginService.AdminLogin(userId, userPw, session); // 관리자 로그인 검사

		// 관리자 로그인 여부 확인하기 위해 메인 컨트롤러로 넘겨준다.
		String url = "member/loginForm";

		// isLogin == true
		if (isUser) {
			url = "redirect:/member/main?isAdmin=" + isAdmin;
			// isLogin == true && isAdmin == true
		} else if (isAdmin) {
			url = "redirect:/member/main?isAdmin=" + isAdmin;
		}

		return url;
	}
}
