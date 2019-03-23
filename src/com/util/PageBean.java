package com.util;

import java.util.List;

public class PageBean<T> {
	//��ǰҳ��
	private Integer pageNow;
	//�ܼ�¼��
	private Integer rowCount;
	//��ҳ��
	private Integer pageCount;
	//ÿҳ��ʾ��¼��
	private Integer pageSize;
	//��װ���ݵļ���
	private List<T> list;
	//��װ��¼��ʼλ��
	private Integer startLimit;
	
	public Integer getPageNow() {
		return pageNow;
	}
	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}
	public Integer getRowCount() {
		return rowCount;
	}
	public void setRowCount(Integer rowCount) {
		this.rowCount = rowCount;
	}
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public Integer getStartLimit() {
		return startLimit;
	}
	public void setStartLimit(Integer startLimit) {
		this.startLimit = startLimit;
	}
	

}
