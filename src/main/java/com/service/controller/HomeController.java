package com.service.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.service.IMenuService;

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
