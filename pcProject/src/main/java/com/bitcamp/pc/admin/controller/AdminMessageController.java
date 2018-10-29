package com.bitcamp.pc.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.pc.admin.service.MessageDetailService;
import com.bitcamp.pc.admin.service.MessageGetListService;
import com.bitcamp.pc.member.model.MessageVo;


@Controller
public class AdminMessageController {
	
	@Autowired
	private MessageGetListService service;
	
	@Autowired
	private MessageDetailService service2;
	
	@RequestMapping("/admin/message")
	public String getMessage(Model model, HttpServletRequest request) {
		
		String messageId = request.getParameter("messageId");
		
		MessageVo message = service2.select(messageId);
		List<MessageVo> list = service.getMessage();
		
		model.addAttribute("list", list);
		model.addAttribute("detail", message);
		
		return "admin/adminMessage";
	}

}
