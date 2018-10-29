package com.bitcamp.pc.member.dao;

import com.bitcamp.pc.member.model.MessageVo;

public interface MessageDaoInterface {
	public int insertMessage(MessageVo messageVo); 
	
	public MessageVo selectList();
	
	public MessageVo selectOne();
	
	public int deleteMessage();
}
