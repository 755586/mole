package com.service.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pojo.User;
import com.service.service.IUserService;

@Controller
@RequestMapping(value="/system/user")
public class UserController {
	
	@Resource
	private IUserService userService;
	
	@RequestMapping(value="")
	public String table(HttpServletRequest request){
		//System.out.println("/table");
		return "/system/user";
	}
	
	@RequestMapping(value="",params={"action=list"})
	@ResponseBody
	public Map<String,Object> userList(Model model,HttpServletRequest request,HttpServletResponse response,int page,int rows){
		Map<String, Object> obj = new HashMap<String, Object>();
		List<User> all = userService.findAllUser(null);
		int start = rows*(page-1);
		int end = rows*page;
		if(end>=all.size()) end = all.size();
		if(start<=end){
			obj.put("rows", all.subList(start, end));
		}else{
			obj.put("rows", null);
		}
		obj.put("total", all.size());
		return obj;
	}
	@RequestMapping(value="",params={"action=update"})
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request,int id,String name,String password){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userService.findUserById(id);
		user.setPassword(password);
		userService.updateUser(user);
		map.put("success", true);
		map.put("successMsg", "更新成功");
		return map;
	}
	
	@RequestMapping(value="",params={"action=delete"})
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request,int id){
		Map<String, Object> map = new HashMap<String, Object>();
		userService.deleteUserById(id);
		map.put("success", true);
		return map;
	}
	
	@RequestMapping(value="",params={"action=add"})
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request,String name,String password){
		Map<String, Object> map = new HashMap<String, Object>();
		if(userService.findUserByName(name)!=null){
			map.put("success", false);
			map.put("errorMsg", "用户名已存在");
		}else{
			User user = new User();
			user.setName(name);
			user.setPassword(password);
			user.setLogin_time(new Date());
			userService.addUser(user);
			map.put("success", true);
			map.put("successMsg", "保存成功");
		}
		return map;
	}
}
