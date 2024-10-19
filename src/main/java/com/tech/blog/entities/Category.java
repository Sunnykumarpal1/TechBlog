package com.tech.blog.entities;

public class Category {
	private int CId;
	private String CName;
	private String CDescription;

	public Category(int cId, String cName, String cDescription) {
		super();
		CId = cId;
		CName = cName;
		CDescription = cDescription;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCId() {
		return CId;
	}

	public void setCId(int cId) {
		CId = cId;
	}

	public String getCName() {
		return CName;
	}

	public void setCName(String cName) {
		CName = cName;
	}

	public String getCDescription() {
		return CDescription;
	}

	public void setCDescription(String cDescription) {
		CDescription = cDescription;
	}

	@Override
	public String toString() {
		return "Category [CId=" + CId + ", CName=" + CName + ", CDescription=" + CDescription + "]";
	}

}
