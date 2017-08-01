package com.service.service;

import java.util.List;

import com.service.pojo.WordType;


public interface IWordTypeService{
	List<WordType> findAllWordType(WordType wordType);
	WordType findWordTypeById(int id);
	WordType findWordTypeByName(String name);
	void updateWordType(WordType wordType);
	void addWordType(WordType wordType);
	void deleteWordTypeById(int id);
}
