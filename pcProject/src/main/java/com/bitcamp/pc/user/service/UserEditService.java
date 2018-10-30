package com.bitcamp.pc.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.UserDaoInterface;
import com.bitcamp.pc.member.model.UserVO;

@Service
public class UserEditService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private UserDaoInterface userDao;
	
	public int editUser(UserVO userVO) {
		
		int resultCnt = 0;
		
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		resultCnt = userDao.editUser(userVO);
		
		return resultCnt;
		
	}
}
