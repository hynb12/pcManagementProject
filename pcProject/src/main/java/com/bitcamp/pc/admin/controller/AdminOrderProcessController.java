package com.bitcamp.pc.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminOrderProcessController {

	@RequestMapping("/admin/orderProcess")
	public void orderProcess(@RequestParam("orderId") int orderId) {
		System.out.println("컴퓨터 아이디 : "+ orderId);
	}
}
