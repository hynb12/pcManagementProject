package com.bitcamp.pc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminMessageController {
	
	// admin 메인페이지에서 쪽지 클릭 
	@RequestMapping("/admin/message")
	public String getuserList() {
		return "admin/adminMessage";
	}
}
