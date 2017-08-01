package com.service.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.dao.IParDao;
import com.service.pojo.Par;
import com.service.service.IParService;

@Service("parService")
public class ParServiceImpl implements IParService{

	@Resource
	private IParDao parDao;

	

	@Override
	public void updatePar(Par par) {
		// TODO Auto-generated method stub
		parDao.updatePar(par);
	}

	@Override
	public void addPar(Par par) {
		parDao.addPar(par);
	}

	@Override
	public void deleteParById(int id) {
		parDao.deleteParById(id);
	}

	@Override
	public List<Par> findAllPar(Par par) {
		// TODO Auto-generated method stub
		return parDao.findAllPar(par);
	}

	@Override
	public Par findParById(int id) {
		// TODO Auto-generated method stub
		return parDao.findParById(id);
	}

	@Override
	public Par findParByName(String name) {
		// TODO Auto-generated method stub
		return parDao.findParByName(name);
	}


	
	
}
