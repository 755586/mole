package com.service.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pojo.Menu;
import com.service.pojo.Menu;
import com.service.service.IMenuService;

@Controller
@RequestMapping(value="/system/menu")
public class MenuController {
	
	@Resource
	private IMenuService menuService;
	
	@RequestMapping(value="")
	public String menu(HttpServletRequest request){
		//System.out.println("/table");
		return "/system/menu";
	}
	
	@RequestMapping(value="",params={"action=nav"})
	@ResponseBody
	public Map<String,Object> nav(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> obj = new HashMap<String, Object>();
		List<Menu> allMenu = menuService.findAllMenu(null);
		Set<Integer>pIdSet = new HashSet<Integer>();
		Map<Integer,Menu>p_menu = new HashMap<Integer, Menu>();
		Map<Integer,List<Menu>>p_menus = new HashMap<Integer, List<Menu>>();
		//查询父菜单
		for(Menu menu:allMenu){
			int id = menu.getId();
			int pId = menu.getpId();
			if(menu.getState()==1&&(id==pId||pId==0)){
				pIdSet.add(pId);
				p_menu.put(pId, menu);
				p_menus.put(pId, new ArrayList<Menu>());
			}
		}
		//查询子菜单
		for(Menu menu:allMenu){
			if(menu.getState()==1){

				int pId = menu.getpId();
				if(pIdSet.contains(pId)){
					List<Menu> ms = p_menus.get(pId);
					ms.add(menu);
				}
			}
		}
		
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		for(Integer pId:pIdSet){
			Menu menu = p_menu.get(pId);
			List<Menu> menus = p_menus.get(pId);
			Map<String,Object> obj1 = new HashMap<String, Object>();
			obj1.put("menuid", menu.getpId());
			obj1.put("menuname", menu.getName());
			obj1.put("icon", menu.getIcon());
			obj1.put("url", menu.getUrl());
			if(menus!=null&&menus.size()>0){
				List<Map<String,Object>> dataList2 = new ArrayList<Map<String,Object>>();
				for(Menu menu2:menus){
					if(pId!=0&&menu2.getId()!=pId){
						Map<String,Object> obj2 = new HashMap<String, Object>();
						obj2.put("menuid", menu2.getpId());
						obj2.put("menuname", menu2.getName());
						obj2.put("icon", menu2.getIcon());
						obj2.put("url", menu2.getUrl());
						dataList2.add(obj2);
					}
				}
				obj1.put("menus", dataList2);
			}
			dataList.add(obj1);
		}
		obj.put("data", dataList);
		//{"data":[{"menus":[{"icon":null,"menuid":12,"menuname":"系统维护","url":"system"},{"icon":null,"menuid":12,"menuname":"系统维护","url":"system"},{"icon":null,"menuid":12,"menuname":"系统维护","url":"system"},{"icon":null,"menuid":12,"menuname":"系统维护","url":"system"}],"icon":null,"menuid":12,"menuname":"系统维护","url":"system"}]}
		return obj;
	}
	
	@RequestMapping(value="",params={"action=list"})
	@ResponseBody
	public Map<String,Object> menuList(HttpServletRequest request,HttpServletResponse response,int page,int rows){
		Map<String,Object> obj = new HashMap<String, Object>();
		List<Menu> all = menuService.findAllMenu(null);
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
	public Map<String, Object> update(HttpServletRequest request,int id,String name,String url,int pId,int state){
		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println("id:"+id);
//		System.out.println("name:"+name);
//		System.out.println("url:"+url);
//		System.out.println("pId"+pId);
		System.out.println("state"+state);
		Menu menu = menuService.findMenuById(id);
		menu.setName(name);
		menu.setUrl(url);
		menu.setpId(pId);
		menu.setState(state);
		menuService.updateMenu(menu);
		map.put("success", true);
		map.put("successMsg", "更新成功");
		return map;
	}
	
	@RequestMapping(value="",params={"action=delete"})
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request,int id){
		Map<String, Object> map = new HashMap<String, Object>();
		menuService.deleteMenuById(id);
		map.put("success", true);
		return map;
	}
	
	@RequestMapping(value="",params={"action=add"})
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request,String name,String url,int pId){
		Map<String, Object> map = new HashMap<String, Object>();
		Menu menu = new Menu();
		menu.setName(name);
		menu.setUrl(url);
		menu.setpId(pId);
		System.out.println("pId:"+pId);
		menuService.addMenu(menu);
		map.put("success", true);
		map.put("successMsg", "保存成功");
		
		return map;
	}
}
