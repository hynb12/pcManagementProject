package com.bitcamp.pc.user.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.UserDaoInterface;
import com.bitcamp.pc.member.model.UserVO;

@Service
public class UserLoginService {

   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   private UserDaoInterface userDao;

   public boolean userLogin(String userId, String userPw, HttpSession session) {

      boolean result = false;

      userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
      UserVO vo = userDao.loginUser(userId);
      
      
      // 1. vo가 비어있지 않다면 Id & Pw가 일치하는지 확인해야한다.
      if(vo != null && vo.getUserId().equals(userId) && vo.getUserPw().equals(userPw)) {
         
         // session에 Pw가 노출되지 않도록 빈 값으로 초기화
         vo.setUserPw("");
         
         // 세션에 vo 객체 저장한다.
         session.setAttribute("userVO", vo);
         
         
         result = true;
      }

      return result;
   }
}