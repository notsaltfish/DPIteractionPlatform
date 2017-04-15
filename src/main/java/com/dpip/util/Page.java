package com.dpip.util;

/**
 * 分页工具类
 * @param <T>
 */
public class Page<T> {
	private int page;//页码
	private int total;//总的记录数
	private int pageSize;//每页显示几条数据
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
