package com.bitcamp.pc.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserOrderController {
	
	@RequestMapping(value = "/user/order", 
			produces = MediaType.APPLICATION_JSON_VALUE,
			consumes = MediaType.APPLICATION_JSON_VALUE,
			headers = "content-type=application/x-www-form-urlencoded")
	
	@ResponseBody 
	public void order(@RequestBody List<Map<String, Object>> list) {
		
		// 주문 테이블에 정보 저장하는 서비스 처리
		
		
		// 주문 리스트 테이블에 정보 저장하는 서비스 처리
		
		
		
		System.out.println(list);
	}
}
