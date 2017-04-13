package com.dpip.util;

public class Page<T> {
	private int page;
	private int total;
	private int pageSize;
	private T entity;
	private int startRow;
	
	
	public int getStartRow() {
		return (page-1)*pageSize;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public T getEntity() {
		return entity;
	}
	public void setEntity(T entity) {
		this.entity = entity;
	}
	
	
}
