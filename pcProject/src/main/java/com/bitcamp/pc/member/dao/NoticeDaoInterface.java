package com.bitcamp.pc.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.pc.member.model.NoticeVO;

public interface NoticeDaoInterface {

	void insertNotice(NoticeVO noticeVO) throws Exception;

	int pageCount() throws Exception;

	List<NoticeVO> selectList(@Param("firstRow") int firstRow, @Param("endRow") int endRow) throws Exception;

	NoticeVO selectView(int noticeId) throws Exception;

	void deleteNotice(int id) throws Exception;

	void updateNotice(NoticeVO noticeVO);
}
