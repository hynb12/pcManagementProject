package com.bitcamp.pc.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.pc.member.model.UserVO;
import com.bitcamp.pc.user.service.SearchIdService;
import com.bitcamp.pc.user.service.SearchPwService;

@Controller
@RequestMapping("/member/search")
public class SearchController {

	@Autowired
	SearchIdService idService;
	@Autowired
	SearchPwService pwService;
	
	// 메인에서 찾기 클릭 시
	@RequestMapping(method = RequestMethod.GET)
	public String search() {
		return "member/searchForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody UserVO searchInfo(@RequestParam("search") String search, UserVO vo) {
		System.out.println(vo);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("member/searchForm");

		// 아이디 찾기
		if (search.equals("id")) {
			System.out.println("아이디 찾기");

			String id = idService.userIdSearch(vo.getUserPhone(), vo.getUserName());

			vo.setUserId(id);
//			mav.addObject("searchId", id);
//			System.out.println("찾은 ID는" + id);

			return vo;
		}

		// 비밀번호 찾기
		if(search.equals("pw")) {
			System.out.println("비밀번호 찾기");
			System.out.println(vo);
			
			String pw = pwService.userPwSearch(vo.getUserId(), vo.getUserName());
			vo.setUserPw(pw);
			
			return vo;
		}
		return vo;
	}
}
