package com.bitcamp.pc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member/search")
public class SearchController {
	
	// 메인에서 찾기 클릭 시
	@RequestMapping(method=RequestMethod.GET)
	public String search() {
		return "member/searchForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String searchInfo(@RequestParam("search") String search) {
		
		// 아이디 찾기 
		if(search.equals("id")) {
			System.out.println("아이디 찾기");
			return "member/searchId";
		}
		
		// 비밀번호 찾기 
		System.out.println("비밀번호 찾기");
		return "member/searchPw";
	}
}
