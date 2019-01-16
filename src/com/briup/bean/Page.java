package com.briup.bean;
/**
 * 分页管理
 *
 * @param <T>
 */
public class Page<T> {
	private int page;
	private int pageSize;
	private T entity;

	public int getPage() {
		return page;
	}

	public Page<T> setPage(int page) {
		this.page = page;
		return this;
	}

	public int getPageSize() {
		return pageSize;
	}

	public Page<T> setPageSize(int pageSize) {
		this.pageSize = pageSize;
		return this;
	}

	public int getOffset() {
		return (page - 1) * pageSize;
	}

	public T getEntity() {
		return entity;
	}

	public Page<T> setEntity(T entity) {
		this.entity = entity;
		return this;
	}
}
