package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.SuperviseLibDao;
import com.cn.tbps.dto.SuperviseLibDto;
import com.cn.tbps.service.SuperviseLibService;

public class SuperviseLibServiceImpl extends BaseService implements SuperviseLibService {
	
	private SuperviseLibDao superviseLibDao;
	
	@Override
	public List<SuperviseLibDto> queryAllSuperviseLib() {
		return superviseLibDao.queryAllSuperviseLib();
	}

	@Override
	public Page querySuperviseLibByPage(String SUPERVISE_NAME, Page page) {
		SUPERVISE_NAME = StringUtil.replaceDatabaseKeyword_mysql(SUPERVISE_NAME);
		//查询总记录数
		int totalCount = superviseLibDao.querySuperviseLibCountByPage(SUPERVISE_NAME);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<SuperviseLibDto> list = superviseLibDao.querySuperviseLibByPage(SUPERVISE_NAME,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public List<SuperviseLibDto> querySuperviseLibByIds(String ids) {
		return superviseLibDao.querySuperviseLibByIds(ids);
	}

	@Override
	public SuperviseLibDto querySuperviseLibByID(String id) {
		return superviseLibDao.querySuperviseLibByID(id);
	}
	
	@Override
	public void deleteSuperviseLib(String id, String userid) {
		SuperviseLibDto superviseLib = superviseLibDao.querySuperviseLibByID(id);
		if(superviseLib != null) {
			superviseLib.setDELETE_FLG(Constants.IS_DELETE_DEL);
			superviseLib.setUPDATE_USER(userid);
			superviseLibDao.updateSuperviseLib(superviseLib);
		}
	}

	@Override
	public void insertSuperviseLib(SuperviseLibDto superviseLib) {
		superviseLibDao.insertSuperviseLib(superviseLib);
	}

	@Override
	public void updateSuperviseLib(SuperviseLibDto superviseLib) {
		superviseLibDao.updateSuperviseLib(superviseLib);
	}

	public SuperviseLibDao getSuperviseLibDao() {
		return superviseLibDao;
	}

	public void setSuperviseLibDao(SuperviseLibDao superviseLibDao) {
		this.superviseLibDao = superviseLibDao;
	}
}
