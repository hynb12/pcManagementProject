package com.bitcamp.pc.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.pc.member.model.NoticeVO;
import com.bitcamp.pc.member.service.NoticeViewService;

@Controller
public class NoticeModifyController {

	@Autowired
	NoticeViewService service;
	
	@RequestMapping(value = "/admin/notice/modify/{id}", method = RequestMethod.GET)
	public ModelAndView noticeModify(@PathVariable("id") int id) {

		/* System.out.println(req.getHeader("referer")); */

		ModelAndView modelAndView = new ModelAndView();
		NoticeVO no = service.getView(id);
		
		modelAndView.setViewName("admin/noticeModifyForm");
		modelAndView.addObject("modifyView", no);
		
		return modelAndView;
	}
	
	
}
