package com.bitcamp.pc.member.model;

import java.util.List;

public class NoticeListVO {
	private int noticeTotalCount;
	private int currentPageNum;
	private List<NoticeVO> noticeList;
	private int pageTotalCount;
	private int noticeCountPerPage;
	private int firstRow;
	private int endRow;

	public NoticeListVO(List<NoticeVO> noticeList, int noticeTotalCount, int currentPageNum, int noticeCountPerPage,
			int firstRow, int endRow) {
		this.noticeList = noticeList;
		this.noticeTotalCount = noticeTotalCount;
		this.currentPageNum = currentPageNum;
		this.noticeCountPerPage = noticeCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();

	}

	private void calculatePageTotalCount() {
		if (noticeTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = noticeTotalCount / noticeCountPerPage;
			if (noticeTotalCount % noticeCountPerPage > 0) {
				pageTotalCount++;
			}
		}

	}

	public int getnoticeTotalCount() {
		return noticeTotalCount;
	}

	public int getcurrentPageNum() {
		return currentPageNum;
	}

	public List<NoticeVO> getnoticeList() {
		return noticeList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getnoticeCountPerPage() {
		return noticeCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return noticeTotalCount == 0;
	}

}
