package com.service.pojo;

import java.io.Serializable;

public class Premission implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int premssionId ;
	
	private String premssionName ;
	
	private int roleId ;

	public Premission() {
		super();
	}

	public int getPremssionId() {
		return premssionId;
	}

	public void setPremssionId(int premssionId) {
		this.premssionId = premssionId;
	}

	public String getPremssionName() {
		return premssionName;
	}

	public void setPremssionName(String premssionName) {
		this.premssionName = premssionName;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	@Override
	public String toString() {
		return "Premission [premssionId=" + premssionId + ", premssionName=" + premssionName + ", roleId=" + roleId
				+ "]";
	}
	
	
	
	

}
