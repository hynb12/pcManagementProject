package com.bitcamp.pc.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.pc.member.model.UserVO;
import com.bitcamp.pc.user.service.UserMyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	UserMyPageService service;
	
	@RequestMapping("/user/myPage")
	public String myPage(HttpSession session, Model model) {
		
		String result;

		try {
			
		UserVO userData = (UserVO) session.getAttribute("userVO");
		
		String userId = userData.getUserId();
		
		model.addAttribute("user",service.getMyPage(userId));
		
		result = "user/myPage";
			
		} catch(Exception e) {
			
			result = "redirect:/";
			
		}
		
		return result;
	}
}
