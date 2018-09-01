package com.cn.common.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 翻页工具类
 * @name Page.java
 * @author Frank
 * @time 2013-9-24下午8:58:02
 * @version 1.0
 */
public class Page implements java.io.Serializable {

	private static final long serialVersionUID = 4401455863657857560L;
	// 页数据条数，默认为10条
	public static final int PAGESIZE = 10;
	// 当前页记录数
	private int pageSize;
	// 当前页数据
	private List<?> items;
	// 总记录数
	private int totalCount;
	// 起始页
	private int startIndex = 0;
	// 下一页
	private int nextIndex;
	// 前一页
	private int previousIndex;
	// 总页数
	private int totalPage;
	//跳转列表
	private List<Integer> skipList;

	public Page() {
		setPageSize(PAGESIZE);
		setStartIndex(0);
	}

	public Page(int pageSize) {
		setPageSize(pageSize);
		setStartIndex(0);
	}

	public Page(List<?> items, int totalCount) {
		setPageSize(pageSize);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(0);
	}

	public Page(List<?> items, int totalCount, int startIndex) {
		setPageSize(pageSize);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(startIndex);
	}

	public Page(List<?> items, int totalCount, int pageSize, int startIndex) {
		setPageSize(pageSize);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(startIndex);
	}

	public List<?> getItems() {
		return items;
	}

	public void setItems(List<?> items) {
		this.items = items;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if (totalCount > 0) {
			this.totalCount = totalCount;
			int count = totalCount / pageSize;
			if (totalCount % pageSize > 0) {
				count++;
			}
			for (int i = 0; i < count; i++) {
				totalPage++;
			}
		} else {
			this.totalCount = 0;
		}
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		if (totalCount <= 0) {
			this.startIndex = 0;
		} else if (startIndex >= totalPage) {
			this.startIndex = this.totalPage - 1;
		} else if (startIndex < 0) {
			this.startIndex = 0;
		} else {
			this.startIndex = startIndex;
		}
	}

	public int getNextIndex() {
		this.nextIndex = getStartIndex() + 1;
		if (nextIndex <= totalPage) {
			return this.nextIndex;
		} else {
			return getStartIndex();
		}
	}

	public int getPreviousIndex() {
		this.previousIndex = getStartIndex() - 1;
		if (previousIndex < -1) {
			return getStartIndex();
		} else {
			return previousIndex;
		}
	}

	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		return totalPage;
	}

	public List<Integer> getSkipList() {
		skipList = new ArrayList<Integer>();
		if(totalPage == 0) {
			skipList.add(1);
		} else if(totalPage <= 5) {
			//总页码小于5，则全部显示
			for(int i = 1; i <= totalPage; i++) {
				skipList.add(i);
			}
		} else {
			//总页码大于5，则根据当前页码显示
			if(startIndex <= 3) {
				for(int i = 1; i <= 5; i++) {
					skipList.add(i);
				}
			} else {
				if(startIndex + 1 >= totalPage) {
					for(int i = startIndex - 3; i <= startIndex + 1; i++) {
						skipList.add(i);
					}
				} else {
					for(int i = startIndex - 2; i <= startIndex + 2; i++) {
						skipList.add(i);
					}
				}
			}
		}
		return skipList;
	}

	public void setSkipList(List<Integer> skipList) {
		this.skipList = skipList;
	}
}