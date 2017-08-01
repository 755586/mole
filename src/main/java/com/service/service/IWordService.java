package com.service.service;

import java.util.List;

import com.service.pojo.Word;


public interface IWordService{
	List<Word> findAllWord(Word word);
	Word findWordById(int id);
	Word findWordByName(String name);
	void updateWord(Word word);
	void addWord(Word word);
	void deleteWordById(int id);
	void deleteWordByType(int type);
}
