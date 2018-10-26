package com.bitcamp.pc.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/reg")
public class RegController {
	
	// 유저 서비스 autowired
	
	// 관리자 서비스 autowired
	
	// 메인페이지에서 회원가입 클릭  
	@RequestMapping(method=RequestMethod.GET)
	public String memberRegForm() {	
		return "member/regForm";
	}
	
	// 회원가입 페이지에서 회원가입 클릭
	@RequestMapping(method=RequestMethod.POST)
	public String memberReg() {	
		
		// 회원가입 페이지에서 파라미터 받아서 분기 처리
		// ex) 관리자 체크 박스 ckecked일 경우
		// 관리자 서비스 실행
		
		return "redirect:login";
	}
}
