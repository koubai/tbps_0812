package com.cn.tbps.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.cn.tbps.dto.BidDto;

public interface AgentService {

	
	
	//招标项目代理费计算
	public List<BidDto> CalcAgentPrice();
	
	public List<BidDto> SortBidList();

	public BigDecimal getM_discount();
	
	public void setM_discount(BigDecimal m_discount);

	public BigDecimal getM_total_price() ;
	public void setM_total_price(BigDecimal m_total_price);

	public BigDecimal getM_total_price_act();

	public void setM_total_price_act(BigDecimal m_total_price_act);

	public List<BidDto> getM_bidlist();

	public void setM_bidlist(List<BidDto> m_bidlist);
	
}