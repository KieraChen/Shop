package com.service;

import java.util.List;

import com.domain.User;

public interface IUserService {
	//��¼��֤
	public List<User> findUser(User user);
	
	//ע�� ����û�
	public void insertUser(User user);

}
