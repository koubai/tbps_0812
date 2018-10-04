package com.cn.tbps.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.cn.common.service.BaseService;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.BidCompApplyDao;
import com.cn.tbps.dao.BidCompDao;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.service.BidCompService;

/**
 * @name BidCompServiceImpl.java
 * @author Frank
 * @time 2013-11-1下午8:59:13
 * @version 1.0
 */
public class BidCompServiceImpl extends BaseService implements BidCompService {
	
	private static final Logger log = LogManager.getLogger(BidCompServiceImpl.class);
	
	private BidCompDao bidCompDao;
	
	private BidCompApplyDao bidCompApplyDao;
	
	private ApplicationContext ctx;

	
	@Override
	public List<BidCompDto> queryBidCompByIds(String ids) {
		if(StringUtil.isNotBlank(ids)) {
			ids = ids.substring(0, ids.length() - 1);
			log.info("ids=" + ids);
			List<BidCompDto> bidCompList = bidCompDao.queryBidCompByIds(ids);
			if(bidCompList != null && bidCompList.size() > 0) {
				for(BidCompDto bidComp : bidCompList) {
					//查询报名内容
					bidComp.setListBidCompApply(bidCompApplyDao.queryBidCompApplyByBidCoNo("" + bidComp.getBID_CO_NO()));
				}
			}
			return bidCompList;
		}
		return new ArrayList<BidCompDto>();
	}

	@Override
	public Page queryBidCompByPage(String bidNo, String bidCoSeq,
			String bidCoNo, Page page) {
		bidNo = StringUtil.replaceDatabaseKeyword_mysql(bidNo);
		bidCoSeq = StringUtil.replaceDatabaseKeyword_mysql(bidCoSeq);
		bidCoNo = StringUtil.replaceDatabaseKeyword_mysql(bidCoNo);
		//查询总记录数
		int totalCount = bidCompDao.queryBidCompCountByPage(bidNo, bidCoSeq, bidCoNo);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<BidCompDto> list = bidCompDao.queryBidCompByPage(bidNo, bidCoSeq, bidCoNo,				
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public BidCompDto queryBidCompByID(String bidCoNo) {
		return bidCompDao.queryBidCompByID(bidCoNo);
	}

	@Override
	public BidCompDto queryAllBidCompByID(String bidCoNo) {
		return bidCompDao.queryAllBidCompByID(bidCoNo);
	}
	
	@Override
	public List<BidCompDto> queryBidCompByName(String bidCompName){
		return bidCompDao.queryBidCompByName(bidCompName);
	}

	@Override
	public void insertBidComp(BidCompDto bidCompDto) {
		bidCompDao.insertBidComp(bidCompDto);
	}

	@Override
	public void updateBidComp(BidCompDto bidCompDto) {
		bidCompDao.updateBidComp(bidCompDto);
	}

	@Override
	public List<BidCompDto> queryAllBidCompExport(String bidNo,
			String bidCoSeq, String bidCoNo) {
		List<BidCompDto> list = bidCompDao.queryAllBidCompExport(bidNo, bidCoSeq, bidCoNo);
		if(list != null && list.size() > 0) {
			for(BidCompDto bidComp : list) {
				//查询报名内容
				bidComp.setListBidCompApply(bidCompApplyDao.queryBidCompApplyByBidCoNo("" + bidComp.getBID_CO_NO()));
			}
		}
		return list;
	}

	public BidCompDao getBidCompDao() {
		return bidCompDao;
	}

	public void setBidCompDao(BidCompDao bidCompDao) {
		this.bidCompDao = bidCompDao;
	}

	public BidCompApplyDao getBidCompApplyDao() {
		return bidCompApplyDao;
	}

	public void setBidCompApplyDao(BidCompApplyDao bidCompApplyDao) {
		this.bidCompApplyDao = bidCompApplyDao;
	}
	
	public ApplicationContext getCtx() {
		return ctx;
	}

	public void setCtx(ApplicationContext ctx) {
		this.ctx = ctx;
	}

	// 从数据库中取得各类数据，放入JSON，
    public JSONArray  getCompNameData(String compName) {  
        System.out.println("compName:" + compName);
        JSONArray jsonArr = new JSONArray();
        try {
        	List<BidCompDto>  bidcomplist = new ArrayList<BidCompDto>();
        	bidcomplist = bidCompDao.queryBidCompByName(compName);


        	//Add user information into json array 
            JSONObject item = null;  
            
            if (bidcomplist.size()>0) {
            	for (int i=0; i<bidcomplist.size(); i++){
                	BidCompDto bidcompdto = bidcomplist.get(i);                	
                    item = new JSONObject(); 
                	item.put("BID_CO_NAME", bidcompdto.getBID_CO_NAME());
                	item.put("BID_CO_MANAGER", bidcompdto.getBID_CO_MANAGER());
                	item.put("BID_CO_TEL", bidcompdto.getBID_CO_TEL());
                	item.put("BID_CO_ADD", bidcompdto.getBID_CO_ADD());
                	item.put("BID_CO_PS", bidcompdto.getBID_CO_PS());
                	/*** 负责人*/
                	item.put("RESERVE2", (bidcompdto.getRESERVE2()==null)?"":bidcompdto.getRESERVE2());

                	/*** 负责人联系方式*/
                	item.put("RESERVE3", (bidcompdto.getRESERVE3()==null)?"":bidcompdto.getRESERVE3());

                	/*** 组织机构代码证*/
                	item.put("RESERVE4", (bidcompdto.getRESERVE4()==null)?"":bidcompdto.getRESERVE4());

                	/*** 固定电话*/
                	item.put("RESERVE5", (bidcompdto.getRESERVE5()==null)?"":bidcompdto.getRESERVE5());
                	
                	/*** 传真*/
                	item.put("RESERVE6", (bidcompdto.getRESERVE6()==null)?"":bidcompdto.getRESERVE6());
                	
                	/*** 法定代表人*/
                	item.put("RESERVE7", (bidcompdto.getRESERVE7()==null)?"":bidcompdto.getRESERVE7());
                	
                	/*** 企业注册资金*/
                	item.put("RESERVE8", (bidcompdto.getRESERVE8()==null)?"":bidcompdto.getRESERVE8());

                	System.out.println("GetData:" + item);
                	jsonArr.add(item);            	
            	}        	
            } 
            
        	System.out.println("JO: " + jsonArr.toString());
		}
        catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 		
        return(jsonArr);  
    }	


}
