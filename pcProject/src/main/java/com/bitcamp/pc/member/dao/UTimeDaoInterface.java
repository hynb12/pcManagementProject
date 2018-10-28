package com.bitcamp.pc.member.dao;

import com.bitcamp.pc.member.model.UTimeVO;

public interface UTimeDaoInterface {

	public int startTime(UTimeVO utime);

	public int endTime(UTimeVO utime);
//
//	public int remainTime(String userId, long userTime, Date endTime, Date startTime);

}
