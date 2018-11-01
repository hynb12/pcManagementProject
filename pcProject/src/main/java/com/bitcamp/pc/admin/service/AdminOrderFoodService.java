package com.bitcamp.pc.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.AdminDaoInterface;
import com.bitcamp.pc.member.model.FoodVO;

@Service
public class AdminOrderFoodService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	AdminDaoInterface adminDao;
	
	public FoodVO getOderFoodList(int orderFoodId) {
		adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		
		return adminDao.getOrderFoodList(orderFoodId);
	}
}
