package com.bitcamp.pc.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.pc.member.model.ReplyVO;
import com.bitcamp.pc.member.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyCotroller {

	@Autowired
	ReplyService service;

	@RequestMapping(value = "/all/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<ReplyVO> list(@PathVariable("id") int id) {

		List<ReplyVO> list = service.listReply(id);

//		System.out.println(list);
		
		return list;
	}
}