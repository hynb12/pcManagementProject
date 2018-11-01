package com.bitcamp.pc.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.AdminDaoInterface;
import com.bitcamp.pc.member.model.OrderVO;

@Service
public class AdminOrderService {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	AdminDaoInterface adminDao;
	
	public List<OrderVO> getOrderList() {
		List<OrderVO> list = new ArrayList<OrderVO>();
		
		adminDao = sessionTemplate.getMapper(AdminDaoInterface.class);
		list = adminDao.getOrderList();
		
		return list;
	}
}


