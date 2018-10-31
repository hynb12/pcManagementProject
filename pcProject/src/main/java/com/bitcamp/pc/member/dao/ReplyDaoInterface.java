package com.bitcamp.pc.member.dao;

import java.util.List;

import com.bitcamp.pc.member.model.NoticeVO;
import com.bitcamp.pc.member.model.ReplyVO;

public interface ReplyDaoInterface {

	List<ReplyVO> replyList(int id) throws Exception;

	void insertReply(NoticeVO noticeVO) throws Exception;

	void updateReply(NoticeVO noticeVO) throws Exception;

	void deleteReply(int id) throws Exception;
}
