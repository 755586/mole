package com.service.service;

import java.util.List;

import com.service.pojo.Menu;


public interface IMenuService{
	List<Menu> findAllMenu(Menu menu);
	Menu findMenuById(int id);
	Menu findMenuByName(String name);
	void updateMenu(Menu menu);
	void addMenu(Menu menu);
	void deleteMenuById(int id);
}
