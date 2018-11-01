package com.bitcamp.pc.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.pc.admin.service.AdminOrderService;
import com.bitcamp.pc.member.model.OrderVO;

@Controller
public class AdminOrderController {
	
	@Autowired
	AdminOrderService adminOrderService;
	
	@RequestMapping("/admin/order")
	public List<OrderVO> order() {
		List<OrderVO> list = adminOrderService.getOrderList();
		return list;
	}
}
