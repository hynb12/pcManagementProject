package com.bitcamp.pc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/memberRegForm")
public class MemberRegController {
	
	// 메인페이지에서 회원가입 클릭  
	@RequestMapping(method=RequestMethod.GET)
	public String memberRegForm() {	
		return "memberRegForm";
	}
	
	// 회원가입 페이지에서 회원가입 클릭
	@RequestMapping(method=RequestMethod.POST)
	public String memberReg() {	
		
		return "redirect:loginForm";
	}
}
