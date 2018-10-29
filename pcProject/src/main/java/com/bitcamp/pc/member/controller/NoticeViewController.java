package com.bitcamp.pc.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.pc.member.model.NoticeVO;
import com.bitcamp.pc.member.service.NoticeViewService;

@Controller
public class NoticeViewController {

	@Autowired
	private NoticeViewService service;
	
	@RequestMapping("/member/notice/{noticeId}")
	public String getContent(@PathVariable("noticeId") int id, Model model) {
		
		NoticeVO no = service.getView(id);		
		
		model.addAttribute("view", no);
		
		return "member/noticeView";
	}
}
