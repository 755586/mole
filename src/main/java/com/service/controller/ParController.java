package com.service.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pojo.Menu;
import com.service.pojo.Par;
import com.service.service.IMenuService;
import com.service.service.IParService;
import com.service.service.IUserService;

@Controller
@RequestMapping(value="/system/par")
public class ParController {
	
	@Resource
	private IParService parService;
	
	@RequestMapping(value="")
	public String table(HttpServletRequest request){
		//System.out.println("/table");
		return "/system/par";
	}
	@RequestMapping(value="",params={"action=list"})
	@ResponseBody
	public Map<String,Object> parList(Model model,HttpServletRequest request,HttpServletResponse response,int page,int rows){
		Map<String, Object> obj = new HashMap<String, Object>();
		List<Par> all = parService.findAllPar(null);
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
	public Map<String, Object> update(HttpServletRequest request,int id,String name,String value,String comment){
		Map<String, Object> map = new HashMap<String, Object>();
		Par par = parService.findParById(id);
		par.setName(name);
		par.setValue(value);
		par.setComment(comment);
		parService.updatePar(par);
		map.put("success", true);
		map.put("successMsg", "更新成功");
		return map;
	}
	
	@RequestMapping(value="",params={"action=delete"})
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request,int id){
		Map<String, Object> map = new HashMap<String, Object>();
		parService.deleteParById(id);
		map.put("success", true);
		return map;
	}
	
	@RequestMapping(value="",params={"action=add"})
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request,String name,String value,String comment){
		Map<String, Object> map = new HashMap<String, Object>();
		if(parService.findParByName(name)!=null){
			map.put("success", false);
			map.put("errorMsg", "用户名已存在");
		}else{
			Par par = new Par();
			par.setName(name);
			par.setValue(value);
			par.setComment(comment);
			parService.addPar(par);
			map.put("success", true);
			map.put("successMsg", "保存成功");
		}
		return map;
	}
}
