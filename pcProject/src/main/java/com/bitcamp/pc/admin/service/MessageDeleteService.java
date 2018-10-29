package com.bitcamp.pc.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.MessageDaoInterface;


@Service
public class MessageDeleteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MessageDaoInterface messageDao;
	
	public int delete(String messageId) {
		
		messageDao = sqlSessionTemplate.getMapper(MessageDaoInterface.class);
		return messageDao.deleteMessage(messageId);
	}
}
