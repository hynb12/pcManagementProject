package com.bitcamp.pc.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.pc.member.model.UTimeVO;

@Controller
public class UserTimeController {
	
	@RequestMapping("/user/addTime")
	public @ResponseBody UTimeVO addTime(
								@RequestParam("comId") int comId,
								@RequestParam("userId") String userId,
								@RequestParam("addTime") long addTime) {
		
		// service, dao 처리 하십쇼 
		
		UTimeVO uTime = new UTimeVO();
		uTime.setComId(comId);
		uTime.setUserId(userId);
		uTime.setUserTime(addTime);
		
		return uTime;
	}
}
