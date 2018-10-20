package com.cn.tbps.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.MesgDao;
import com.cn.tbps.dao.UserInfoDao;
import com.cn.tbps.dto.MesgDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.MesgService;

public class MesgServiceImpl implements MesgService {
	
	private MesgDao mesgDao;
	private UserInfoDao userInfoDao;

	@Override
	public Page queryMesgByPage(String MSG_TITLE, String MSG_TYPE, String SEND_USER, String RECEIVE_USER, String SEND_STATUS,
			String RECEIVE_STATUS, Page page) {
		MSG_TITLE = StringUtil.replaceDatabaseKeyword_mysql(MSG_TITLE);
		//查询总记录数
		int totalCount = mesgDao.queryMesgCountByPage(MSG_TITLE, "", SEND_USER, RECEIVE_USER, SEND_STATUS, RECEIVE_STATUS);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<MesgDto> list = mesgDao.queryMesgByPage(MSG_TITLE, "", SEND_USER, RECEIVE_USER, SEND_STATUS, RECEIVE_STATUS,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		if(list != null && list.size() > 0) {
			List<UserInfoDto> userList = userInfoDao.queryAllUser();
			Map<String, String> userMap = new HashMap<String, String>();
			if(userList != null && userList.size() > 0) {
				for(UserInfoDto user : userList) {
					userMap.put(user.getLOGIN_ID(), user.getLOGIN_NAME());
				}
			}
			for(MesgDto mesg : list) {
				mesg.setSEND_USER_NAME(userMap.get(mesg.getSEND_USER()));
				mesg.setRECEIVE_USER_NAME(userMap.get(mesg.getRECEIVE_USER()));
			}
		}
		page.setItems(list);
		return page;
	}

	@Override
	public MesgDto queryMesgByID(String MSG_SEQ) {
		MesgDto mesg = mesgDao.queryMesgByID(MSG_SEQ);
		if(mesg != null) {
			List<UserInfoDto> userList = userInfoDao.queryAllUser();
			Map<String, String> userMap = new HashMap<String, String>();
			if(userList != null && userList.size() > 0) {
				for(UserInfoDto user : userList) {
					userMap.put(user.getLOGIN_ID(), user.getLOGIN_NAME());
				}
			}
			mesg.setSEND_USER_NAME(userMap.get(mesg.getSEND_USER()));
			mesg.setRECEIVE_USER_NAME(userMap.get(mesg.getRECEIVE_USER()));
		}
		return mesg;
	}

	@Override
	public List<MesgDto> queryAllMesg(String SEND_USER, String RECEIVE_USER, String SEND_STATUS,
			String RECEIVE_STATUS) {
		List<MesgDto> list = mesgDao.queryAllMesg(SEND_USER, RECEIVE_USER, SEND_STATUS, RECEIVE_STATUS);
		if(list != null && list.size() > 0) {
			List<UserInfoDto> userList = userInfoDao.queryAllUser();
			Map<String, String> userMap = new HashMap<String, String>();
			if(userList != null && userList.size() > 0) {
				for(UserInfoDto user : userList) {
					userMap.put(user.getLOGIN_ID(), user.getLOGIN_NAME());
				}
			}
			for(MesgDto mesg : list) {
				mesg.setSEND_USER_NAME(userMap.get(mesg.getSEND_USER()));
				mesg.setRECEIVE_USER_NAME(userMap.get(mesg.getRECEIVE_USER()));
			}
		}
		return list;
	}
	
	@Override
	public void insertMesgBatch(MesgDto mesg, String sendUserid, String rank) {
		if("1".equals(mesg.getSendAllFlag())) {
			//发送所有人
			MesgDto tmpMesg = null;
			List<UserInfoDto> userList = userInfoDao.queryAllUser();
			if(userList != null && userList.size() > 0) {
				for(UserInfoDto user : userList) {
					//判断rank是否有值
					if(StringUtil.isNotBlank(rank)) {
						//只发给rank小的
						if(rank.compareTo(user.getRANK()) >= 0) {
							//不发给自己
							//if(!sendUserid.equals(user.getLOGIN_ID())) {
								tmpMesg = new MesgDto();
								//收件人
								tmpMesg.setRECEIVE_USER(user.getLOGIN_ID());
								//消息标题
								tmpMesg.setMSG_TITLE(mesg.getMSG_TITLE());
								//消息内容
								tmpMesg.setMSG_CONTENT(mesg.getMSG_CONTENT());
								//消息类型：10发送，20接收
								tmpMesg.setMSG_TYPE("10");
								//发件状态：10新增，20已经发送，30删除
								tmpMesg.setSEND_STATUS("20");
								//收件状态：10未打开，20已打开，30删除
								tmpMesg.setRECEIVE_STATUS("10");
								tmpMesg.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
								//发件人
								tmpMesg.setSEND_USER(sendUserid);
								tmpMesg.setUPDATE_USER(sendUserid);
								mesgDao.insertMesg(tmpMesg);
							//}
						}
					} else {
						//不发给自己
						//if(!sendUserid.equals(user.getLOGIN_ID())) {
							tmpMesg = new MesgDto();
							//收件人
							tmpMesg.setRECEIVE_USER(user.getLOGIN_ID());
							//消息标题
							tmpMesg.setMSG_TITLE(mesg.getMSG_TITLE());
							//消息内容
							tmpMesg.setMSG_CONTENT(mesg.getMSG_CONTENT());
							//消息类型：10发送，20接收
							tmpMesg.setMSG_TYPE("10");
							//发件状态：10新增，20已经发送，30删除
							tmpMesg.setSEND_STATUS("20");
							//收件状态：10未打开，20已打开，30删除
							tmpMesg.setRECEIVE_STATUS("10");
							tmpMesg.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
							//发件人
							tmpMesg.setSEND_USER(sendUserid);
							tmpMesg.setUPDATE_USER(sendUserid);
							mesgDao.insertMesg(tmpMesg);
						//}
					}
				}
			}
		} else {
			//发给指定的人
			//消息类型：10发送，20接收
			mesg.setMSG_TYPE("10");
			//发件状态：10新增，20已经发送，30删除
			mesg.setSEND_STATUS("20");
			//收件状态：10未打开，20已打开，30删除
			mesg.setRECEIVE_STATUS("10");
			mesg.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
			//发件人
			mesg.setSEND_USER(sendUserid);
			mesg.setUPDATE_USER(sendUserid);
			mesgDao.insertMesg(mesg);
		}
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

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}
}
