package com.bitcamp.pc.member.controller;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.pc.member.model.UTimeVO;
import com.bitcamp.pc.user.service.UserTimeService;

public class PcEndController {

	@Autowired
	private UserTimeService timeService;

	// 메인페이지에서 로그인 클릭
	@RequestMapping("/member/start")
	public ModelAndView End(@RequestParam("UTime") UTimeVO utime) throws SQLException, IOException {

		System.out.println("컨트롤러 시작");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/");

		try {

			int resultCnt = timeService.endTimeReg(utime);

			if (resultCnt == 0) {
				modelAndView.setViewName("member/endFail");
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("컨트롤러 끝");

		return modelAndView;

	}
}
