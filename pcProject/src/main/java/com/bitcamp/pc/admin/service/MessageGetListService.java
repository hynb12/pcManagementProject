package com.bitcamp.pc.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.MessageDaoInterface;
import com.bitcamp.pc.member.model.MessageVo;

@Service
public class MessageGetListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MessageDaoInterface messageDao;
	
	public List<MessageVo> getMessage() {
		
		messageDao = sqlSessionTemplate.getMapper(MessageDaoInterface.class);
		List<MessageVo> list = messageDao.selectList();
		
		return list;
	}
}
