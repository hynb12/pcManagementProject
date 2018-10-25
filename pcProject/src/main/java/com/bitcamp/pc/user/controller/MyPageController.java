package com.bitcamp.pc.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("/user/myPage")
	public String myPage() {
		return "user/myPage";
	}
}
