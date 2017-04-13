package com.dpip.util;

import java.util.List;

public class ResponseData<T> {
	private int total;
	private List<T> datas;
	private Page page;
	
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
		this.total = datas.size();
	}
	
	
}
