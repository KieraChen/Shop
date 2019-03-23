package com.service;

import java.util.List;

import com.domain.User;

public interface IUserService {
	//登录验证
	public List<User> findUser(User user);
	
	//注册 添加用户
	public void insertUser(User user);

}
