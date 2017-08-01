package com.service.dao;

import java.util.List;

import com.service.pojo.User;


public interface IUserDao{
	List<User> findAllUser(User user);
	User findUserById(int id);
	User findUserByName(String name);
	void updateUser(User user);
	void addUser(User user);
	void deleteUserById(int id);
}
