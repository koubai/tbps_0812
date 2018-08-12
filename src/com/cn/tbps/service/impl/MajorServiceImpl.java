package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.MajorDao;
import com.cn.tbps.dto.MajorDto;
import com.cn.tbps.service.MajorService;

/**
 * @name MajorServiceImpl.java
 * @author Frank
 * @time 2016-7-19下午9:31:31
 * @version 1.0
 */
public class MajorServiceImpl implements MajorService {
	
	private MajorDao majorDao;

	@Override
	public Page queryMajorByPage(String MAJORCODE, Page page) {
		MAJORCODE = StringUtil.replaceDatabaseKeyword_mysql(MAJORCODE);
		//查询总记录数
		int totalCount = majorDao.queryMajorCountByPage(MAJORCODE);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<MajorDto> list = majorDao.queryMajorByPage(MAJORCODE,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public MajorDto queryMajorByID(String ID) {
		return majorDao.queryMajorByID(ID);
	}
	
	@Override
	public MajorDto queryMajorByCode(String code) {
		return majorDao.queryMajorByCode(code);
	}

	@Override
	public List<MajorDto> queryAllMajor(String MAJORTYPE, String MAJORCODE) {
		List<MajorDto> list = majorDao.queryAllMajor(MAJORTYPE, MAJORCODE);
//		if(list == null) {
//			return new ArrayList<MajorDto>();
//		}
		return list;
	}

	@Override
	public void insertMajor(MajorDto major) {
		majorDao.insertMajor(major);
	}

	@Override
	public void updateMajor(MajorDto major) {
		majorDao.updateMajor(major);
	}

	public MajorDao getMajorDao() {
		return majorDao;
	}

	public void setMajorDao(MajorDao majorDao) {
		this.majorDao = majorDao;
	}
}
