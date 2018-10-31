package com.bitcamp.pc.member.dao;

import java.util.List;

import com.bitcamp.pc.member.model.UTimeVO;
import com.bitcamp.pc.member.model.UserVO;

public interface UserTimeDaoInterface {

	public int UTimeChargeDao(UTimeVO utime);

	public int UserChargeDao(UserVO userVO);
	
	public List<UTimeVO> getUTimeListDao();

	public int endTime(UTimeVO utime);

	

}
