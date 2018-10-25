package com.bitcamp.pc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminBoardController {
	
	// admin 메인페이지에서 게시판 클릭 
	@RequestMapping("/admin/board")
	public String getuserList() {
		return "admin/adminBoard";
	}
}
