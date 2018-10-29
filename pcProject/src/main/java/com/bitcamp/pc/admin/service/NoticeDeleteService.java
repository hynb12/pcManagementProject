package com.bitcamp.pc.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.NoticeDaoInterface;

@Service
public class NoticeDeleteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private NoticeDaoInterface daoInterface;

	public void noticeDelete(int id) {

		daoInterface = sessionTemplate.getMapper(NoticeDaoInterface.class);
		
		daoInterface.deleteNotice(id);
		
	}
}
