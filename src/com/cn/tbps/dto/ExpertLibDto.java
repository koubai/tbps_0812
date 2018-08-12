package com.cn.tbps.dto;

import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 专家库
 * @author Frank
 * @time 2013-10-14上午1:06:36
 * @version 1.0
 */
public class ExpertLibDto extends BaseDto {

	private static final long serialVersionUID = -3899723110046417091L;
	
	/**
	 * 序号
	 */
	private Integer EXPERT_SEQ;

	/**
	 * 姓名
	 */
	private String EXPERT_NAME;

	/**
	 * 专业
	 */
	private String EXPERT_MAJOR;
	
	/**
	 * 随机选取的专业
	 */
	private String AUTO_MARJOR;
	
	/**
	 * 专业（显示名）
	 */
	private String EXPERT_MAJOR_NAME;

	/**
	 * 职称
	 */
	private String EXPERT_QULI;

	/**
	 * 手机电话
	 */
	private String EXPERT_TEL1;

	/**
	 * 固话
	 */
	private String EXPERT_TEL2;

	/**
	 * 性别
	 */
	private String EXPERT_GENDER;

	/**
	 * 出生日期
	 */
	private Date EXPERT_BIRTH;

	/**
	 * 就职公司
	 */
	private String EXPERT_COMP;

	/**
	 * 备注
	 */
	private String MEMO1;

	/**
	 * 删除
	 */
	private String DELETE_FLG;

	/**
	 * 更新者
	 */
	private String UPDATE_USER;

	/**
	 * 新建日期
	 */
	private Date INSERT_DATE;

	/**
	 * 更新日期
	 */
	private Date UPDATE_DATE;

	/**
	 * 备用1
	 */
	private String RESERVE1;

	/**
	 * 备用2
	 */
	private String RESERVE2;

	/**
	 * 备用3
	 */
	private String RESERVE3;

	/**
	 * 备用4
	 */
	private String RESERVE4;

	/**
	 * 备用5
	 */
	private String RESERVE5;

	public Integer getEXPERT_SEQ() {
		return EXPERT_SEQ;
	}

	public void setEXPERT_SEQ(Integer eXPERT_SEQ) {
		EXPERT_SEQ = eXPERT_SEQ;
	}

	public String getEXPERT_NAME() {
		return EXPERT_NAME;
	}

	public void setEXPERT_NAME(String eXPERT_NAME) {
		EXPERT_NAME = eXPERT_NAME;
	}

	public String getEXPERT_MAJOR() {
		return EXPERT_MAJOR;
	}

	public void setEXPERT_MAJOR(String eXPERT_MAJOR) {
		EXPERT_MAJOR = eXPERT_MAJOR;
	}

	public String getEXPERT_QULI() {
		return EXPERT_QULI;
	}

	public void setEXPERT_QULI(String eXPERT_QULI) {
		EXPERT_QULI = eXPERT_QULI;
	}

	public String getEXPERT_TEL1() {
		return EXPERT_TEL1;
	}

	public void setEXPERT_TEL1(String eXPERT_TEL1) {
		EXPERT_TEL1 = eXPERT_TEL1;
	}

	public String getEXPERT_TEL2() {
		return EXPERT_TEL2;
	}

	public void setEXPERT_TEL2(String eXPERT_TEL2) {
		EXPERT_TEL2 = eXPERT_TEL2;
	}

	public String getEXPERT_GENDER() {
		return EXPERT_GENDER;
	}

	public void setEXPERT_GENDER(String eXPERT_GENDER) {
		EXPERT_GENDER = eXPERT_GENDER;
	}

	public String getEXPERT_COMP() {
		return EXPERT_COMP;
	}

	public void setEXPERT_COMP(String eXPERT_COMP) {
		EXPERT_COMP = eXPERT_COMP;
	}

	public String getMEMO1() {
		return MEMO1;
	}

	public void setMEMO1(String mEMO1) {
		MEMO1 = mEMO1;
	}

	public String getDELETE_FLG() {
		return DELETE_FLG;
	}

	public void setDELETE_FLG(String dELETE_FLG) {
		DELETE_FLG = dELETE_FLG;
	}

	public String getUPDATE_USER() {
		return UPDATE_USER;
	}

	public void setUPDATE_USER(String uPDATE_USER) {
		UPDATE_USER = uPDATE_USER;
	}

	public Date getINSERT_DATE() {
		return INSERT_DATE;
	}

	public void setINSERT_DATE(Date iNSERT_DATE) {
		INSERT_DATE = iNSERT_DATE;
	}

	public Date getUPDATE_DATE() {
		return UPDATE_DATE;
	}

	public void setUPDATE_DATE(Date uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}

	public String getRESERVE1() {
		return RESERVE1;
	}

	public void setRESERVE1(String rESERVE1) {
		RESERVE1 = rESERVE1;
	}

	public String getRESERVE2() {
		return RESERVE2;
	}

	public void setRESERVE2(String rESERVE2) {
		RESERVE2 = rESERVE2;
	}

	public String getRESERVE3() {
		return RESERVE3;
	}

	public void setRESERVE3(String rESERVE3) {
		RESERVE3 = rESERVE3;
	}

	public String getRESERVE4() {
		return RESERVE4;
	}

	public void setRESERVE4(String rESERVE4) {
		RESERVE4 = rESERVE4;
	}

	public String getRESERVE5() {
		return RESERVE5;
	}

	public void setRESERVE5(String rESERVE5) {
		RESERVE5 = rESERVE5;
	}

	public String getEXPERT_MAJOR_NAME() {
		//update by frank 2016-07-23
//		EXPERT_MAJOR_NAME = "";
//		if(StringUtil.isNotBlank(EXPERT_MAJOR)) {
//			try {
//				//建筑
//				if("1".equals(EXPERT_MAJOR.substring(0, 1))) {
//					EXPERT_MAJOR_NAME += "建筑，";
//				}
//				//结构
//				if("2".equals(EXPERT_MAJOR.substring(1, 2))) {
//					EXPERT_MAJOR_NAME += "结构，";
//				}
//				//给排水
//				if("3".equals(EXPERT_MAJOR.substring(2, 3))) {
//					EXPERT_MAJOR_NAME += "给排水，";
//				}
//				//电气
//				if("4".equals(EXPERT_MAJOR.substring(3, 4))) {
//					EXPERT_MAJOR_NAME += "电气，";
//				}
//				//环控
//				if("5".equals(EXPERT_MAJOR.substring(4, 5))) {
//					EXPERT_MAJOR_NAME += "环控，";
//				}
//				//车辆机械
//				if("6".equals(EXPERT_MAJOR.substring(5, 6))) {
//					EXPERT_MAJOR_NAME += "车辆机械，";
//				}
//				//车辆电气
//				if("7".equals(EXPERT_MAJOR.substring(6, 7))) {
//					EXPERT_MAJOR_NAME += "车辆电气，";
//				}
//				//智能化
//				if("8".equals(EXPERT_MAJOR.substring(7, 8))) {
//					EXPERT_MAJOR_NAME += "智能化，";
//				}
//				//其他
//				if("9".equals(EXPERT_MAJOR.substring(8, 9))) {
//					EXPERT_MAJOR_NAME += "其他，";
//				}
//				//管线
//				if("A".equals(EXPERT_MAJOR.substring(9, 10))) {
//					EXPERT_MAJOR_NAME += "管线，";
//				}
//				//市政/交通
//				if("B".equals(EXPERT_MAJOR.substring(10, 11))) {
//					EXPERT_MAJOR_NAME += "市政/交通，";
//				}
//				//绿化
//				if("C".equals(EXPERT_MAJOR.substring(11, 12))) {
//					EXPERT_MAJOR_NAME += "绿化，";
//				}
//				//轨道
//				if("D".equals(EXPERT_MAJOR.substring(12, 13))) {
//					EXPERT_MAJOR_NAME += "轨道，";
//				}
//				//监测
//				if("E".equals(EXPERT_MAJOR.substring(13, 14))) {
//					EXPERT_MAJOR_NAME += "监测，";
//				}
//				//商务
//				if("F".equals(EXPERT_MAJOR.substring(14, 15))) {
//					EXPERT_MAJOR_NAME += "商务，";
//				}
//			} catch(Exception e) {
//				log.error("getEXPERT_MAJOR_NAME error:" + e);
//			}
//			if(StringUtil.isNotBlank(EXPERT_MAJOR_NAME)) {
//				EXPERT_MAJOR_NAME = EXPERT_MAJOR_NAME.substring(0, EXPERT_MAJOR_NAME.length() - 1);
//			}
//		}
		return EXPERT_MAJOR_NAME;
	}

	public void setEXPERT_MAJOR_NAME(String eXPERT_MAJOR_NAME) {
		EXPERT_MAJOR_NAME = eXPERT_MAJOR_NAME;
	}

	public String getAUTO_MARJOR() {
		return AUTO_MARJOR;
	}

	public void setAUTO_MARJOR(String aUTO_MARJOR) {
		AUTO_MARJOR = aUTO_MARJOR;
	}

	public Date getEXPERT_BIRTH() {
		return EXPERT_BIRTH;
	}

	public void setEXPERT_BIRTH(Date eXPERT_BIRTH) {
		EXPERT_BIRTH = eXPERT_BIRTH;
	}
}
