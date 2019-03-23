package com.util;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import com.domain.User;


public class Tool {
	//检查登录非空
	public static Map<String, String> checkLogin(User user){
		Map<String,String> map = new HashMap<String,String>();
		if(user.getUsername()==null || user.getUsername().trim()=="" ){
			map.put("username", "用户名不能为空！");		
		}
		if(user.getPassword()==null || user.getPassword().trim()==""){
			map.put("password", "密码不能为空！");
		}
		
		return map;
		
	}
	
	//检查注册格式
	public static Map<String, String> checkRegister(User user,String passwordRepeat,String code,String ucode){
		Map<String,String> map = new HashMap<String,String>();
		if(!ucode.equalsIgnoreCase(code)){
			map.put("code", "验证码错误！");	
		}
		if(user.getUsername()==null || user.getUsername().trim()=="" ){
			map.put("username", "用户名不能为空！");		
		}
		if(user.getPassword()==null || user.getPassword().trim()==""){
			map.put("password", "密码不能为空！");
		}else{
			if(!user.getPassword().equals(passwordRepeat)){
				map.put("passwordRepeat", "两次密码不同！");
			}
		}
		String emailRegex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
		if(user.getEmail()==null || user.getEmail().trim()=="" || !Pattern.matches(emailRegex, user.getEmail())){
			map.put("email", "邮箱格式错误！");
		}
		// "[1]"代表第1位为数字1，"[358]"代表第二位可以为3、5、8中的一个，"\\d{9}"代表后面是可以是0～9的数字，有9位。
		String telRegex = "^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8]))\\d{8}$";
		if(user.getPhone()==null || user.getPhone().trim()=="" || !user.getPhone().matches(telRegex)){
			map.put("phone", "手机号格式错误！");
		}
		return map;
		
	}
	

}
