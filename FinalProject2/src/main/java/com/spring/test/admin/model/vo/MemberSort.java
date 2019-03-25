package com.spring.test.admin.model.vo;

public class MemberSort {
	private int sort1;
	private int sort2;
	private String search;
	
	public MemberSort() {}

	public int getSort1() {
		return sort1;
	}

	public void setSort1(int sort1) {
		this.sort1 = sort1;
	}

	public int getSort2() {
		return sort2;
	}

	public void setSort2(int sort2) {
		this.sort2 = sort2;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "MemberSort [sort1=" + sort1 + ", sort2=" + sort2 + ", search=" + search + "]";
	}
	
	
}
