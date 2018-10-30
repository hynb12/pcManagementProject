package com.bitcamp.pc.user.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.pc.member.model.UTimeVO;
import com.bitcamp.pc.member.model.UserVO;

@Controller
public class UserTimeController {
	
	@RequestMapping("/user/addTime")
	public @ResponseBody UTimeVO addTime(
								@RequestParam("comId") int comId,
								@RequestParam("addTime") long addTime,
								HttpSession session) {
		
		// service, dao 처리 하십쇼 
		
		UserVO userVo =  (UserVO)session.getAttribute("userVO");
		long remainTime = addTime + userVo.getUserTime(); // 남은 시간 계산
		
		System.out.println("충전 시간 : " + addTime);
		System.out.println("유저가 가지고 있는 시간 : " + userVo.getUserTime());
		
		UTimeVO uTime = new UTimeVO();
		uTime.setComId(comId);
		uTime.setUserTime(remainTime);
		
		return uTime; // 요청한 페이지에 JSON 객체로 리턴
	}
}
