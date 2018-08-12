package com.cn.tbps.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.ExpertLibDao;
import com.cn.tbps.dao.MajorDao;
import com.cn.tbps.dto.ExpertLibDto;
import com.cn.tbps.dto.MajorDto;
import com.cn.tbps.service.ExpertLibService;

/**
 * @name ExpertLibServiceImpl.java
 * @author Frank
 * @time 2013-10-19下午9:20:36
 * @version 1.0
 */
public class ExpertLibServiceImpl extends BaseService implements ExpertLibService {
	
	private static final Logger log = LogManager.getLogger(ExpertLibServiceImpl.class);
	
	private ExpertLibDao expertLibDao;
	private MajorDao majorDao;
	
	@Override
	public List<ExpertLibDto> queryAllExpertLibExportNew(String EXPERT_NAME,
			String QUERY_EXPERT_MAJOR) {
		EXPERT_NAME = StringUtil.replaceDatabaseKeyword_mysql(EXPERT_NAME);
		QUERY_EXPERT_MAJOR = getMajorSql(QUERY_EXPERT_MAJOR);
		
		List<ExpertLibDto> list = expertLibDao.queryAllExpertLibExportNew(EXPERT_NAME, QUERY_EXPERT_MAJOR);
		if(list != null && list.size() > 0) {
			List<MajorDto> allMajorList = majorDao.queryAllMajor("", "");
			for(ExpertLibDto expert : list) {
				//专业名称
				expert.setEXPERT_MAJOR_NAME(changeMajorCode2MajorName(expert.getEXPERT_MAJOR(), allMajorList));
			}
		}
		return list;
	}

	@Override
	public Page queryExpertLibByPageNew(String EXPERT_NAME,
			String QUERY_EXPERT_MAJOR, Page page) {
		EXPERT_NAME = StringUtil.replaceDatabaseKeyword_mysql(EXPERT_NAME);
		QUERY_EXPERT_MAJOR = getMajorSql(QUERY_EXPERT_MAJOR);
		//查询总记录数
		int totalCount = expertLibDao.queryExpertLibCountByPageNew(EXPERT_NAME, QUERY_EXPERT_MAJOR);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<ExpertLibDto> list = expertLibDao.queryExpertLibByPageNew(EXPERT_NAME, QUERY_EXPERT_MAJOR,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		if(list != null && list.size() > 0) {
			List<MajorDto> allMajorList = majorDao.queryAllMajor("", "");
			for(ExpertLibDto expert : list) {
				//专业名称
				expert.setEXPERT_MAJOR_NAME(changeMajorCode2MajorName(expert.getEXPERT_MAJOR(), allMajorList));
			}
		}
		page.setItems(list);
		return page;
	}
	
	@Override
	public List<ExpertLibDto> autoQueryExpertLibNew(String expertMajor,
			String isRandom, String expertName, String isInclude, String expertComp) {
		List<ExpertLibDto> outExpertLibList = new ArrayList<ExpertLibDto>();
		log.info("expertMajor=" + expertMajor);
		if(StringUtil.isNotBlank(expertMajor)) {
			//根据专家查询条件循环
			String[] majorCountList = expertMajor.split(",");
			if (majorCountList != null && majorCountList.length > 0) {
				String strWithoutExpertNameList = "";
				List<MajorDto> allMajorList = majorDao.queryAllMajor("", "");
				for(String strExpertMajor : majorCountList) {
					if(!"".equals(strExpertMajor)) {
						//格式：major#num
						String[] major = strExpertMajor.split("#");
						//查询专家列表，添加逗号是为了防止查询到别的专业数据
						List<ExpertLibDto> list = expertLibDao.autoQueryExpertLibNew(strWithoutExpertNameList, "," + major[0], expertName, isInclude, expertComp);
						if("1".equals(isRandom)) {
							//随机取N个专家
							if(list != null && list.size() > 0) {
								Integer num = Integer.valueOf(major[1]);
								if(list.size() > num) {
									//专家数大于选取数，则随机选取
									List<ExpertLibDto> randomList = getRandomList(list, num);
									for(ExpertLibDto expert : randomList) {
										//设置当前专家的所属专业
										expert.setAUTO_MARJOR(major[0]);
										expert.setEXPERT_MAJOR_NAME(changeMajorCode2MajorName(expert.getEXPERT_MAJOR(), allMajorList));
										outExpertLibList.add(expert);
										
										//将当前专家ID记录下，下个循环查询中屏蔽这个专家ID
										if("".equals(strWithoutExpertNameList)) {
											strWithoutExpertNameList += "" + expert.getEXPERT_SEQ();
										} else {
											strWithoutExpertNameList += "," + expert.getEXPERT_SEQ();
										}
									}
								} else {
									//专家数小于等于选取数，则全部添加
									for(ExpertLibDto expert : list) {
										//设置当前专家的所属专业
										expert.setAUTO_MARJOR(major[0]);
										expert.setEXPERT_MAJOR_NAME(changeMajorCode2MajorName(expert.getEXPERT_MAJOR(), allMajorList));
										outExpertLibList.add(expert);
										
										//将当前专家ID记录下，下个循环查询中屏蔽这个专家ID
										if("".equals(strWithoutExpertNameList)) {
											strWithoutExpertNameList += "" + expert.getEXPERT_SEQ();
										} else {
											strWithoutExpertNameList += "," + expert.getEXPERT_SEQ();
										}
									}
								}
							}
						} else {
							//非随机，则取所有记录
							if(list != null && list.size() > 0) {
								for(ExpertLibDto expert : list) {
									//设置当前专家的所属专业
									expert.setAUTO_MARJOR(major[0]);
									expert.setEXPERT_MAJOR_NAME(changeMajorCode2MajorName(expert.getEXPERT_MAJOR(), allMajorList));
									outExpertLibList.add(expert);
									
									//将当前专家ID记录下，下个循环查询中屏蔽这个专家ID
									if("".equals(strWithoutExpertNameList)) {
										strWithoutExpertNameList += "" + expert.getEXPERT_SEQ();
									} else {
										strWithoutExpertNameList += "," + expert.getEXPERT_SEQ();
									}
								}
							}
						}
					}
				}
			}
		} else {
			//查询所有专家记录
			List<ExpertLibDto> list = expertLibDao.autoQueryExpertLibNew("", "", expertName, isInclude, expertComp);
			if(list != null && list.size() > 0) {
				//设置专业名
				List<MajorDto> allMajorList = majorDao.queryAllMajor("", "");
				for(ExpertLibDto expert : list) {
					expert.setEXPERT_MAJOR_NAME(changeMajorCode2MajorName(expert.getEXPERT_MAJOR(), allMajorList));
				}
				outExpertLibList = list;
			}
		}
		return outExpertLibList;
	}
	
	@Override
	public List<ExpertLibDto> autoQueryExpertLib(String expertMajor, String isRandom, List<String> majornumList) {
		List<ExpertLibDto> outExpertLibList = new ArrayList<ExpertLibDto>();
		log.info("expertMajor=" + expertMajor);
		if("1".equals(isRandom)) {
			//根据专家查询条件循环
			String[] majorCountList = expertMajor.split(",");
			if (majorCountList != null && majorCountList.length > 0) {
				String strWithoutExpertNameList = "";
				for(String strExpertMajor : majorCountList) {
					if(!"".equals(strExpertMajor)) {
						//查询专家列表
						List<ExpertLibDto> list = expertLibDao.autoQueryExpertLib(strWithoutExpertNameList, strExpertMajor);
						//随机取N个专家
						if(list != null && list.size() > 0) {
							
							Integer num = Integer.valueOf(majornumList.get(sixteen2num(strExpertMajor) - 1));
							if(list.size() > num) {
								//专家数大于选取数，则随机选取
								List<ExpertLibDto> randomList = getRandomList(list, num);
								for(ExpertLibDto expert : randomList) {
									//设置当前专家的所属专业
									expert.setAUTO_MARJOR(strExpertMajor);
									outExpertLibList.add(expert);
									
									//将当前专家ID记录下，下个循环查询中屏蔽这个专家ID
									if("".equals(strWithoutExpertNameList)) {
										strWithoutExpertNameList += "" + expert.getEXPERT_SEQ();
									} else {
										strWithoutExpertNameList += "," + expert.getEXPERT_SEQ();
									}
								}
							} else {
								//专家数小于等于选取数，则全部添加
								for(ExpertLibDto expert : list) {
									//设置当前专家的所属专业
									expert.setAUTO_MARJOR(strExpertMajor);
									outExpertLibList.add(expert);
									
									//将当前专家ID记录下，下个循环查询中屏蔽这个专家ID
									if("".equals(strWithoutExpertNameList)) {
										strWithoutExpertNameList += "" + expert.getEXPERT_SEQ();
									} else {
										strWithoutExpertNameList += "," + expert.getEXPERT_SEQ();
									}
								}
							}
						}
					}
				}
			}
		} else {
			//正常查询
			if(StringUtil.isNotBlank(expertMajor)) {
				expertMajor = expertMajor.substring(0, expertMajor.length() - 1);
			} else {
				//默认查询所有专家
				expertMajor = "1,2,3,4,5,6,7,8,9,A,B,C,D,E,F";
			}
			String major = "";
			for(int i = 0; i < expertMajor.length(); i++) {
				major += "T.EXPERT_MAJOR like " + "'%" + expertMajor.substring(i, i + 1) + "%' or ";
			}
			if(major.length() > 0) {
				major = major.substring(0, major.length() - 3);
				major = "(" + major + ")";
			}
			outExpertLibList = expertLibDao.queryAllExpertLibOr(major);
		}
		return outExpertLibList;
	}
	
	@Override
	public List<ExpertLibDto> queryExpertLibByIds(String ids) {
		if(StringUtil.isNotBlank(ids)) {
			ids = ids.substring(0, ids.length() - 1);
			log.info("ids=" + ids);
			List<ExpertLibDto> list = expertLibDao.queryExpertLibByIds(ids);
			if(list != null && list.size() > 0) {
				//设置专业名
				List<MajorDto> allMajorList = majorDao.queryAllMajor("", "");
				for(ExpertLibDto expert : list) {
					expert.setEXPERT_MAJOR_NAME(changeMajorCode2MajorName(expert.getEXPERT_MAJOR(), allMajorList));
				}
			}
			return list;
		}
		return new ArrayList<ExpertLibDto>();
	}

	@Override
	public Page queryExpertLibByPageOr(Page page, String expertName,
			String strExpertMajor) {
		String major = "";
		if("00000000000000000000000000000000000".equals(strExpertMajor)) {
			major = "";
		} else {
			//模糊查询专业
			strExpertMajor = strExpertMajor.replace("0", "");
			for(int i = 0; i < strExpertMajor.length(); i++) {
				major += "T.EXPERT_MAJOR like " + "'%" + strExpertMajor.substring(i, i + 1) + "%' or ";
			}
			if(major.length() > 0) {
				major = major.substring(0, major.length() - 3);
				major = "(" + major + ")";
			}
		}
		log.info("major=" + major);
		expertName = StringUtil.replaceDatabaseKeyword_mysql(expertName);
		//查询总记录数
		int totalCount = expertLibDao.queryExpertLibCountByPageOr(expertName, major);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<ExpertLibDto> list = expertLibDao.queryExpertLibByPageOr(expertName, major,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}
	
	@Override
	public Page queryExpertLibByPageAnd(Page page, String expertName,
			String strExpertMajor) {
		if("00000000000000000000000000000000000".equals(strExpertMajor)) {
			strExpertMajor = "";
		} else {
			//模糊查询专业
			strExpertMajor = "%" + strExpertMajor.replace("0", "%") + "%";
			while(strExpertMajor.indexOf("%%") >= 0) {
				strExpertMajor = strExpertMajor.replace("%%", "%");
			}
		}
		log.info("strExpertMajor=" + strExpertMajor);
		
		expertName = StringUtil.replaceDatabaseKeyword_mysql(expertName);
		//查询总记录数
		int totalCount = expertLibDao.queryExpertLibCountByPageAnd(expertName, strExpertMajor);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<ExpertLibDto> list = expertLibDao.queryExpertLibByPageAnd(expertName, strExpertMajor,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}
	
	/**
	 * 组织模糊查询SQL
	 * @param QUERY_EXPERT_MAJOR
	 * @return
	 */
	private String getMajorSql(String QUERY_EXPERT_MAJOR) {
		String tmpMajorSql = "";
		if(StringUtil.isNotBlank(QUERY_EXPERT_MAJOR)) {
			String[] majorList = QUERY_EXPERT_MAJOR.split(",");
			for(String major : majorList) {
				//模糊查询SQL
				if(StringUtil.isNotBlank(major)) {
					if(StringUtil.isNotBlank(tmpMajorSql)) {
						//添加逗号为了防止查询到别的专业
						tmpMajorSql += " or T.EXPERT_MAJOR LIKE '%" + "," + major + "%' ";
					} else {
						tmpMajorSql += " T.EXPERT_MAJOR LIKE '%" + "," + major + "%' ";
					}
				}
			}
			if(StringUtil.isNotBlank(tmpMajorSql)) {
				tmpMajorSql = "(" + tmpMajorSql + ")";
			}
		}
		return tmpMajorSql;
	}
	
	/**
	 * 从list中随机选取n个，这里n必须比list.size小
	 * @param list
	 * @param num
	 * @return
	 */
	private List<ExpertLibDto> getRandomList(List<ExpertLibDto> list, int n) {
		List<ExpertLibDto> resultList = new ArrayList<ExpertLibDto>();
		Random random = new Random();
		ExpertLibDto expert = null;
		for(int i = 0; i < n; i++) {
			//随机到一个数字
			int index = random.nextInt(list.size());
			//取得当前随机到的专家
			expert = list.get(index);
			resultList.add(expert);
			//从总的list中移除该专家，以便继续随机
			list.remove(index);
		}
		return resultList;
	}
	
	/**
	 * 根据专业Code获得对应的专业名称
	 * @param major 格式：,majorcode,majorcode,majorcode,...
	 * @param list 所有专业数据
	 * @return
	 */
	private String changeMajorCode2MajorName(String majorcode, List<MajorDto> list) {
		String majorname = "";
		if(StringUtil.isNotBlank(majorcode)) {
			for(MajorDto major : list) {
				if(majorcode.indexOf("," + major.getMAJORCODE() + ",") >= 0) {
					majorname += major.getMAJORNAME() + "，";
				}
			}
		}
		if(StringUtil.isNotBlank(majorname)) {
			majorname = majorname.substring(0, majorname.length() - 1);
		}
		return majorname;
	}

	@Override
	public ExpertLibDto queryExpertLibByID(String expertSeq) {
		return expertLibDao.queryExpertLibByID(expertSeq);
	}

	@Override
	public List<ExpertLibDto> queryAllExpertLib() {
		return expertLibDao.queryAllExpertLib();
	}

	@Override
	public void insertExpertLib(ExpertLibDto expertLib) {
		expertLibDao.insertExpertLib(expertLib);
	}

	@Override
	public void updateExpertLib(ExpertLibDto expertLib) {
		expertLibDao.updateExpertLib(expertLib);
	}

	@Override
	public void deleteExpertLib(String expertSeq, String username) {
		ExpertLibDto expertLib = expertLibDao.queryExpertLibByID(expertSeq);
		if(expertLib != null) {
			//删除标记=已删除
			expertLib.setDELETE_FLG(Constants.IS_DELETE_DEL);
			expertLib.setUPDATE_USER(username);
			expertLibDao.updateExpertLib(expertLib);
		}
	}
	
	@Override
	public List<ExpertLibDto> queryAllExpertLibExportOr(String expertName,
			String strExpertMajor) {
		String major = "";
		if("00000000000000000000000000000000000".equals(strExpertMajor)) {
			major = "";
		} else {
			//模糊查询专业
			strExpertMajor = strExpertMajor.replace("0", "");
			for(int i = 0; i < strExpertMajor.length(); i++) {
				major += "T.EXPERT_MAJOR like " + "'%" + strExpertMajor.substring(i, i + 1) + "%' or ";
			}
			if(major.length() > 0) {
				major = major.substring(0, major.length() - 3);
				major = "(" + major + ")";
			}
		}
		expertName = StringUtil.replaceDatabaseKeyword_mysql(expertName);
		return expertLibDao.queryAllExpertLibExportOr(expertName, major);
	}

	@Override
	public List<ExpertLibDto> queryAllExpertLibExportAnd(String expertName,
			String strExpertMajor) {
		if("00000000000000000000000000000000000".equals(strExpertMajor)) {
			strExpertMajor = "";
		}
		expertName = StringUtil.replaceDatabaseKeyword_mysql(expertName);
		return expertLibDao.queryAllExpertLibExportAnd(expertName, strExpertMajor);
	}

	@Override
	public List<ExpertLibDto> queryExpertComp() {
		return expertLibDao.queryExpertComp();
	}
	
	private int sixteen2num(String s) {
		if("A".equals(s)) {
			return 10;
		} else if("B".equals(s)) {
			return 11;
		} else if("C".equals(s)) {
			return 12;
		} else if("D".equals(s)) {
			return 13;
		} else if("E".equals(s)) {
			return 14;
		} else if("F".equals(s)) {
			return 15;
		} else {
			return Integer.valueOf(s);
		}
	}
	
	public ExpertLibDao getExpertLibDao() {
		return expertLibDao;
	}

	public void setExpertLibDao(ExpertLibDao expertLibDao) {
		this.expertLibDao = expertLibDao;
	}

	public MajorDao getMajorDao() {
		return majorDao;
	}

	public void setMajorDao(MajorDao majorDao) {
		this.majorDao = majorDao;
	}
}
