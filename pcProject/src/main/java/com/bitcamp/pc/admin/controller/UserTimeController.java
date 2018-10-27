package com.bitcamp.pc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.pc.member.model.UTime;

@Controller
public class UserTimeController {
	
	@RequestMapping("/user/addTime")
	public ModelAndView addTime(
								@RequestParam("comId") int comId,
								@RequestParam("userId") String userId,
								@RequestParam("addTime") long addTime) {
		
		ModelAndView mav = new ModelAndView();
		
		UTime uTime = new UTime();
		uTime.setComId(comId);
		uTime.setUserId(userId);
		uTime.setUserTime(addTime);
		
		mav.setViewName("user/userMain");
		mav.addObject("uTime", uTime);
		
		return mav;
	}
}
