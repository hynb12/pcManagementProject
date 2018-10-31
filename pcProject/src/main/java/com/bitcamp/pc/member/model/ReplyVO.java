package com.bitcamp.pc.member.model;

import org.apache.ibatis.type.Alias;

@Alias("replyVO")
public class ReplyVO {

	private int replyId;
	private int noId;
	private String replyCon;

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public int getNoId() {
		return noId;
	}

	public void setNoId(int noId) {
		this.noId = noId;
	}

	public String getReplyCon() {
		return replyCon;
	}

	public void setReplyCon(String replyCon) {
		this.replyCon = replyCon;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", noId=" + noId + ", replyCon=" + replyCon + "]";
	}

}
