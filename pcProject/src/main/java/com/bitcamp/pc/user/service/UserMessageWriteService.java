package com.bitcamp.pc.user.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.MessageDaoInterface;
import com.bitcamp.pc.member.model.MessageVo;

@Service
public class UserMessageWriteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MessageDaoInterface messageDao;
	
	public void write(MessageVo message, String userId) {
		
			message.setUserId(userId);
			
			messageDao = sqlSessionTemplate.getMapper(MessageDaoInterface.class);
			messageDao.insertMessage(message);
	}
}
