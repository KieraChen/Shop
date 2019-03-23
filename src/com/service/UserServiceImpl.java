package com.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserMapper;
import com.domain.User;

@Service
public class UserServiceImpl implements IUserService {

	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<User> findUser(User user) {
		List<User> list = userMapper.findUser(user);
		return list;
	}

	@Override
	public void insertUser(User user) {
		userMapper.insertUser(user);
		
	}

}
