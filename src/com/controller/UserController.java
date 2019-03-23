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
	//���ʵ�¼ҳ
	@RequestMapping("Login")
	public String Login(){
		return "Login";
	}
	
	//����ע��ҳ
	@RequestMapping("Register")
	public String Register(){
		return "Register";
	}
	
	//������֤��
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
	
	//Ajax��֤ע���û���
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
	
	//Ajax��֤ע���ֻ���
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
	
	
	//ע����֤
	@RequestMapping("checkRegister")
	public String checkRegister(Model model,User user,String passwordRepeat,HttpServletRequest request,String code){
		//��session�л�ȡ��֤��
		String ucode = request.getSession().getAttribute("code").toString();
		//�����֤ע��ֵ��ʽ
		Map<String, String> checkRegister = Tool.checkRegister(user, passwordRepeat,code,ucode);
		if(checkRegister.size()==0){//ע��ֵ��֤�ɹ�
			//���ע���û�
			userService.insertUser(user);
			return "Login";
		}else{
			/*for (String k : checkRegister.keySet()) {
				System.out.println("���֣�"+k+"���绰��"+checkRegister.get(k));
			}*/
			model.addAttribute("check", checkRegister);
			return "Register";
		}
		
		
		
	}
	
	//��¼��֤
	@RequestMapping("checkLogin")
	public String checkLogin(Model model,User user,String save,HttpServletRequest request, HttpServletResponse response){
		//�����֤��¼ֵ�ǿ�
		Map<String, String> checkLogin = Tool.checkLogin(user);
		if(checkLogin.size()==0){//��¼ֵ�ǿ�
			//�жϵ�¼��Ϣ�Ƿ���ȷ
			List<User> list = userService.findUser(user);
			
			if(list!= null){//��¼��Ϣ��ȷ
				User user1 = null;
				for (int i = 0; i < list.size(); i++) {
					user1=list.get(1);
				}
				//����cookie
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
				//����¼�û���Ϣ�浽session
				HttpSession session = request.getSession();
				session.setAttribute("user", user1);
				return "redirect:/product/Index.do";
			}else{//��¼��Ϣ����ȷ
				model.addAttribute("msg", "�û������������");
				return "Login";
			}
		}else{//��ֵ��¼
			model.addAttribute("check", checkLogin);
			return "Login";
		}
		
	}
	
	//��ȫ�˳�
	@RequestMapping("exit")
	public String exit(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		//��ɺ󷵻ص�¼ҳ
		return "redirect:/product/Index.do";
		
	}
			

}
