package com.bitcamp.pc.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMessageController {
	
	@RequestMapping("/user/message")
	public String userBoard() {
		return "user/userMessage";
	}
}
