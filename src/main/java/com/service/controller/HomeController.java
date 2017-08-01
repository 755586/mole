package com.service.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pojo.Menu;
import com.service.pojo.User;
import com.service.service.IMenuService;
import com.service.service.IUserService;

@Controller
@RequestMapping(value="/system/home")
public class HomeController {
	
	@Resource
	private IMenuService menuService;
	
	@RequestMapping(value="")
	public String table(HttpServletRequest request){
		//System.out.println("/table");
		return "/system/home";
	}
	
	
	
}
