package com.bitcamp.pc.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.pc.member.model.UTimeVO;

@Controller
public class UserTimeController {
	
	@RequestMapping("/user/addTime")
	public ModelAndView addTime(
								@RequestParam("comId") int comId,
								@RequestParam("userId") String userId,
								@RequestParam("addTime") long addTime) {
		
		ModelAndView mav = new ModelAndView();
		
		// service, dao 처리 하십쇼 
		UTimeVO uTime = new UTimeVO();
		uTime.setComId(comId);
		uTime.setUserId(userId);
		uTime.setUserTime(addTime);
		
		mav.setViewName("user/userMainJson");
		mav.addObject("uTime", uTime);
		
		return mav;
	}
}
