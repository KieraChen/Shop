package com.util;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import com.domain.User;


public class Tool {
	//����¼�ǿ�
	public static Map<String, String> checkLogin(User user){
		Map<String,String> map = new HashMap<String,String>();
		if(user.getUsername()==null || user.getUsername().trim()=="" ){
			map.put("username", "�û�������Ϊ�գ�");		
		}
		if(user.getPassword()==null || user.getPassword().trim()==""){
			map.put("password", "���벻��Ϊ�գ�");
		}
		
		return map;
		
	}
	
	//���ע���ʽ
	public static Map<String, String> checkRegister(User user,String passwordRepeat,String code,String ucode){
		Map<String,String> map = new HashMap<String,String>();
		if(!ucode.equalsIgnoreCase(code)){
			map.put("code", "��֤�����");	
		}
		if(user.getUsername()==null || user.getUsername().trim()=="" ){
			map.put("username", "�û�������Ϊ�գ�");		
		}
		if(user.getPassword()==null || user.getPassword().trim()==""){
			map.put("password", "���벻��Ϊ�գ�");
		}else{
			if(!user.getPassword().equals(passwordRepeat)){
				map.put("passwordRepeat", "�������벻ͬ��");
			}
		}
		String emailRegex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
		if(user.getEmail()==null || user.getEmail().trim()=="" || !Pattern.matches(emailRegex, user.getEmail())){
			map.put("email", "�����ʽ����");
		}
		// "[1]"�����1λΪ����1��"[358]"����ڶ�λ����Ϊ3��5��8�е�һ����"\\d{9}"��������ǿ�����0��9�����֣���9λ��
		String telRegex = "^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8]))\\d{8}$";
		if(user.getPhone()==null || user.getPhone().trim()=="" || !user.getPhone().matches(telRegex)){
			map.put("phone", "�ֻ��Ÿ�ʽ����");
		}
		return map;
		
	}
	

}
