package com.bitcamp.pc.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.pc.member.dao.NoticeDaoInterface;
import com.bitcamp.pc.member.model.NoticeVO;

@Service
public class NoticeModifyService {

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	NoticeDaoInterface daoInterface;
	
	@Transactional
	public void noticeModify(NoticeVO noticeVO) {
		
		daoInterface = sessionTemplate.getMapper(NoticeDaoInterface.class);
		
		try {
			daoInterface.updateNotice(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
