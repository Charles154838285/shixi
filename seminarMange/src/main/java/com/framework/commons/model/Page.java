package com.framework.commons.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page<T> {
	/**当前页*/
	private int pageNow = 1;
	/**每页显示条数*/
	private int pageSize = 5;
	/**总记录数*/
	private int totalCount;
	/**总页数，需要通过总记录和每页显示条数计算得到结果*/
	private int totalPages;
	/**计算索引Limit后面开始的位置，（pageNow-1）*pageSize */
	private int offset;
	/**分页的结果集*/
	private List<T> datas;
	/**保存查询条件*/
	private Map<String,String> queryMap = new HashMap<>();

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPages() {
		boolean bool = (this.totalCount%this.pageSize==0);
		int page = this.totalCount/this.pageSize;
		totalPages = bool?page:page+1;
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getOffset() {
		offset=(pageNow-1)*pageSize;
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public Map<String, String> getQueryMap() {
		return queryMap;
	}

	public void setQueryMap(Map<String, String> queryMap) {
		this.queryMap = queryMap;
	}
}
