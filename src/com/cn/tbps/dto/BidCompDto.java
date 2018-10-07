package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.cn.common.dto.BaseDto;
import com.cn.common.util.PropertiesConfig;
import com.cn.common.util.StringUtil;

/**
 * 投标公司
 * @author Frank
 * @time 2013-10-14上午12:56:02
 * @version 1.0
 */
public class BidCompDto extends BaseDto {

	private static final long serialVersionUID = -4573814513754369057L;

	/**
	 * 招标编号
	 */
	private String BID_NO;
	
	/**
	 * 报名内容，保存用
	 */
	private String saveBidCompApply;
	
	/**
	 * 报名内容，显示用
	 */
	private String showBidCompApply;
	
	/**
	 * 报名内容LIST
	 */
	private List<BidCompApplyDto> listBidCompApply;

	/**
	 * 序号
	 */
	private Integer BID_CO_SEQ;

	/**
	 * 公司号
	 */
	private Integer BID_CO_NO;

	/**
	 * 公司名称
	 */
	private String BID_CO_NAME;

	/**
	 * 负责人
	 */
	private String BID_CO_MANAGER;

	/**
	 * 联系电话
	 */
	private String BID_CO_TEL;

	/**
	 * 地址
	 */
	private String BID_CO_ADD;

	/**
	 * 邮箱
	 */
	private String BID_CO_PS;
	
	/**
	 * 邮箱前缀
	 */
	private String mail_pr;
	
	/**
	 * 邮箱后缀
	 */
	private String mail_suffix;

	/**
	 * 开票信息
	 */
	private String TAX_NO;

	/**
	 * 支付形式
	 */
	private String BID_PAYMENT_TYPE;

	/**
	 * 投标价
	 */
	private BigDecimal BID_PRICE;

	/**
	 * 评审价
	 */
	private BigDecimal BID_CHECK_PRICE;

	/**
	 * 中标与否
	 */
	private String BID_RESULT;

	/**
	 * 中标价
	 */
	private BigDecimal BID_WIN_PRICE;

	/**
	 * 标书费
	 */
	private BigDecimal BID_APPLY_PRICE;
	
	/**
	 * 标书费支付形式
	 */
	private String BID_APPLY_PAYMENT_TYPE;

	/**
	 * 保证金
	 */
	private BigDecimal BID_BOND;

	/**
	 * 保证金到账日期
	 */
	private Date BID_VALUE_DATE;

	/**
	 * 退保证金状态
	 */
	private String REFOUND_BOND_STATUS;

	/**
	 * 退订日期
	 */
	private Date REFOUND_DEPOSIT_DATE;

	/**
	 * 退还签名
	 */
	private String BID_REFUND_SIGN;

	/**
	 * 上传文件1
	 */
	private String RECEPT_UL_FILE1;
	
	//文件地址
	private String file_url;

	/**
	 * 上传文件2
	 */
	private String RECEPT_UL_FILE2;

	/**
	 * 上传文件3
	 */
	private String RECEPT_UL_FILE3;

	/**
	 * 上传文件4
	 */
	private String RECEPT_UL_FILE4;

	/**
	 * 上传文件5
	 */
	private String RECEPT_UL_FILE5;

	/**
	 * 上传文件6
	 */
	private String RECEPT_UL_FILE6;

	/**
	 * 上传文件7
	 */
	private String RECEPT_UL_FILE7;

	/**
	 * 上传文件8
	 */
	private String RECEPT_UL_FILE8;

	/**
	 * 上传文件9
	 */
	private String RECEPT_UL_FILE9;

	/**
	 * 上传文件10
	 */
	private String RECEPT_UL_FILE10;
	
	/**
	 * 上传文件1原始文件名
	 */
	private String RECEPT_UL_FILE1_BASENAME;

	/**
	 * 上传文件2原始文件名
	 */
	private String RECEPT_UL_FILE2_BASENAME;

	/**
	 * 上传文件3原始文件名
	 */
	private String RECEPT_UL_FILE3_BASENAME;

	/**
	 * 上传文件4原始文件名
	 */
	private String RECEPT_UL_FILE4_BASENAME;

	/**
	 * 上传文件5原始文件名
	 */
	private String RECEPT_UL_FILE5_BASENAME;

	/**
	 * 上传文件6原始文件名
	 */
	private String RECEPT_UL_FILE6_BASENAME;

	/**
	 * 上传文件7原始文件名
	 */
	private String RECEPT_UL_FILE7_BASENAME;

	/**
	 * 上传文件8原始文件名
	 */
	private String RECEPT_UL_FILE8_BASENAME;

	/**
	 * 上传文件9原始文件名
	 */
	private String RECEPT_UL_FILE9_BASENAME;

	/**
	 * 上传文件10原始文件名
	 */
	private String RECEPT_UL_FILE10_BASENAME;


	/**
	 * 标书费到账日期
	 */
	private Date BID_APPLY_PRICE_DATE;

	/**
	 * 发票信息
	 */
	private String INVOICE_TYPE;

	/**
	 * 发票时间
	 */
	private Date INVOICE_DATE;

	/**
	 * 发票号码
	 */
	private String BID_RECEIPT_NO;

	/**
	 * 标书费状态
	 */
	private String BID_APPLY_PRICE_STATUS;

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

	/**
	 * 备用6
	 */
	private String RESERVE6;

	/**
	 * 备用7
	 */
	private String RESERVE7;

	/**
	 * 备用8
	 */
	private String RESERVE8;

	/**
	 * 备用9
	 */
	private String RESERVE9;

	/**
	 * 备用10
	 */
	private String RESERVE10;

	/**
	 * 备用日期1
	 */
	private Date RESERVE_DATE1;

	/**
	 * 备用日期2
	 */
	private Date RESERVE_DATE2;

	public String getBID_NO() {
		return BID_NO;
	}

	public void setBID_NO(String bID_NO) {
		BID_NO = bID_NO;
	}

	public Integer getBID_CO_SEQ() {
		return BID_CO_SEQ;
	}

	public void setBID_CO_SEQ(Integer bID_CO_SEQ) {
		BID_CO_SEQ = bID_CO_SEQ;
	}

	public Integer getBID_CO_NO() {
		return BID_CO_NO;
	}

	public void setBID_CO_NO(Integer bID_CO_NO) {
		BID_CO_NO = bID_CO_NO;
	}

	public String getBID_CO_NAME() {
		return BID_CO_NAME;
	}

	public void setBID_CO_NAME(String bID_CO_NAME) {
		BID_CO_NAME = bID_CO_NAME;
	}

	public String getBID_CO_MANAGER() {
		return BID_CO_MANAGER;
	}

	public void setBID_CO_MANAGER(String bID_CO_MANAGER) {
		BID_CO_MANAGER = bID_CO_MANAGER;
	}

	public String getBID_CO_TEL() {
		return BID_CO_TEL;
	}

	public void setBID_CO_TEL(String bID_CO_TEL) {
		BID_CO_TEL = bID_CO_TEL;
	}

	public String getBID_CO_ADD() {
		return BID_CO_ADD;
	}

	public void setBID_CO_ADD(String bID_CO_ADD) {
		BID_CO_ADD = bID_CO_ADD;
	}

	public String getBID_CO_PS() {
		return BID_CO_PS;
	}

	public void setBID_CO_PS(String bID_CO_PS) {
		BID_CO_PS = bID_CO_PS;
	}

	public BigDecimal getBID_BOND() {
		return BID_BOND;
	}

	public void setBID_BOND(BigDecimal bID_BOND) {
		BID_BOND = bID_BOND;
	}

	public String getBID_REFUND_SIGN() {
		return BID_REFUND_SIGN;
	}

	public void setBID_REFUND_SIGN(String bID_REFUND_SIGN) {
		BID_REFUND_SIGN = bID_REFUND_SIGN;
	}

	public String getBID_PAYMENT_TYPE() {
		return BID_PAYMENT_TYPE;
	}

	public void setBID_PAYMENT_TYPE(String bID_PAYMENT_TYPE) {
		BID_PAYMENT_TYPE = bID_PAYMENT_TYPE;
	}

	public BigDecimal getBID_PRICE() {
		return BID_PRICE;
	}

	public void setBID_PRICE(BigDecimal bID_PRICE) {
		BID_PRICE = bID_PRICE;
	}

	public BigDecimal getBID_CHECK_PRICE() {
		return BID_CHECK_PRICE;
	}

	public void setBID_CHECK_PRICE(BigDecimal bID_CHECK_PRICE) {
		BID_CHECK_PRICE = bID_CHECK_PRICE;
	}

	public String getBID_RESULT() {
		return BID_RESULT;
	}

	public void setBID_RESULT(String bID_RESULT) {
		BID_RESULT = bID_RESULT;
	}

	public BigDecimal getBID_WIN_PRICE() {
		return BID_WIN_PRICE;
	}

	public void setBID_WIN_PRICE(BigDecimal bID_WIN_PRICE) {
		BID_WIN_PRICE = bID_WIN_PRICE;
	}

	public BigDecimal getBID_APPLY_PRICE() {
		return BID_APPLY_PRICE;
	}

	public void setBID_APPLY_PRICE(BigDecimal bID_APPLY_PRICE) {
		BID_APPLY_PRICE = bID_APPLY_PRICE;
	}

	public Date getBID_VALUE_DATE() {
		return BID_VALUE_DATE;
	}

	public void setBID_VALUE_DATE(Date bID_VALUE_DATE) {
		BID_VALUE_DATE = bID_VALUE_DATE;
	}

	public String getBID_RECEIPT_NO() {
		return BID_RECEIPT_NO;
	}

	public void setBID_RECEIPT_NO(String bID_RECEIPT_NO) {
		BID_RECEIPT_NO = bID_RECEIPT_NO;
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

	public String getMail_pr() {
		if(StringUtil.isNotBlank(BID_CO_PS)) {
			mail_pr = BID_CO_PS.substring(0, BID_CO_PS.indexOf("@"));
		}
		return mail_pr;
	}

	public void setMail_pr(String mail_pr) {
		this.mail_pr = mail_pr;
	}

	public String getMail_suffix() {
		if(StringUtil.isNotBlank(BID_CO_PS)) {
			mail_suffix = BID_CO_PS.substring(BID_CO_PS.indexOf("@") + 1, BID_CO_PS.length());
		}
		return mail_suffix;
	}

	public void setMail_suffix(String mail_suffix) {
		this.mail_suffix = mail_suffix;
	}

	public Date getREFOUND_DEPOSIT_DATE() {
		return REFOUND_DEPOSIT_DATE;
	}

	public void setREFOUND_DEPOSIT_DATE(Date rEFOUND_DEPOSIT_DATE) {
		REFOUND_DEPOSIT_DATE = rEFOUND_DEPOSIT_DATE;
	}

	public Date getRESERVE_DATE1() {
		return RESERVE_DATE1;
	}

	public void setRESERVE_DATE1(Date rESERVE_DATE1) {
		RESERVE_DATE1 = rESERVE_DATE1;
	}

	public Date getRESERVE_DATE2() {
		return RESERVE_DATE2;
	}

	public void setRESERVE_DATE2(Date rESERVE_DATE2) {
		RESERVE_DATE2 = rESERVE_DATE2;
	}

	public List<BidCompApplyDto> getListBidCompApply() {
		return listBidCompApply;
	}

	public void setListBidCompApply(List<BidCompApplyDto> listBidCompApply) {
		this.listBidCompApply = listBidCompApply;
	}

	public String getSaveBidCompApply() {
		return saveBidCompApply;
	}

	public void setSaveBidCompApply(String saveBidCompApply) {
		this.saveBidCompApply = saveBidCompApply;
	}

	public String getShowBidCompApply() {
		showBidCompApply = "";
		if(listBidCompApply != null && listBidCompApply.size() > 0) {
			for(BidCompApplyDto apply : listBidCompApply) {
				showBidCompApply += apply.getID() + "@@@@" + apply.getAPPLY_REQUIRE() + "@@@@" + apply.getAPPLY_NOTE() + "####";
			}
		}
		return showBidCompApply;
	}

	public void setShowBidCompApply(String showBidCompApply) {
		this.showBidCompApply = showBidCompApply;
	}

	public String getRESERVE6() {
		return RESERVE6;
	}

	public void setRESERVE6(String rESERVE6) {
		RESERVE6 = rESERVE6;
	}

	public String getRESERVE7() {
		return RESERVE7;
	}

	public void setRESERVE7(String rESERVE7) {
		RESERVE7 = rESERVE7;
	}

	public String getRESERVE8() {
		return RESERVE8;
	}

	public void setRESERVE8(String rESERVE8) {
		RESERVE8 = rESERVE8;
	}

	public String getRESERVE9() {
		return RESERVE9;
	}

	public void setRESERVE9(String rESERVE9) {
		RESERVE9 = rESERVE9;
	}

	public String getRESERVE10() {
		return RESERVE10;
	}

	public void setRESERVE10(String rESERVE10) {
		RESERVE10 = rESERVE10;
	}

	public String getTAX_NO() {
		return TAX_NO;
	}

	public void setTAX_NO(String tAX_NO) {
		TAX_NO = tAX_NO;
	}

	public String getREFOUND_BOND_STATUS() {
		return REFOUND_BOND_STATUS;
	}

	public void setREFOUND_BOND_STATUS(String rEFOUND_BOND_STATUS) {
		REFOUND_BOND_STATUS = rEFOUND_BOND_STATUS;
	}

	public String getRECEPT_UL_FILE1() {
		return RECEPT_UL_FILE1;
	}

	public void setRECEPT_UL_FILE1(String rECEPT_UL_FILE1) {
		RECEPT_UL_FILE1 = rECEPT_UL_FILE1;
	}

	public String getRECEPT_UL_FILE2() {
		return RECEPT_UL_FILE2;
	}

	public void setRECEPT_UL_FILE2(String rECEPT_UL_FILE2) {
		RECEPT_UL_FILE2 = rECEPT_UL_FILE2;
	}

	public String getRECEPT_UL_FILE3() {
		return RECEPT_UL_FILE3;
	}

	public void setRECEPT_UL_FILE3(String rECEPT_UL_FILE3) {
		RECEPT_UL_FILE3 = rECEPT_UL_FILE3;
	}

	public String getRECEPT_UL_FILE4() {
		return RECEPT_UL_FILE4;
	}

	public void setRECEPT_UL_FILE4(String rECEPT_UL_FILE4) {
		RECEPT_UL_FILE4 = rECEPT_UL_FILE4;
	}

	public String getRECEPT_UL_FILE5() {
		return RECEPT_UL_FILE5;
	}

	public void setRECEPT_UL_FILE5(String rECEPT_UL_FILE5) {
		RECEPT_UL_FILE5 = rECEPT_UL_FILE5;
	}

	public String getRECEPT_UL_FILE6() {
		return RECEPT_UL_FILE6;
	}

	public void setRECEPT_UL_FILE6(String rECEPT_UL_FILE6) {
		RECEPT_UL_FILE6 = rECEPT_UL_FILE6;
	}

	public String getRECEPT_UL_FILE7() {
		return RECEPT_UL_FILE7;
	}

	public void setRECEPT_UL_FILE7(String rECEPT_UL_FILE7) {
		RECEPT_UL_FILE7 = rECEPT_UL_FILE7;
	}

	public String getRECEPT_UL_FILE8() {
		return RECEPT_UL_FILE8;
	}

	public void setRECEPT_UL_FILE8(String rECEPT_UL_FILE8) {
		RECEPT_UL_FILE8 = rECEPT_UL_FILE8;
	}

	public String getRECEPT_UL_FILE9() {
		return RECEPT_UL_FILE9;
	}

	public void setRECEPT_UL_FILE9(String rECEPT_UL_FILE9) {
		RECEPT_UL_FILE9 = rECEPT_UL_FILE9;
	}

	public String getRECEPT_UL_FILE10() {
		return RECEPT_UL_FILE10;
	}

	public void setRECEPT_UL_FILE10(String rECEPT_UL_FILE10) {
		RECEPT_UL_FILE10 = rECEPT_UL_FILE10;
	}

	public Date getBID_APPLY_PRICE_DATE() {
		return BID_APPLY_PRICE_DATE;
	}

	public void setBID_APPLY_PRICE_DATE(Date bID_APPLY_PRICE_DATE) {
		BID_APPLY_PRICE_DATE = bID_APPLY_PRICE_DATE;
	}

	public String getINVOICE_TYPE() {
		return INVOICE_TYPE;
	}

	public void setINVOICE_TYPE(String iNVOICE_TYPE) {
		INVOICE_TYPE = iNVOICE_TYPE;
	}

	public Date getINVOICE_DATE() {
		return INVOICE_DATE;
	}

	public void setINVOICE_DATE(Date iNVOICE_DATE) {
		INVOICE_DATE = iNVOICE_DATE;
	}

	public String getBID_APPLY_PRICE_STATUS() {
		return BID_APPLY_PRICE_STATUS;
	}

	public void setBID_APPLY_PRICE_STATUS(String bID_APPLY_PRICE_STATUS) {
		BID_APPLY_PRICE_STATUS = bID_APPLY_PRICE_STATUS;
	}

	public String getBID_APPLY_PAYMENT_TYPE() {
		return BID_APPLY_PAYMENT_TYPE;
	}

	public void setBID_APPLY_PAYMENT_TYPE(String bID_APPLY_PAYMENT_TYPE) {
		BID_APPLY_PAYMENT_TYPE = bID_APPLY_PAYMENT_TYPE;
	}

	public String getFile_url() {
		file_url = PropertiesConfig.getPropertiesValueByKey("file_url");
		return file_url;
	}

	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}

	public String getRECEPT_UL_FILE1_BASENAME() {
		return RECEPT_UL_FILE1_BASENAME;
	}

	public void setRECEPT_UL_FILE1_BASENAME(String rECEPT_UL_FILE1_BASENAME) {
		RECEPT_UL_FILE1_BASENAME = rECEPT_UL_FILE1_BASENAME;
	}

	public String getRECEPT_UL_FILE2_BASENAME() {
		return RECEPT_UL_FILE2_BASENAME;
	}

	public void setRECEPT_UL_FILE2_BASENAME(String rECEPT_UL_FILE2_BASENAME) {
		RECEPT_UL_FILE2_BASENAME = rECEPT_UL_FILE2_BASENAME;
	}

	public String getRECEPT_UL_FILE3_BASENAME() {
		return RECEPT_UL_FILE3_BASENAME;
	}

	public void setRECEPT_UL_FILE3_BASENAME(String rECEPT_UL_FILE3_BASENAME) {
		RECEPT_UL_FILE3_BASENAME = rECEPT_UL_FILE3_BASENAME;
	}

	public String getRECEPT_UL_FILE4_BASENAME() {
		return RECEPT_UL_FILE4_BASENAME;
	}

	public void setRECEPT_UL_FILE4_BASENAME(String rECEPT_UL_FILE4_BASENAME) {
		RECEPT_UL_FILE4_BASENAME = rECEPT_UL_FILE4_BASENAME;
	}

	public String getRECEPT_UL_FILE5_BASENAME() {
		return RECEPT_UL_FILE5_BASENAME;
	}

	public void setRECEPT_UL_FILE5_BASENAME(String rECEPT_UL_FILE5_BASENAME) {
		RECEPT_UL_FILE5_BASENAME = rECEPT_UL_FILE5_BASENAME;
	}

	public String getRECEPT_UL_FILE6_BASENAME() {
		return RECEPT_UL_FILE6_BASENAME;
	}

	public void setRECEPT_UL_FILE6_BASENAME(String rECEPT_UL_FILE6_BASENAME) {
		RECEPT_UL_FILE6_BASENAME = rECEPT_UL_FILE6_BASENAME;
	}

	public String getRECEPT_UL_FILE7_BASENAME() {
		return RECEPT_UL_FILE7_BASENAME;
	}

	public void setRECEPT_UL_FILE7_BASENAME(String rECEPT_UL_FILE7_BASENAME) {
		RECEPT_UL_FILE7_BASENAME = rECEPT_UL_FILE7_BASENAME;
	}

	public String getRECEPT_UL_FILE8_BASENAME() {
		return RECEPT_UL_FILE8_BASENAME;
	}

	public void setRECEPT_UL_FILE8_BASENAME(String rECEPT_UL_FILE8_BASENAME) {
		RECEPT_UL_FILE8_BASENAME = rECEPT_UL_FILE8_BASENAME;
	}

	public String getRECEPT_UL_FILE9_BASENAME() {
		return RECEPT_UL_FILE9_BASENAME;
	}

	public void setRECEPT_UL_FILE9_BASENAME(String rECEPT_UL_FILE9_BASENAME) {
		RECEPT_UL_FILE9_BASENAME = rECEPT_UL_FILE9_BASENAME;
	}

	public String getRECEPT_UL_FILE10_BASENAME() {
		return RECEPT_UL_FILE10_BASENAME;
	}

	public void setRECEPT_UL_FILE10_BASENAME(String rECEPT_UL_FILE10_BASENAME) {
		RECEPT_UL_FILE10_BASENAME = rECEPT_UL_FILE10_BASENAME;
	}
}
