package com.bitcamp.pc.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.pc.member.model.UserVO;
import com.bitcamp.pc.user.service.SearchIdService;

@Controller
@RequestMapping("/member/search")
public class SearchController {
	
	@Autowired
	SearchIdService idService;
	
	// 메인에서 찾기 클릭 시
	@RequestMapping(method=RequestMethod.GET)
	public String search() {
		return "member/searchForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView searchInfo(
			@RequestParam("search") String search,
			UserVO vo) {
		System.out.println(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/search");
		
		// 아이디 찾기 
		if(search.equals("id")) {
			System.out.println("아이디 찾기");

			String id = idService.userIdSearch(vo.getUserPhone(), vo.getUserName());
			mav.addObject("searchId", id);
			System.out.println("찾은 ID는"+ id);
			
			return mav;
		}
		
		// 비밀번호 찾기 
		System.out.println("비밀번호 찾기");
		return mav;
	}
}
