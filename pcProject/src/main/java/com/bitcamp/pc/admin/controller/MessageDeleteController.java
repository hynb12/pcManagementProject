package com.bitcamp.pc.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.pc.admin.service.MessageDeleteService;


@Controller
public class MessageDeleteController {
	
	@Autowired
	private MessageDeleteService service;
	
	@RequestMapping("/admin/notice/delete")
	public String delete(@RequestParam("messageId") String messageId) {
		
		service.delete(messageId);
		
		return "redirect:/admin/message";
	}

}
