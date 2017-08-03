package com.service.controller;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pojo.Word;
import com.service.pojo.WordType;
import com.service.service.IWordService;
import com.service.service.IWordTypeService;

@Controller
@RequestMapping(value="/system/word")
public class WordController {
	
	@Resource
	private IWordService wordService;
	@Resource
	private IWordTypeService wordTypeService;
	
	@RequestMapping(value="")
	public String table(Model model,HttpServletRequest request){
		//System.out.println("/table");
		return "/system/word";
	}
	
	@RequestMapping(value="",params={"action=list"})
	@ResponseBody
	public Map<String,Object> wordList(Model model,HttpServletRequest request,HttpServletResponse response,int page,int rows){
		Map<String, Object> obj = new HashMap<String, Object>();
		List<Word> all = wordService.findAllWord(null);
		int start = rows*(page-1);
		int end = rows*page;
		if(end>=all.size()) end = all.size();
		if(start<=end){
			obj.put("rows", all.subList(start, end));
		}else{
			obj.put("rows", null);
		}
		obj.put("total", all.size());
		//System.out.println(all.toString());
		return obj;
	}
	
	@RequestMapping(value="",params={"action=getListByType"})
	@ResponseBody
	public Map<String,Object> typeList(Model model,HttpServletRequest request,HttpServletResponse response,int type){
		Map<String, Object> obj = new HashMap<String, Object>();
		Word word = new Word();
		word.setType(type);
		List<Word> all = wordService.findAllWord(word);
		obj.put("rows", all);
		obj.put("total", all.size());
		return obj;
	}
	
	@RequestMapping(value="",params={"action=getAllType"})
	@ResponseBody
	public Map<String,Object> getAllType(Model model,HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> obj = new HashMap<String, Object>();
		List<Word> all = wordService.findAllWord(null);
		//System.out.println(all.size());
		Set<String>allTypeName = new HashSet<String>();
		Map<String,Integer>allType = new HashMap<String, Integer>();
		for(Word word:all){
			//System.out.println("=="+word.getType_name());
			if(!allTypeName.contains(word.getType_name())){
				allTypeName.add(word.getType_name());
				allType.put(word.getType_name(), word.getType());
				//System.out.println(word.getType_name());
			}
		}
		obj.put("allTypeName", allTypeName);
		obj.put("allType", allType);
		return obj;
	}
	
	@RequestMapping(value="",params={"action=getAllTypeForCombobox"})
	@ResponseBody
	public List<Map<String, Object>> getAllTypeForCombobox(Model model,HttpServletRequest request,HttpServletResponse response){
		List<Map<String, Object>> allType  = new ArrayList<Map<String,Object>>();
		List<WordType> all = wordTypeService.findAllWordType(null);
		for(WordType wordType:all){
			Map<String, Object> obj = new HashMap<String, Object>();
			obj.put("id", wordType.getId());
			obj.put("text", wordType.getType_name());
			allType.add(obj);
		}
		
		return allType;
	}
	
	@RequestMapping(value="",params={"action=update"})
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request,int id,int type,String chinese,String english){
		Map<String, Object> map = new HashMap<String, Object>();
		Word word = wordService.findWordById(id);
		word.setChinese(chinese);
		word.setEnglish(english);
		word.setType(type);
		wordService.updateWord(word);
		map.put("success", true);
		map.put("successMsg", "更新成功");
		return map;
	}
	
	@RequestMapping(value="",params={"action=delete"})
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request,int id){
		Map<String, Object> map = new HashMap<String, Object>();
		wordService.deleteWordById(id);
		map.put("success", true);
		return map;
	}
	
	@RequestMapping(value="",params={"action=add"})
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request,int type,String chinese,String english){
		Map<String, Object> map = new HashMap<String, Object>();
		Word word = new Word();
		word.setChinese(chinese);
		word.setEnglish(english);
		word.setType(type);
		WordType wordType = wordTypeService.findWordTypeById(type);
		word.setType_name(wordType.getType_name());
		wordService.addWord(word);
		map.put("success", true);
		map.put("successMsg", "保存成功");
		return map;
	}
}
