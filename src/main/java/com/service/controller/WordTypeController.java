package com.service.controller;

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

import com.service.pojo.WordType;
import com.service.service.IWordService;
import com.service.service.IWordTypeService;

@Controller
@RequestMapping(value="/system/wordType")
public class WordTypeController {
	
	@Resource
	private IWordTypeService wordTypeService;
	
	@Resource
	private IWordService wordService;
	
	@RequestMapping(value="")
	public String table(HttpServletRequest request){
		//System.out.println("/table");
		return "/system/wordType";
	}
	
	@RequestMapping(value="",params={"action=list"})
	@ResponseBody
	public Map<String,Object> wordTypeList(Model model,HttpServletRequest request,HttpServletResponse response,int page,int rows){
		Map<String, Object> obj = new HashMap<String, Object>();
		List<WordType> all = wordTypeService.findAllWordType(null);
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
	
	@RequestMapping(value="",params={"action=getAllType"})
	@ResponseBody
	public Map<String,Object> getAllType(Model model,HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> obj = new HashMap<String, Object>();
		List<WordType> all = wordTypeService.findAllWordType(null);
		obj.put("allType", all);
		return obj;
	}
	
	@RequestMapping(value="",params={"action=update"})
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request,int id,String type_name){
		Map<String, Object> map = new HashMap<String, Object>();
		WordType wordType = wordTypeService.findWordTypeById(id);
		wordType.setType_name(type_name);
		wordTypeService.updateWordType(wordType);
		map.put("success", true);
		map.put("successMsg", "更新成功");
		return map;
	}
	
	@RequestMapping(value="",params={"action=delete"})
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request,int id){
		Map<String, Object> map = new HashMap<String, Object>();
		wordService.deleteWordByType(id);
		wordTypeService.deleteWordTypeById(id);
		map.put("success", true);
		return map;
	}
	
	@RequestMapping(value="",params={"action=add"})
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request,String type_name){
		Map<String, Object> map = new HashMap<String, Object>();
		WordType wordType = new WordType();
		wordType.setType_name(type_name);
		wordTypeService.addWordType(wordType);
		map.put("success", true);
		map.put("successMsg", "保存成功");
		return map;
	}
}
