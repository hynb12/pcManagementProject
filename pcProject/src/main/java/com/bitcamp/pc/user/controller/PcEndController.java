package com.bitcamp.pc.user.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.pc.member.model.UserVO;
import com.bitcamp.pc.user.service.UserTimeService;

public class PcEndController {

	@Autowired
	private UserTimeService userTimeService;

	// 메인페이지에서 로그인 클릭
	@RequestMapping("user/endTime")
	public String endTime(HttpSession session) throws SQLException, IOException {

		System.out.println("컨트롤러 시작");

		UserVO userVO = (UserVO) session.getAttribute("userVO");

		String userId = userVO.getUserId();

		try {

			// User테이블
			int UserResultCnt = userTimeService.endTimeReg(userId);

			if (UserResultCnt == 1) {
				System.out.println("from UserTimeController // User 테이블 등록 성공");
			} else {
				System.out.println("from UserTimeController // User 테이블 등록 실패");
			}

			// UTime테이블
			int UTimeResultCnt = userTimeService.reset(userId);

			if (UTimeResultCnt == 1) {
				System.out.println("from UserTimeController // UTime 테이블 등록 성공");
			} else {
				System.out.println("from UserTimeController // UTime 테이블 등록 실패");
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("컨트롤러 끝");
		
		// 세션의 종료
		session.invalidate();

		return "redirect:/";

	}
}
