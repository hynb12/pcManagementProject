package com.bitcamp.pc.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.pc.member.dao.AdminDaoInterface;
import com.bitcamp.pc.member.model.Admin;

public class AdminRegService {

   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   private AdminDaoInterface adminDao;
   
   public int adminReg(Admin admin) {
      
      int resultCnt = 0;
      
      // Spring + MyBatis 연결하여 Dao에 interface 안 메서드를 넘겨준다.
      adminDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
      // result 값에 Dao값을 넣어준다(member를 매개변수로 설정).
      resultCnt = adminDao.insertAdmin(admin);
      
      return resultCnt;
   }
}