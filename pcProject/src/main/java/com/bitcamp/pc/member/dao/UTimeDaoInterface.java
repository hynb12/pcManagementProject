package com.bitcamp.pc.member.dao;

import com.bitcamp.pc.member.model.UTime;

public interface UTimeDaoInterface {

	public int startTime(UTime utime);

	public int endTime(UTime utime);
//
//	public int remainTime(String userId, long userTime, Date endTime, Date startTime);

}
