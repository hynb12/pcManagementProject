package com.bitcamp.pc.member.model;

import org.apache.ibatis.type.Alias;

@Alias("orderVO")
public class OrderVO {
	private int orderId;
	private int comId;
	private String userId;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getComId() {
		return comId;
	}
	public void setComId(int comId) {
		this.comId = comId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ", comId=" + comId + ", userId=" + userId + "]";
	}
	
}
