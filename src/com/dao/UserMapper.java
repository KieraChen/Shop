package com.dao;

import java.util.List;

import com.domain.User;

public interface UserMapper {
	//登录验证,Ajax验证注册用户名
	public List<User> findUser(User user);
	
	//注册 添加用户
	public void insertUser(User user);
	
	
	

}
