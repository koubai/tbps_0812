package com.cn.tbps.action;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.service.BidService;

public class BidProgressAction extends BaseAction {
	
	private static final long serialVersionUID = -2501840176312926947L;

	private static final Logger log = LogManager.getLogger(BidAction.class);
	
	private String strBID_NO;    //招标编号
	private BidService bidService;
	
	private String Status0101;   //新项目登记
	private String Status0102;   //招标公告发布
	private String Status0103;   //发送答疑、补充文件
	private String Status0104;   //专家抽取、通知
	private String Status0105;   //招投标文件送至甲方
	private String Status0106;   //完成
	private String Status0107;
	private String Status0108;
	private String Status0201;   //招标文件编制
	private String Status0202;   //报名登记表编制
	private String Status0203;
	private String Status0204;   //专家费申请
	private String Status0205;   //中标通知书签收
	private String Status0206;
	private String Status0207;
	private String Status0208;
	private String Status0301;   //统稿
	private String Status0302;   //投标单位录入
	private String Status0303;
	private String Status0304;   //开标完成
	private String Status0305;   //评标报告装订扫描
	private String Status0306;
	private String Status0307;
	private String Status0308;
	private String Status0401;   //招标公告、文件校对
	private String Status0402;   //二次公告
	private String Status0403;
	private String Status0404;   //评标完成
	private String Status0405;   //评标报告送至甲方
	private String Status0406;
	private String Status0407;
	private String Status0408;
	private String Status0501;   //招标文件定稿
	private String Status0502;   //报名审核表编制
	private String Status0503;
	private String Status0504;   //中标公告发布
	private String Status0505;   //中标投标文件扫描
	private String Status0506;
	private String Status0507;
	private String Status0508;
	private String Status0601;
	private String Status0602;   //标书费收取
	private String Status0603;
	private String Status0604;
	private String Status0605;   //标书费开票完成
	private String Status0606;
	private String Status0607;
	private String Status0608;
	private String Status0701;
	private String Status0702;   //保证金收取
	private String Status0703;
	private String Status0704;
	private String Status0705;   //退保证金完成
	private String Status0706;
	private String Status0707;
	private String Status0708;
	private String Status0801;
	private String Status0802;   //招标文件装订
	private String Status0803;
	private String Status0804;
	private String Status0805;
	private String Status0806;
	private String Status0807;
	private String Status0808;
	

	/**
	 * 显示项目状态信息
	 * @return
	 */
	public String showBidProgressAction() {
		try {
			System.out.println("showBidProgressAction");
			System.out.println("招标编号：" + strBID_NO);
			BidDto bidDto= new BidDto(); 
			//bidDto = bidService.queryBidByID(strBID_NO);
			bidDto.setPROGRESS_STATUS("92000000000000000000000000000000000000000000000000");
			if (bidDto != null){
				setBidProgressStatus(bidDto);
			}
			this.clearMessages();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	public void setBidProgressStatus(BidDto bidDto) {
		if (bidDto != null){
			String bidStatusInfo = bidDto.getPROGRESS_STATUS();
			
			//新项目登记
			setStatus0101(bidStatusInfo.substring(0,1));
			//招标公告发布
			setStatus0102(bidStatusInfo.substring(1,2));
			//发送答疑、补充文件
			setStatus0103(bidStatusInfo.substring(2,3));
			//专家抽取、通知
			setStatus0104(bidStatusInfo.substring(4,5));
			//招投标文件送至甲方
			setStatus0105(bidStatusInfo.substring(5,6));
			//招标文件编制
			setStatus0201(bidStatusInfo.substring(6,7));
			//报名登记表编制
			setStatus0202(bidStatusInfo.substring(7,8));
			setStatus0203(bidStatusInfo.substring(8,9));
			//专家费申请
			setStatus0204(bidStatusInfo.substring(9,10));
			//中标通知书签收
			setStatus0205(bidStatusInfo.substring(10,11));
			//统稿
			setStatus0301(bidStatusInfo.substring(11,12));
			//投标单位录入
			setStatus0302(bidStatusInfo.substring(12,13));
			setStatus0303(bidStatusInfo.substring(13,14));
			//开标完成
			setStatus0304(bidStatusInfo.substring(14,15));
			//评标报告装订扫描
			setStatus0305(bidStatusInfo.substring(15,16));
			//招标公告、文件校对
			setStatus0401(bidStatusInfo.substring(16,17));
			//二次公告
			setStatus0402(bidStatusInfo.substring(17,18));
			setStatus0403(bidStatusInfo.substring(18,19));
			//评标完成
			setStatus0404(bidStatusInfo.substring(19,20));
			//评标报告送至甲方
			setStatus0405(bidStatusInfo.substring(20,21));
			//招标文件定稿
			setStatus0501(bidStatusInfo.substring(21,22));
			//报名审核表编制
			setStatus0502(bidStatusInfo.substring(22,23));
			setStatus0503(bidStatusInfo.substring(23,24));
			//中标公告发布
			setStatus0504(bidStatusInfo.substring(24,25));
			//中标投标文件扫描
			setStatus0505(bidStatusInfo.substring(25,26));
			setStatus0601(bidStatusInfo.substring(26,27));
			//标书费收取
			setStatus0602(bidStatusInfo.substring(27,28));
			setStatus0603(bidStatusInfo.substring(28,29));
			setStatus0604(bidStatusInfo.substring(29,30));
			//标书费开票完成
			setStatus0605(bidStatusInfo.substring(30,31));
			setStatus0701(bidStatusInfo.substring(31,32));
			//保证金收取
			setStatus0702(bidStatusInfo.substring(32,33));
			setStatus0703(bidStatusInfo.substring(33,34));
			setStatus0704(bidStatusInfo.substring(34,35));
			//退保证金完成
			setStatus0705(bidStatusInfo.substring(35,36));
			setStatus0801(bidStatusInfo.substring(36,37));
			//招标文件装订
			setStatus0802(bidStatusInfo.substring(37,38));
			setStatus0803(bidStatusInfo.substring(38,39));
			setStatus0804(bidStatusInfo.substring(39,40));
			setStatus0805(bidStatusInfo.substring(40,41));
		}		
	}
	


	public String getStatus0101() {
		return Status0101;
	}



	public void setStatus0101(String status0101) {
		Status0101 = status0101;
	}



	public String getStatus0102() {
		return Status0102;
	}



	public void setStatus0102(String status0102) {
		Status0102 = status0102;
	}



	public String getStatus0103() {
		return Status0103;
	}



	public void setStatus0103(String status0103) {
		Status0103 = status0103;
	}



	public String getStatus0104() {
		return Status0104;
	}



	public void setStatus0104(String status0104) {
		Status0104 = status0104;
	}



	public String getStatus0105() {
		return Status0105;
	}



	public void setStatus0105(String status0105) {
		Status0105 = status0105;
	}



	public String getStatus0106() {
		return Status0106;
	}



	public void setStatus0106(String status0106) {
		Status0106 = status0106;
	}



	public String getStatus0107() {
		return Status0107;
	}



	public void setStatus0107(String status0107) {
		Status0107 = status0107;
	}



	public String getStatus0108() {
		return Status0108;
	}



	public void setStatus0108(String status0108) {
		Status0108 = status0108;
	}



	public String getStatus0201() {
		return Status0201;
	}



	public void setStatus0201(String status0201) {
		Status0201 = status0201;
	}



	public String getStatus0202() {
		return Status0202;
	}



	public void setStatus0202(String status0202) {
		Status0202 = status0202;
	}



	public String getStatus0203() {
		return Status0203;
	}



	public void setStatus0203(String status0203) {
		Status0203 = status0203;
	}



	public String getStatus0204() {
		return Status0204;
	}



	public void setStatus0204(String status0204) {
		Status0204 = status0204;
	}



	public String getStatus0205() {
		return Status0205;
	}



	public void setStatus0205(String status0205) {
		Status0205 = status0205;
	}



	public String getStatus0206() {
		return Status0206;
	}



	public void setStatus0206(String status0206) {
		Status0206 = status0206;
	}



	public String getStatus0207() {
		return Status0207;
	}



	public void setStatus0207(String status0207) {
		Status0207 = status0207;
	}



	public String getStatus0208() {
		return Status0208;
	}



	public void setStatus0208(String status0208) {
		Status0208 = status0208;
	}



	public String getStatus0301() {
		return Status0301;
	}



	public void setStatus0301(String status0301) {
		Status0301 = status0301;
	}



	public String getStatus0302() {
		return Status0302;
	}



	public void setStatus0302(String status0302) {
		Status0302 = status0302;
	}



	public String getStatus0303() {
		return Status0303;
	}



	public void setStatus0303(String status0303) {
		Status0303 = status0303;
	}



	public String getStatus0304() {
		return Status0304;
	}



	public void setStatus0304(String status0304) {
		Status0304 = status0304;
	}



	public String getStatus0305() {
		return Status0305;
	}



	public void setStatus0305(String status0305) {
		Status0305 = status0305;
	}



	public String getStatus0306() {
		return Status0306;
	}



	public void setStatus0306(String status0306) {
		Status0306 = status0306;
	}



	public String getStatus0307() {
		return Status0307;
	}



	public void setStatus0307(String status0307) {
		Status0307 = status0307;
	}



	public String getStatus0308() {
		return Status0308;
	}



	public void setStatus0308(String status0308) {
		Status0308 = status0308;
	}



	public String getStatus0401() {
		return Status0401;
	}



	public void setStatus0401(String status0401) {
		Status0401 = status0401;
	}



	public String getStatus0402() {
		return Status0402;
	}



	public void setStatus0402(String status0402) {
		Status0402 = status0402;
	}



	public String getStatus0403() {
		return Status0403;
	}



	public void setStatus0403(String status0403) {
		Status0403 = status0403;
	}



	public String getStatus0404() {
		return Status0404;
	}



	public void setStatus0404(String status0404) {
		Status0404 = status0404;
	}



	public String getStatus0405() {
		return Status0405;
	}



	public void setStatus0405(String status0405) {
		Status0405 = status0405;
	}



	public String getStatus0406() {
		return Status0406;
	}



	public void setStatus0406(String status0406) {
		Status0406 = status0406;
	}



	public String getStatus0407() {
		return Status0407;
	}



	public void setStatus0407(String status0407) {
		Status0407 = status0407;
	}



	public String getStatus0408() {
		return Status0408;
	}



	public void setStatus0408(String status0408) {
		Status0408 = status0408;
	}



	public String getStatus0501() {
		return Status0501;
	}



	public void setStatus0501(String status0501) {
		Status0501 = status0501;
	}



	public String getStatus0502() {
		return Status0502;
	}



	public void setStatus0502(String status0502) {
		Status0502 = status0502;
	}



	public String getStatus0503() {
		return Status0503;
	}



	public void setStatus0503(String status0503) {
		Status0503 = status0503;
	}



	public String getStatus0504() {
		return Status0504;
	}



	public void setStatus0504(String status0504) {
		Status0504 = status0504;
	}



	public String getStatus0505() {
		return Status0505;
	}



	public void setStatus0505(String status0505) {
		Status0505 = status0505;
	}



	public String getStatus0506() {
		return Status0506;
	}



	public void setStatus0506(String status0506) {
		Status0506 = status0506;
	}



	public String getStatus0507() {
		return Status0507;
	}



	public void setStatus0507(String status0507) {
		Status0507 = status0507;
	}



	public String getStatus0508() {
		return Status0508;
	}



	public void setStatus0508(String status0508) {
		Status0508 = status0508;
	}


	public String getStatus0601() {
		return Status0601;
	}


	public void setStatus0601(String status0601) {
		Status0601 = status0601;
	}


	public String getStatus0602() {
		return Status0602;
	}


	public void setStatus0602(String status0602) {
		Status0602 = status0602;
	}


	public String getStatus0603() {
		return Status0603;
	}


	public void setStatus0603(String status0603) {
		Status0603 = status0603;
	}


	public String getStatus0604() {
		return Status0604;
	}


	public void setStatus0604(String status0604) {
		Status0604 = status0604;
	}


	public String getStatus0605() {
		return Status0605;
	}


	public void setStatus0605(String status0605) {
		Status0605 = status0605;
	}


	public String getStatus0606() {
		return Status0606;
	}


	public void setStatus0606(String status0606) {
		Status0606 = status0606;
	}


	public String getStatus0607() {
		return Status0607;
	}


	public void setStatus0607(String status0607) {
		Status0607 = status0607;
	}


	public String getStatus0608() {
		return Status0608;
	}


	public void setStatus0608(String status0608) {
		Status0608 = status0608;
	}


	public String getStatus0701() {
		return Status0701;
	}


	public void setStatus0701(String status0701) {
		Status0701 = status0701;
	}


	public String getStatus0702() {
		return Status0702;
	}


	public void setStatus0702(String status0702) {
		Status0702 = status0702;
	}


	public String getStatus0703() {
		return Status0703;
	}


	public void setStatus0703(String status0703) {
		Status0703 = status0703;
	}


	public String getStatus0704() {
		return Status0704;
	}


	public void setStatus0704(String status0704) {
		Status0704 = status0704;
	}


	public String getStatus0705() {
		return Status0705;
	}


	public void setStatus0705(String status0705) {
		Status0705 = status0705;
	}


	public String getStatus0706() {
		return Status0706;
	}


	public void setStatus0706(String status0706) {
		Status0706 = status0706;
	}


	public String getStatus0707() {
		return Status0707;
	}


	public void setStatus0707(String status0707) {
		Status0707 = status0707;
	}


	public String getStatus0708() {
		return Status0708;
	}


	public void setStatus0708(String status0708) {
		Status0708 = status0708;
	}


	public String getStatus0801() {
		return Status0801;
	}


	public void setStatus0801(String status0801) {
		Status0801 = status0801;
	}


	public String getStatus0802() {
		return Status0802;
	}


	public void setStatus0802(String status0802) {
		Status0802 = status0802;
	}


	public String getStatus0803() {
		return Status0803;
	}


	public void setStatus0803(String status0803) {
		Status0803 = status0803;
	}


	public String getStatus0804() {
		return Status0804;
	}


	public void setStatus0804(String status0804) {
		Status0804 = status0804;
	}


	public String getStatus0805() {
		return Status0805;
	}


	public void setStatus0805(String status0805) {
		Status0805 = status0805;
	}


	public String getStatus0806() {
		return Status0806;
	}


	public void setStatus0806(String status0806) {
		Status0806 = status0806;
	}


	public String getStatus0807() {
		return Status0807;
	}


	public void setStatus0807(String status0807) {
		Status0807 = status0807;
	}


	public String getStatus0808() {
		return Status0808;
	}


	public void setStatus0808(String status0808) {
		Status0808 = status0808;
	}


	public String getStrBID_NO() {
		return strBID_NO;
	}


	public void setStrBID_NO(String strBID_NO) {
		this.strBID_NO = strBID_NO;
	}


	public BidService getBidService() {
		return bidService;
	}


	public void setBidService(BidService bidService) {
		this.bidService = bidService;
	}

}
