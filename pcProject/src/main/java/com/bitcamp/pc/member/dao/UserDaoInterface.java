package com.bitcamp.pc.member.dao;

import java.util.List;

import com.bitcamp.pc.member.model.User;

public interface UserDaoInterface {

	public int insertMemberInfo(User member);

	public int ModifyMemberInfo(User member);

	public int DeleteMemberInfo(String userId);

	public User getMemberInfo(String userId);

	public List<User> getMemberAll();
}
