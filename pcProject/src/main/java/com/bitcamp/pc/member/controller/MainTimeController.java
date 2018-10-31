package com.bitcamp.pc.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.pc.member.model.UTimeVO;
import com.bitcamp.pc.member.service.MainTimeService;

@Controller
public class MainTimeController {

	@Autowired
	private MainTimeService mainTimeService;

	@RequestMapping("/admin/main")
	public List<UTimeVO> addTime() {

		System.out.println("from UserTimeController // 컨트롤러 시작");

		// UTime테이블
		List<UTimeVO> list = mainTimeService.getUTimeListService();

		System.out.println("from UserTimeController // 컨트롤러 끝");

		return list; // 요청한 페이지에 JSON 객체로 리턴
	}
}