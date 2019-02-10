package com.cn.tbps.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cn.common.dto.BaseDto;
import com.cn.common.util.StringUtil;

/**
 * 委托公司
 * @author Frank
 * @time 2013-10-13下午11:57:28
 * @version 1.0
 */
public class AgentCompDto extends BaseDto {

	private static final long serialVersionUID = 3181976367303142453L;
	
	/**
	 * 委托公司代码
	 */
	private String ANGENT_COMP_NO;

	/**
	 * 委托公司名称
	 */
	private String ANGENT_COMP_NAME;
	
	/**
	 * 备考
	 */
	private String MEMO1;

	/**
	 * 删除标志
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
	 * 联系人1
	 */
	private String CO_MANAGER1;

	/**
	 * 联系人1电话
	 */
	private String CO_MANAGER_TEL1;

	/**
	 * 联系人1地址
	 */
	private String CO_ADDRESS1;
	
	/**
	 * 联系人1邮箱
	 */
	private String CO_MAIL1;

	/**
	 * 联系人2
	 */
	private String CO_MANAGER2;

	/**
	 * 联系人2电话
	 */
	private String CO_MANAGER_TEL2;

	/**
	 * 联系人2地址
	 */
	private String CO_ADDRESS2;
	
	/**
	 * 联系人2邮箱
	 */
	private String CO_MAIL2;

	/**
	 * 联系人3
	 */
	private String CO_MANAGER3;

	/**
	 * 联系人3电话
	 */
	private String CO_MANAGER_TEL3;

	/**
	 * 联系人3地址
	 */
	private String CO_ADDRESS3;
	
	/**
	 * 联系人3邮箱
	 */
	private String CO_MAIL3;

	/**
	 * 联系人4
	 */
	private String CO_MANAGER4;

	/**
	 * 联系人4电话
	 */
	private String CO_MANAGER_TEL4;

	/**
	 * 联系人4地址
	 */
	private String CO_ADDRESS4;
	
	/**
	 * 联系人4邮箱
	 */
	private String CO_MAIL4;

	/**
	 * 联系人5
	 */
	private String CO_MANAGER5;

	/**
	 * 联系人5电话
	 */
	private String CO_MANAGER_TEL5;

	/**
	 * 联系人5地址
	 */
	private String CO_ADDRESS5;
	
	/**
	 * 联系人5邮箱
	 */
	private String CO_MAIL5;
	
	private String mail_pr1;
	
	private String mail_suffix1;
	
	private String mail_pr2;
	
	private String mail_suffix2;
	
	private String mail_pr3;
	
	private String mail_suffix3;
	
	private String mail_pr4;
	
	private String mail_suffix4;
	
	private String mail_pr5;
	
	private String mail_suffix5;
	
	/**
	 * 开票信息
	 */
	private String TAX_NO;

	/**
	 * 纳税人识别号
	 */
	private String RESERVE1;

	/**
	 * 开户行
	 */
	private String RESERVE2;

	/**
	 * 开户行账号
	 */
	private String RESERVE3;

	/**
	 * 委托公司地址
	 */
	private String RESERVE4;

	/**
	 * 委托公司电话
	 */
	private String RESERVE5;
	
	/**
	 * 联系人列表
	 */
	private List<KeyValueDto> listManage;

	public String getANGENT_COMP_NO() {
		return ANGENT_COMP_NO;
	}

	public void setANGENT_COMP_NO(String aNGENT_COMP_NO) {
		ANGENT_COMP_NO = aNGENT_COMP_NO;
	}

	public String getANGENT_COMP_NAME() {
		return ANGENT_COMP_NAME;
	}

	public void setANGENT_COMP_NAME(String aNGENT_COMP_NAME) {
		ANGENT_COMP_NAME = aNGENT_COMP_NAME;
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

	public String getMEMO1() {
		return MEMO1;
	}

	public void setMEMO1(String mEMO1) {
		MEMO1 = mEMO1;
	}

	public String getCO_MANAGER1() {
		return CO_MANAGER1;
	}

	public void setCO_MANAGER1(String cO_MANAGER1) {
		CO_MANAGER1 = cO_MANAGER1;
	}

	public String getCO_MANAGER_TEL1() {
		return CO_MANAGER_TEL1;
	}

	public void setCO_MANAGER_TEL1(String cO_MANAGER_TEL1) {
		CO_MANAGER_TEL1 = cO_MANAGER_TEL1;
	}

	public String getCO_ADDRESS1() {
		return CO_ADDRESS1;
	}

	public void setCO_ADDRESS1(String cO_ADDRESS1) {
		CO_ADDRESS1 = cO_ADDRESS1;
	}

	public String getCO_MANAGER2() {
		return CO_MANAGER2;
	}

	public void setCO_MANAGER2(String cO_MANAGER2) {
		CO_MANAGER2 = cO_MANAGER2;
	}

	public String getCO_MANAGER_TEL2() {
		return CO_MANAGER_TEL2;
	}

	public void setCO_MANAGER_TEL2(String cO_MANAGER_TEL2) {
		CO_MANAGER_TEL2 = cO_MANAGER_TEL2;
	}

	public String getCO_ADDRESS2() {
		return CO_ADDRESS2;
	}

	public void setCO_ADDRESS2(String cO_ADDRESS2) {
		CO_ADDRESS2 = cO_ADDRESS2;
	}

	public String getCO_MANAGER3() {
		return CO_MANAGER3;
	}

	public void setCO_MANAGER3(String cO_MANAGER3) {
		CO_MANAGER3 = cO_MANAGER3;
	}

	public String getCO_MANAGER_TEL3() {
		return CO_MANAGER_TEL3;
	}

	public void setCO_MANAGER_TEL3(String cO_MANAGER_TEL3) {
		CO_MANAGER_TEL3 = cO_MANAGER_TEL3;
	}

	public String getCO_ADDRESS3() {
		return CO_ADDRESS3;
	}

	public void setCO_ADDRESS3(String cO_ADDRESS3) {
		CO_ADDRESS3 = cO_ADDRESS3;
	}

	public String getCO_MANAGER4() {
		return CO_MANAGER4;
	}

	public void setCO_MANAGER4(String cO_MANAGER4) {
		CO_MANAGER4 = cO_MANAGER4;
	}

	public String getCO_MANAGER_TEL4() {
		return CO_MANAGER_TEL4;
	}

	public void setCO_MANAGER_TEL4(String cO_MANAGER_TEL4) {
		CO_MANAGER_TEL4 = cO_MANAGER_TEL4;
	}

	public String getCO_ADDRESS4() {
		return CO_ADDRESS4;
	}

	public void setCO_ADDRESS4(String cO_ADDRESS4) {
		CO_ADDRESS4 = cO_ADDRESS4;
	}

	public String getCO_MANAGER5() {
		return CO_MANAGER5;
	}

	public void setCO_MANAGER5(String cO_MANAGER5) {
		CO_MANAGER5 = cO_MANAGER5;
	}

	public String getCO_MANAGER_TEL5() {
		return CO_MANAGER_TEL5;
	}

	public void setCO_MANAGER_TEL5(String cO_MANAGER_TEL5) {
		CO_MANAGER_TEL5 = cO_MANAGER_TEL5;
	}

	public String getCO_ADDRESS5() {
		return CO_ADDRESS5;
	}

	public void setCO_ADDRESS5(String cO_ADDRESS5) {
		CO_ADDRESS5 = cO_ADDRESS5;
	}

	public String getCO_MAIL1() {
		return CO_MAIL1;
	}

	public void setCO_MAIL1(String cO_MAIL1) {
		CO_MAIL1 = cO_MAIL1;
	}

	public String getCO_MAIL2() {
		return CO_MAIL2;
	}

	public void setCO_MAIL2(String cO_MAIL2) {
		CO_MAIL2 = cO_MAIL2;
	}

	public String getCO_MAIL3() {
		return CO_MAIL3;
	}

	public void setCO_MAIL3(String cO_MAIL3) {
		CO_MAIL3 = cO_MAIL3;
	}

	public String getCO_MAIL4() {
		return CO_MAIL4;
	}

	public void setCO_MAIL4(String cO_MAIL4) {
		CO_MAIL4 = cO_MAIL4;
	}

	public String getCO_MAIL5() {
		return CO_MAIL5;
	}

	public void setCO_MAIL5(String cO_MAIL5) {
		CO_MAIL5 = cO_MAIL5;
	}
	
	public List<KeyValueDto> getListManage() {
		listManage = new ArrayList<KeyValueDto>();
		KeyValueDto dto = null;
		if(StringUtil.isNotBlank(CO_MANAGER1)) {
			dto = new KeyValueDto();
			dto.setKey(CO_MANAGER1);
			dto.setValue(CO_MANAGER1 + "※" + CO_MANAGER_TEL1 + "※" + CO_ADDRESS1 + "※" + CO_MAIL1);
			listManage.add(dto);
		}
		if(StringUtil.isNotBlank(CO_MANAGER2)) {
			dto = new KeyValueDto();
			dto.setKey(CO_MANAGER2);
			dto.setValue(CO_MANAGER2 + "※" + CO_MANAGER_TEL2 + "※" + CO_ADDRESS2 + "※" + CO_MAIL2);
			listManage.add(dto);
		}
		if(StringUtil.isNotBlank(CO_MANAGER3)) {
			dto = new KeyValueDto();
			dto.setKey(CO_MANAGER3);
			dto.setValue(CO_MANAGER3 + "※" + CO_MANAGER_TEL3 + "※" + CO_ADDRESS3 + "※" + CO_MAIL3);
			listManage.add(dto);
		}
		if(StringUtil.isNotBlank(CO_MANAGER4)) {
			dto = new KeyValueDto();
			dto.setKey(CO_MANAGER4);
			dto.setValue(CO_MANAGER4 + "※" + CO_MANAGER_TEL4 + "※" + CO_ADDRESS4 + "※" + CO_MAIL4);
			listManage.add(dto);
		}
		if(StringUtil.isNotBlank(CO_MANAGER5)) {
			dto = new KeyValueDto();
			dto.setKey(CO_MANAGER5);
			dto.setValue(CO_MANAGER5 + "※" + CO_MANAGER_TEL5 + "※" + CO_ADDRESS5 + "※" + CO_MAIL5);
			listManage.add(dto);
		}
		return listManage;
	}

	public void setListManage(List<KeyValueDto> listManage) {
		this.listManage = listManage;
	}

	public String getMail_pr1() {
		if(StringUtil.isNotBlank(CO_MAIL1)) {
			mail_pr1 = CO_MAIL1.substring(0, CO_MAIL1.indexOf("@"));
		}
		return mail_pr1;
	}

	public void setMail_pr1(String mail_pr1) {
		this.mail_pr1 = mail_pr1;
	}

	public String getMail_suffix1() {
		if(StringUtil.isNotBlank(CO_MAIL1)) {
			mail_suffix1 = CO_MAIL1.substring(CO_MAIL1.indexOf("@") + 1, CO_MAIL1.length());
		}
		return mail_suffix1;
	}

	public void setMail_suffix1(String mail_suffix1) {
		this.mail_suffix1 = mail_suffix1;
	}

	public String getMail_pr2() {
		if(StringUtil.isNotBlank(CO_MAIL2)) {
			mail_pr2 = CO_MAIL2.substring(0, CO_MAIL2.indexOf("@"));
		}
		return mail_pr2;
	}

	public void setMail_pr2(String mail_pr2) {
		this.mail_pr2 = mail_pr2;
	}

	public String getMail_suffix2() {
		if(StringUtil.isNotBlank(CO_MAIL2)) {
			mail_suffix2 = CO_MAIL2.substring(CO_MAIL2.indexOf("@") + 1, CO_MAIL2.length());
		}
		return mail_suffix2;
	}

	public void setMail_suffix2(String mail_suffix2) {
		this.mail_suffix2 = mail_suffix2;
	}

	public String getMail_pr3() {
		if(StringUtil.isNotBlank(CO_MAIL3)) {
			mail_pr3 = CO_MAIL3.substring(0, CO_MAIL3.indexOf("@"));
		}
		return mail_pr3;
	}

	public void setMail_pr3(String mail_pr3) {
		this.mail_pr3 = mail_pr3;
	}

	public String getMail_suffix3() {
		if(StringUtil.isNotBlank(CO_MAIL3)) {
			mail_suffix3 = CO_MAIL3.substring(CO_MAIL3.indexOf("@") + 1, CO_MAIL3.length());
		}
		return mail_suffix3;
	}

	public void setMail_suffix3(String mail_suffix3) {
		this.mail_suffix3 = mail_suffix3;
	}

	public String getMail_pr4() {
		if(StringUtil.isNotBlank(CO_MAIL4)) {
			mail_pr4 = CO_MAIL4.substring(0, CO_MAIL4.indexOf("@"));
		}
		return mail_pr4;
	}

	public void setMail_pr4(String mail_pr4) {
		this.mail_pr4 = mail_pr4;
	}

	public String getMail_suffix4() {
		if(StringUtil.isNotBlank(CO_MAIL4)) {
			mail_suffix4 = CO_MAIL4.substring(CO_MAIL4.indexOf("@") + 1, CO_MAIL4.length());
		}
		return mail_suffix4;
	}

	public void setMail_suffix4(String mail_suffix4) {
		this.mail_suffix4 = mail_suffix4;
	}

	public String getMail_pr5() {
		if(StringUtil.isNotBlank(CO_MAIL5)) {
			mail_pr5 = CO_MAIL5.substring(0, CO_MAIL5.indexOf("@"));
		}
		return mail_pr5;
	}

	public void setMail_pr5(String mail_pr5) {
		this.mail_pr5 = mail_pr5;
	}

	public String getMail_suffix5() {
		if(StringUtil.isNotBlank(CO_MAIL5)) {
			mail_suffix5 = CO_MAIL5.substring(CO_MAIL5.indexOf("@") + 1, CO_MAIL5.length());
		}
		return mail_suffix5;
	}

	public void setMail_suffix5(String mail_suffix5) {
		this.mail_suffix5 = mail_suffix5;
	}

	public String getTAX_NO() {
		return TAX_NO;
	}

	public void setTAX_NO(String tAX_NO) {
		TAX_NO = tAX_NO;
	}
}
