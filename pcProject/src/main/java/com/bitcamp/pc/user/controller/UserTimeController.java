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
	public @ResponseBody UTimeVO addTime(@RequestParam("comId") int comId, @RequestParam("addTime") long addTime,
			HttpSession session) {

		// service, dao 처리 하십쇼
		
		

		UserVO userVo = (UserVO) session.getAttribute("userVO");

		System.out.println("로그인 유저 정보 : " + userVo);

		long remainTime = (addTime * 60) + userVo.getUserTime(); // 남은 시간 계산

		System.out.println("충전 시간 : " + (addTime * 60));
		System.out.println("유저가 가지고 있는 시간 : " + userVo.getUserTime());

		UTimeVO uTime = new UTimeVO();
		uTime.setComId(comId); // 컴퓨터 번호 저장
		uTime.setUserId(userVo.getUserId()); // 세션의 유저 아이디 저장
		uTime.setUserTime(remainTime); // 남은 시간 저장

		return uTime; // 요청한 페이지에 JSON 객체로 리턴
	}
}
