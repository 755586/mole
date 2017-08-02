package com.service.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pojo.User;
import com.service.service.IUserService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Resource
	private IUserService userService;
	
	@RequestMapping(value="")
	public String table(HttpServletRequest request){
		//System.out.println("/table");
		return "/login";
	}
	@RequestMapping(value="",params={"action=exit"})
	public String exit(HttpServletRequest request){
		//System.out.println("/table");
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		return "/login";
	}
	@RequestMapping(value="",params={"action=checkUserForSystem"})
	@ResponseBody
	public Map<String,Object> checkUserForSystem(HttpServletRequest request){
		//System.out.println("/login?action=checkUser");
		Map<String, Object> obj = new HashMap<String, Object>();
		String name = request.getParameter("username");
		String pwd = request.getParameter("password");
		//System.out.println(name+"=="+pwd);
		User user = new User();
		user.setName(name);
		user = userService.findUserByName(name);
		//System.out.println(user);
		if(user!=null&&pwd.equals(user.getPassword())){
			obj.put("msg", "登录成功!");
			obj.put("user", user);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		}
//		if(name.equals("admin")&&pwd.equals("admin")){
//			user.setName(name);
//			user.setPassword(pwd);
//			obj.put("msg", "登录成功!");
//			obj.put("user", user);
//			HttpSession session = request.getSession();
//			session.setAttribute("user", user);
//		}
		else{
			obj.put("msg", "用户名或密码错误!");
			obj.put("user", null);
		}
		return obj;
	}
	
	@RequestMapping(value="",params={"action=checkUser"})
	@ResponseBody
	public Map<String,Object> checkUser(HttpServletRequest request){
		//System.out.println("/login?action=checkUser");
		Map<String, Object> obj = new HashMap<String, Object>();
		String name = request.getParameter("username");
		String pwd = request.getParameter("password");
		//System.out.println(name+"=="+pwd);
		User user = new User();
		user.setName(name);
		user = userService.findUserByName(name);
		//System.out.println(user);
		if(user!=null&&pwd.equals(user.getPassword())){
			obj.put("msg", "登录成功!");
			obj.put("user", user);
		}else{
			obj.put("msg", "用户名或密码错误!");
			obj.put("user", null);
		}
		return obj;
	}
}
