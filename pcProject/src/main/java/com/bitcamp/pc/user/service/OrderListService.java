package com.bitcamp.pc.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.UserDaoInterface;
import com.bitcamp.pc.member.model.OrderListVO;

@Service
public class OrderListService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	UserDaoInterface userDao;
	
	public int orderList(OrderListVO orderList) {
		
		int resultCnt = 0;
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		resultCnt = userDao.insertOrderList(orderList);
		
		return resultCnt;
	}
	
	
}
