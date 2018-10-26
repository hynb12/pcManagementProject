package com.bitcamp.pc.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.pc.member.dao.NoticeDaoInterface;
import com.bitcamp.pc.member.model.NoticeVO;

public class NoticeWriteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private NoticeDaoInterface daoInterface;

	@Transactional
	public void noticeWrite(NoticeVO noticeVO) {

		daoInterface = sessionTemplate.getMapper(NoticeDaoInterface.class);

		try {
			daoInterface.insertNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}