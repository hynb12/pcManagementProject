package com.bitcamp.pc.member.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.pc.member.dao.NoticeDaoInterface;
import com.bitcamp.pc.member.model.NoticeListVO;
import com.bitcamp.pc.member.model.NoticeVO;

public class NoticeService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private NoticeDaoInterface daoInterface;
	
	//1페이지에 보여줄 게시글의 수
	private static final int NOTICE_COUNT_PER_PAGE = 10;
	
	public NoticeListVO getNoticeList(int pageNum) throws Exception  {
		daoInterface = sessionTemplate.getMapper(NoticeDaoInterface.class);
		
		int currentPageNum = pageNum;
		
		//전체 게시글 구하기
		int noticeTotalCount = daoInterface.pageCount();
		List<NoticeVO> noticeList = null;
		int firstRow = 0;
		int endRow = NOTICE_COUNT_PER_PAGE;
		
		if(noticeTotalCount > 0) {
			firstRow = (pageNum - 1) * NOTICE_COUNT_PER_PAGE + 1;
			noticeList = daoInterface.selectList(firstRow, endRow);
		} else {
			currentPageNum = 0;
			noticeList = Collections.emptyList();
		}
		return new NoticeListVO(noticeList, noticeTotalCount, currentPageNum, NOTICE_COUNT_PER_PAGE, firstRow, endRow);
	}
}
