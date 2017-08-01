package com.service.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.dao.IWordTypeDao;
import com.service.pojo.WordType;
import com.service.service.IWordTypeService;

@Service("wordTypeService")
public class WordTypeServiceImpl implements IWordTypeService{

	@Resource
	private IWordTypeDao wordDao;

	

	@Override
	public void updateWordType(WordType word) {
		// TODO Auto-generated method stub
		wordDao.updateWordType(word);
	}

	@Override
	public void addWordType(WordType word) {
		wordDao.addWordType(word);
	}

	@Override
	public void deleteWordTypeById(int id) {
		wordDao.deleteWordTypeById(id);
	}

	@Override
	public List<WordType> findAllWordType(WordType word) {
		// TODO Auto-generated method stub
		return wordDao.findAllWordType(word);
	}

	@Override
	public WordType findWordTypeById(int id) {
		// TODO Auto-generated method stub
		return wordDao.findWordTypeById(id);
	}

	@Override
	public WordType findWordTypeByName(String name) {
		// TODO Auto-generated method stub
		return wordDao.findWordTypeByName(name);
	}


	
	
}
