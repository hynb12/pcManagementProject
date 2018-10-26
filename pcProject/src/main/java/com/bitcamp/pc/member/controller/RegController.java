package com.bitcamp.pc.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;

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
	public String memberReg(@RequestParam("id") String id,
							// 체크박스는 파라미터 안넘어오면 null 이므로 오류 발생
							// 그러므로 파라미터 필수 여부 false 변경
							@RequestParam(value="isAdmin", required=false) String isAdmin) {	
		
		// 회원가입 페이지에서 파라미터 받아서 분기 처리
		// 아이디에 admin 포함되어 있고 관리자 여부 체크 했으면 관리자 회원가입으로 처리
		// 아니면 사용자 회원가입으로 처리
		
		if(isAdmin != null) {
			if(id.contains("admin")) {
				System.out.println("관리자 계정 회원가입");
				// 경원이형 처리
			}
		}
		
		else {
			System.out.println("사용자 계정 회원가입");
			// 겨례형 처리
		}
		
		return "redirect:login";
	}
}
