package com.service.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.dao.IMenuDao;
import com.service.pojo.Menu;
import com.service.service.IMenuService;

@Service("menuService")
public class MenuServiceImpl implements IMenuService{

	@Resource
	private IMenuDao menuDao;

	

	@Override
	public void updateMenu(Menu menu) {
		// TODO Auto-generated method stub
		menuDao.updateMenu(menu);
	}

	@Override
	public void addMenu(Menu menu) {
		menuDao.addMenu(menu);
	}

	@Override
	public void deleteMenuById(int id) {
		menuDao.deleteMenuById(id);
	}

	@Override
	public List<Menu> findAllMenu(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.findAllMenu(menu);
	}

	@Override
	public Menu findMenuById(int id) {
		// TODO Auto-generated method stub
		return menuDao.findMenuById(id);
	}

	@Override
	public Menu findMenuByName(String name) {
		// TODO Auto-generated method stub
		return menuDao.findMenuByName(name);
	}


	
	
}
