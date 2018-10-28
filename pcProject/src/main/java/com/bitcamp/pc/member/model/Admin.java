package com.bitcamp.pc.member.model;

public class Admin {

	private String adminId;
	private String adminName;
	private String adminPw;

	public Admin() {

	}

	public Admin(String adminId, String adminName, String adminPw) {

		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPw = adminPw;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminName=" + adminName + ", adminPw=" + adminPw + "]";
	}

}