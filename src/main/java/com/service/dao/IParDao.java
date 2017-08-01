package com.service.dao;

import java.util.List;

import com.service.pojo.Par;


public interface IParDao{
	List<Par> findAllPar(Par par);
	Par findParById(int id);
	Par findParByName(String name);
	void updatePar(Par par);
	void addPar(Par par);
	void deleteParById(int id);
}
