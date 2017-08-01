package com.service.dao;

import java.util.List;

import com.service.pojo.WordType;


public interface IWordTypeDao{
	List<WordType> findAllWordType(WordType wordType);
	WordType findWordTypeById(int id);
	WordType findWordTypeByName(String name);
	void updateWordType(WordType wordType);
	void addWordType(WordType wordType);
	void deleteWordTypeById(int id);
}
