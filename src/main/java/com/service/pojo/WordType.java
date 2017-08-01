package com.service.pojo;

import java.io.Serializable;

public class WordType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String type_name;
	public WordType() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	@Override
	public String toString() {
		return "WordType [id=" + id + ", type_name="
				+ type_name + "]";
	}
	
	
	
	
}
