package com.bitcamp.pc.member.dao;

import java.util.List;

import com.bitcamp.pc.member.model.NoticeVO;

public interface NoticeDaoInterface {

	void insertNotice(NoticeVO noticeVO) throws Exception;

	int pageCount() throws Exception;

	List<NoticeVO> selectList(int firstRow) throws Exception;

	NoticeVO selectView(int noticeId) throws Exception;

	void deleteNotice(int id) throws Exception;

	void updateNotice(NoticeVO noticeVO) throws Exception;
}
