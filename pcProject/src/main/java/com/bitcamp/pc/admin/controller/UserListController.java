package com.bitcamp.pc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserListController {
	
	// admin 메인페이지에서 회원정보 클릭 
	@RequestMapping("/admin/userList")
	public String getUserList() {
		
		return "admin/userList";
	}
}
