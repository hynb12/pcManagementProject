package com.bitcamp.pc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeWriteController {
	
	// 공지사항에서 글쓰기 클릭시 글쓰기폼으로 이동 
	@RequestMapping("/admin/noticeWrite")
	public String noticeWriteForm() {
		
		return "admin/noticeWriteForm";
	}
}
