package com.bitcamp.pc.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserBoardController {
	
	@RequestMapping("/user/board")
	public String userBoard() {
		return "user/userBoard";
	}
}
