package com.bitcamp.pc.member.controller;
//로그인후 컴퓨터 시작할때 컨트롤러

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.pc.member.model.UTimeVO;
import com.bitcamp.pc.member.service.TimeService;

@Controller
public class PcStartController {

	@Autowired
	private TimeService timeService;

	// 메인페이지에서 로그인 클릭
	@RequestMapping("/member/start")
	public ModelAndView start(@RequestParam("userId") String userId, @RequestParam("comId") int comId,
			@RequestParam("charge") long charge, @RequestParam("userTime") long lastUserTime)
			throws SQLException, IOException {

		System.out.println("컨트롤러 시작");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/start");

		try {

			int resultCnt = timeService.startTimeReg(userId, comId, charge, lastUserTime);

			if (resultCnt == 0) {
				modelAndView.setViewName("member/startFail");
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("컨트롤러 끝");

		return modelAndView;

	}
}