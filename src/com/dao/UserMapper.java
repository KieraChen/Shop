package com.dao;

import java.util.List;

import com.domain.User;

public interface UserMapper {
	//��¼��֤,Ajax��֤ע���û���
	public List<User> findUser(User user);
	
	//ע�� ����û�
	public void insertUser(User user);
	
	
	

}
