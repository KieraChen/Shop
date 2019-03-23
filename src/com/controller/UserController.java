package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;








import org.springframework.web.bind.annotation.ResponseBody;

import cn.dsna.util.images.ValidateCode;

import com.domain.User;
import com.service.IUserService;
import com.util.Tool;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private IUserService userService;
	//访问登录页
	@RequestMapping("Login")
	public String Login(){
		return "Login";
	}
	
	//访问注册页
	@RequestMapping("Register")
	public String Register(){
		return "Register";
	}
	
	//产生验证码
	@RequestMapping("getCode")
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ValidateCode vc = new ValidateCode(80,40,4,10);
		String code = vc.getCode();
		HttpSession session = request.getSession();
		session.setAttribute("code", code);
		System.out.println(code);
		vc.write(response.getOutputStream());
		return null;
	}
	
	//Ajax验证注册用户名
	@RequestMapping("checkName")
	@ResponseBody
	public void checkName(String username,HttpServletResponse response) throws IOException{
		User user = new User();
		user.setUsername(username);
		List<User> list = userService.findUser(user);
		if(list.size()>0){
			PrintWriter out = response.getWriter();
			out.print("nameExist");
		}	
		
	};
	
	//Ajax验证注册手机号
		@RequestMapping("checkPhone")
		@ResponseBody
		public void checkPhone(String phone,HttpServletResponse response) throws IOException{
			User user = new User();
			user.setPhone(phone);
			List<User> list = userService.findUser(user);
			if(list.size()>0){
				PrintWriter out = response.getWriter();
				out.print("phoneExist");
			}	
			
		};
	
	
	//注册验证
	@RequestMapping("checkRegister")
	public String checkRegister(Model model,User user,String passwordRepeat,HttpServletRequest request,String code){
		//从session中获取验证码
		String ucode = request.getSession().getAttribute("code").toString();
		//后端验证注册值格式
		Map<String, String> checkRegister = Tool.checkRegister(user, passwordRepeat,code,ucode);
		if(checkRegister.size()==0){//注册值验证成功
			//添加注册用户
			userService.insertUser(user);
			return "Login";
		}else{
			/*for (String k : checkRegister.keySet()) {
				System.out.println("名字："+k+"，电话："+checkRegister.get(k));
			}*/
			model.addAttribute("check", checkRegister);
			return "Register";
		}
		
		
		
	}
	
	//登录验证
	@RequestMapping("checkLogin")
	public String checkLogin(Model model,User user,String save,HttpServletRequest request, HttpServletResponse response){
		//后端验证登录值非空
		Map<String, String> checkLogin = Tool.checkLogin(user);
		if(checkLogin.size()==0){//登录值非空
			//判断登录信息是否正确
			List<User> list = userService.findUser(user);
			
			if(list!= null){//登录信息正确
				User user1 = null;
				for (int i = 0; i < list.size(); i++) {
					user1=list.get(1);
				}
				//设置cookie
				if("1".equals(save)){
					String name = user1.getUsername();
					String pass = user1.getPassword();
					
					Cookie cookie1 = new Cookie("c_name",name);
					Cookie cookie2 = new Cookie("c_pass",pass);
					
					cookie1.setMaxAge(60*60*24*7);
					cookie2.setMaxAge(60*60*24*7);
					
					response.addCookie(cookie1);
					response.addCookie(cookie2);
					
				}
				//将登录用户信息存到session
				HttpSession session = request.getSession();
				session.setAttribute("user", user1);
				return "redirect:/product/Index.do";
			}else{//登录信息不正确
				model.addAttribute("msg", "用户名或密码错误！");
				return "Login";
			}
		}else{//空值登录
			model.addAttribute("check", checkLogin);
			return "Login";
		}
		
	}
	
	//安全退出
	@RequestMapping("exit")
	public String exit(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		//完成后返回登录页
		return "redirect:/product/Index.do";
		
	}
			

}
