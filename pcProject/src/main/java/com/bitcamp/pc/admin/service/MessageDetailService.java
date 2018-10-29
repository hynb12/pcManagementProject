package com.bitcamp.pc.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.MessageDaoInterface;
import com.bitcamp.pc.member.model.MessageVo;


@Service
public class MessageDetailService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MessageDaoInterface messageDao;
	
	public MessageVo select(String messageId) {
		
		messageDao = sqlSessionTemplate.getMapper(MessageDaoInterface.class);
		return messageDao.selectOne(messageId);
		
	}
	
}
