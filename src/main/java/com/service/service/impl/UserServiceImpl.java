package com.service.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.dao.IUserDao;
import com.service.pojo.User;
import com.service.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService{

	@Resource
	private IUserDao userDao;

	

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}

	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Override
	public void deleteUserById(int id) {
		userDao.deleteUserById(id);
	}

	@Override
	public List<User> findAllUser(User user) {
		// TODO Auto-generated method stub
		return userDao.findAllUser(user);
	}

	@Override
	public User findUserById(int id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(id);
	}

	@Override
	public User findUserByName(String name) {
		// TODO Auto-generated method stub
		return userDao.findUserByName(name);
	}


	
	
}
