package com.bitcamp.pc.user.service;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalTime;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.pc.member.dao.UserTimeDaoInterface;
import com.bitcamp.pc.member.model.UTimeVO;
import com.bitcamp.pc.member.model.UserVO;

@Service
public class UserTimeService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private UserTimeDaoInterface userTimeDaoInterface;

	public int UTimeChargeService(String userId, int comId, long remainTime) {

		System.out.println("from UserTimeService.UTimeChargeService // 서비스 시작 ");

		userTimeDaoInterface = sqlSessionTemplate.getMapper(UserTimeDaoInterface.class);

		// 시간형식
		SimpleDateFormat f;
		f = new SimpleDateFormat("HH:mm");

		// 시작
		Date startnow = new Date(); // 시작시 현재시간

		String startTime = f.format(startnow); // String타입으로 변경
		System.out.println("from UserTimeService.UTimeChargeService // 현재시간 : " + startTime);

		UTimeVO uTime = new UTimeVO(userId, comId, remainTime, startTime, ""); // 테스트 모델
//      UTime(String userId, String comId, long userTime, String startTime, String endTime)

		int resultCnt = 0;

		System.out.println("from UserTimeService.UTimeChargeService // 서비스 중간 확인 ");

		System.out.println("from UserTimeService.UTimeChargeService // 테스트 모델 확인 : " + uTime); // 테스트 모델 확인

		resultCnt = userTimeDaoInterface.UTimeChargeDao(uTime);

		System.out.println("from UserTimeService.UTimeChargeService // 서비스 끝 ");

		return resultCnt;
	}

	public int UserChargeService(String userId, long remainTime) {

		System.out.println("from UserTimeService.UserChargeService // 서비스 시작 ");

		userTimeDaoInterface = sqlSessionTemplate.getMapper(UserTimeDaoInterface.class);
			
		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		userVO.setUserTime(remainTime);

		int resultCnt = 0;

		System.out.println("from UserTimeService.UserChargeService // 서비스 중간 확인 ");

		System.out.println("from UserTimeService.UserChargeService // 테스트 모델 확인 : " + userVO); // 테스트 모델 확인

		resultCnt = userTimeDaoInterface.UserChargeDao(userVO);

		System.out.println("from UserTimeService.UserChargeService// 서비스 끝 ");

		return resultCnt;
	}

	public int endTimeReg(UTimeVO uTime) {

		System.out.println("from TimeService.endTimeReg // 서비스 시작 ");

		userTimeDaoInterface = sqlSessionTemplate.getMapper(UserTimeDaoInterface.class);

		// 시간형식
		SimpleDateFormat f;
		f = new SimpleDateFormat("HH:mm:ss");

		// 시작
		String startTime = uTime.getStartTime(); // 시작시간(객체)
		LocalTime start = LocalTime.parse(startTime); // 계산을 위한 LocalTime타입으로 변경

		// 종료
		Date endnow = new Date(); // 종료시 현재시간
		String endTime = f.format(endnow); // String타입으로 변경
		LocalTime end = LocalTime.parse(endTime); // 계산을 위한 LocalTime타입으로 변경
		uTime.setEndTime(endTime);// 객체에 종료시간 입력

		// 사용시간(LocalTime, Duration, toMinutes()-type:long)
		long used = Duration.between(start, end).toMinutes();

		long before = uTime.getUserTime();// 사용전 남은시간

		long after = before - used;// 사용후 남은시간

		uTime.setUserTime(after);// 객체에 사용후 남은시간 입력

		int resultCnt = 0;

		System.out.println("from TimeService.endTimeReg // 서비스 중간 확인 ");

		System.out.println(uTime); // 테스트 모델 확인

		resultCnt = userTimeDaoInterface.endTime(uTime);

		System.out.println("from TimeService.endTimeReg // 서비스 끝 ");

		return resultCnt;
	}

}