package com.bitcamp.pc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/noticeWrite")
public class NoticeWriteController {

	// 공지사항에서 글쓰기 클릭시 글쓰기폼으로 이동
	@RequestMapping(method = RequestMethod.GET)
	public String getWriteForm() {

		return "admin/noticeWriteForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String writeSuccess() {

		return "redirect:/member/notice";
	}
}
