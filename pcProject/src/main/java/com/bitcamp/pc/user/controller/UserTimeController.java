package com.bitcamp.pc.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.pc.member.model.UTimeVO;
import com.bitcamp.pc.member.model.UserVO;
import com.bitcamp.pc.member.service.TimeService;

@Controller
public class UserTimeController {

	@Autowired
	private TimeService timeService;

	@RequestMapping("/user/addTime")
	public @ResponseBody UTimeVO addTime(@RequestParam("comId") int comId, @RequestParam("addTime") long addTime,
			HttpSession session) {

		System.out.println("from UserTimeController // 컨트롤러 시작");

		// service, dao 처리 하십쇼

		UserVO userVo = (UserVO) session.getAttribute("userVO");

		System.out.println("from UserTimeController // 로그인 유저 정보 : " + userVo);

		long remainTime = (addTime * 60) + userVo.getUserTime(); // 남은 시간 계산

		System.out.println("from UserTimeController // 유저가 가지고 있는 시간(분) : " + userVo.getUserTime());
		System.out.println("from UserTimeController // 충전 시간(분) : " + (addTime * 60));
		System.out.println("from UserTimeController // 충전 후 시간(분) : " + remainTime);

		UTimeVO uTime = new UTimeVO();

		uTime.setUserId(userVo.getUserId()); // 세션의 유저 아이디 저장
		uTime.setComId(comId); // 컴퓨터 번호 저장
		uTime.setUserTime(remainTime); // 남은 시간 저장

		// service, dao 처리 하십쇼

		System.out.println("from UserTimeController // 컨트롤러 중간");

		try {

			int resultCnt = timeService.startTimeReg(userVo.getUserId(), comId, remainTime);

			if (resultCnt == 1) {
				System.out.println("from UserTimeController // 등록 성공");
			} else {
				System.out.println("from UserTimeController // 등록 실패");
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("from UserTimeController // 컨트롤러 끝");

		return uTime; // 요청한 페이지에 JSON 객체로 리턴
	}
}