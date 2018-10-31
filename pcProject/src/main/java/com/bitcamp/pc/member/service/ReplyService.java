package com.bitcamp.pc.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.pc.member.dao.ReplyDaoInterface;
import com.bitcamp.pc.member.model.ReplyVO;

@Service
public class ReplyService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private ReplyDaoInterface daoInterface;

	@Transactional
	public List<ReplyVO> listReply(int id) {
		daoInterface = sessionTemplate.getMapper(ReplyDaoInterface.class);
		List<ReplyVO> reVO = null;
		try {
			reVO = daoInterface.replyList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reVO;
	}

	@Transactional
	public void insertReply(ReplyVO vo) {
		daoInterface = sessionTemplate.getMapper(ReplyDaoInterface.class);

		try {
			daoInterface.insertReply(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteReply(int id) {
		daoInterface = sessionTemplate.getMapper(ReplyDaoInterface.class);
		
		try {
			daoInterface.deleteReply(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
