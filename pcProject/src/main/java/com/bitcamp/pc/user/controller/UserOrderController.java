package com.bitcamp.pc.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.pc.member.model.OrderListVO;
import com.bitcamp.pc.member.model.OrderVO;
import com.bitcamp.pc.user.service.OrderListService;
import com.bitcamp.pc.user.service.OrderService;

@Controller
public class UserOrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderListService orderListService;
	
	@ResponseBody 
	@RequestMapping(value = "/user/order", 
			produces = MediaType.APPLICATION_JSON_VALUE,
			consumes = MediaType.APPLICATION_JSON_VALUE,
			headers = "content-type=application/x-www-form-urlencoded")
	
	public void order(@RequestBody List<Map<String, Object>> list) {
		int resultOrder = 0;
		int resultOrderList = 0;
		
		System.out.println(list);
		
		for (int i = 0; i < list.size(); i++) {
            
    		OrderVO order = new OrderVO();
    		order.setComId((int)list.get(i).get("userComId"));
    		order.setOrderFoodId((int)list.get(i).get("orderFoodId"));
    		order.setOrderCnt((int)list.get(i).get("orderCnt"));
            
    		
    		
    		
			/*OrderListVO orderList = new OrderListVO();
			orderList.setOrderId((int)list.get(i).get("orderId"));
			orderList.setFoodId((int)list.get(i).get("foodId"));
			orderList.setFoodName((String)list.get(i).get("foodName"));
			orderList.setFoodCnt((int)list.get(i).get("foodCnt"));*/
			
			// 주문 테이블에 정보 저장하는 서비스 처리
			resultOrder = orderService.order(order);
			
			// 주문 리스트 테이블에 정보 저장하는 서비스 처리
			// resultOrderList = orderListService.orderList(orderList);
			
			if(resultOrder == 0) {
				System.out.println("★★주문 테이블 등록 실패");
			}
			
			else {
				System.out.println("주문 테이블 등록 성공");
			}
			
        }
	}
}	
