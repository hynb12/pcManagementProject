package com.bitcamp.pc.member.model;

import org.apache.ibatis.type.Alias;

@Alias("orderListVo")
public class OrderListVO {
	private int orderId;
	private int foodId;
	private String foodName;
	private int foodCnt;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getFoodId() {
		return foodId;
	}
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodCnt() {
		return foodCnt;
	}
	public void setFoodCnt(int foodCnt) {
		this.foodCnt = foodCnt;
	}
	
	@Override
	public String toString() {
		return "OrderListVO [orderId=" + orderId + ", foodId=" + foodId + ", foodName=" + foodName + ", foodCnt="
				+ foodCnt + "]";
	}
	
}
