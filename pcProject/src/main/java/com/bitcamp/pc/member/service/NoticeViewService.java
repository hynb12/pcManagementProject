package com.bitcamp.pc.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.pc.member.dao.NoticeDaoInterface;
import com.bitcamp.pc.member.model.NoticeVO;

@Service
public class NoticeViewService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	private NoticeDaoInterface daoInterface;

	@Transactional
	public NoticeVO getView(int id) {

		daoInterface = sessionTemplate.getMapper(NoticeDaoInterface.class);

		NoticeVO no = null;
		try {
			no = daoInterface.selectView(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return no;
	}

}
