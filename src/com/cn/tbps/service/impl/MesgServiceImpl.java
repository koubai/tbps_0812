package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dao.MesgDao;
import com.cn.tbps.dto.MesgDto;
import com.cn.tbps.service.MesgService;

public class MesgServiceImpl implements MesgService {
	
	private MesgDao mesgDao;

	@Override
	public Page queryMesgByPage(String MSG_TYPE, String SEND_USER, String RECEIVE_USER, String SEND_STATUS,
			String RECEIVE_STATUS, Page page) {
		//查询总记录数
		int totalCount = mesgDao.queryMesgCountByPage(MSG_TYPE, SEND_USER, RECEIVE_USER, SEND_STATUS, RECEIVE_STATUS);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<MesgDto> list = mesgDao.queryMesgByPage(MSG_TYPE, SEND_USER, RECEIVE_USER, SEND_STATUS, RECEIVE_STATUS,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public MesgDto queryMesgByID(String MSG_SEQ) {
		return mesgDao.queryMesgByID(MSG_SEQ);
	}

	@Override
	public List<MesgDto> queryAllMesg(String SEND_USER, String RECEIVE_USER, String SEND_STATUS,
			String RECEIVE_STATUS) {
		return mesgDao.queryAllMesg(SEND_USER, RECEIVE_USER, SEND_STATUS, RECEIVE_STATUS);
	}

	@Override
	public void insertMesg(MesgDto mesg) {
		mesgDao.insertMesg(mesg);
	}

	@Override
	public void updateMesg(MesgDto mesg) {
		mesgDao.updateMesg(mesg);
	}

	public MesgDao getMesgDao() {
		return mesgDao;
	}

	public void setMesgDao(MesgDao mesgDao) {
		this.mesgDao = mesgDao;
	}
}
