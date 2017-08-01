package com.service.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.dao.IWordDao;
import com.service.pojo.Word;
import com.service.service.IWordService;

@Service("wordService")
public class WordServiceImpl implements IWordService{

	@Resource
	private IWordDao wordDao;

	

	@Override
	public void updateWord(Word word) {
		// TODO Auto-generated method stub
		wordDao.updateWord(word);
	}

	@Override
	public void addWord(Word word) {
		wordDao.addWord(word);
	}

	@Override
	public void deleteWordById(int id) {
		wordDao.deleteWordById(id);
	}

	@Override
	public List<Word> findAllWord(Word word) {
		// TODO Auto-generated method stub
		return wordDao.findAllWord(word);
	}

	@Override
	public Word findWordById(int id) {
		// TODO Auto-generated method stub
		return wordDao.findWordById(id);
	}

	@Override
	public Word findWordByName(String name) {
		// TODO Auto-generated method stub
		return wordDao.findWordByName(name);
	}

	@Override
	public void deleteWordByType(int type) {
		// TODO Auto-generated method stub
		wordDao.deleteWordByType(type);
	}


	
	
}
