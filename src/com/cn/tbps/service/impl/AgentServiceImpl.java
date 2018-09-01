package com.cn.tbps.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.service.AgentService;

public class AgentServiceImpl extends BaseService implements AgentService {

	//折扣率
	private BigDecimal m_discount;
	//招标项目总价
	private BigDecimal m_total_price;
	//招标项目折后总价
	private BigDecimal m_total_price_act;
	//参与计算的招标项目一览
	private List<BidDto> m_bidlist;
	
	
	//招标项目代理费计算
	public List<BidDto> CalcAgentPrice(){
		List<BidDto> bidlist = new ArrayList<BidDto>();
		if (m_bidlist.size() > 0){
			bidlist = SortBidList();
			
			m_total_price_act = getM_total_price().multiply(m_discount);
			System.out.println("m_total_price_act :" + m_total_price_act.toString());
			BigDecimal leave_diff = getM_total_price().subtract(m_total_price_act);
			System.out.println("leave_diff :" + leave_diff.toString());
			BidDto bid;
			for (int i = 0; i< bidlist.size(); i++){
				bid = bidlist.get(i);
				bid.setBID_AGENT_PRICE_ACT(bid.getBID_AGENT_PRICE().multiply(m_discount).setScale(6,BigDecimal.ROUND_HALF_UP));
				leave_diff = leave_diff.min(bid.getBID_AGENT_PRICE().multiply(bid.getBID_AGENT_PRICE_ACT())).setScale(6,BigDecimal.ROUND_HALF_UP); 
				if (i == m_bidlist.size() - 1)
					bid.setBID_AGENT_PRICE(bid.getBID_AGENT_PRICE_ACT().add(leave_diff).setScale(6,BigDecimal.ROUND_HALF_UP));
			}			
		}
		return bidlist;
	}
	
	public List<BidDto> SortBidList(){
		System.out.println("Start SortList");
		Collections.sort(m_bidlist, new Comparator<BidDto>() {
	        @Override
	        public int compare(BidDto o1, BidDto o2) {
	        	return (o1.getBID_AGENT_PRICE().min(o2.getBID_AGENT_PRICE()).compareTo(new BigDecimal(0)));
	        }
	    });
		return m_bidlist;
	}

	public BigDecimal getM_discount() {
		return m_discount;
	}

	public void setM_discount(BigDecimal m_discount) {
		this.m_discount = m_discount;
	}

	public BigDecimal getM_total_price() {
		BigDecimal total_price = new BigDecimal(0);
		if (m_bidlist.size() > 0 ){
			for (BidDto bid: m_bidlist){
				BigDecimal agent_price = bid.getBID_AGENT_PRICE();
				if (agent_price == null)
					agent_price = new BigDecimal(0);
				total_price = total_price.add(agent_price);
				System.out.println("total_price1 :" + total_price.toString());
			}
		}
		System.out.println("total_price :" + total_price.toString());

		return total_price;
	}

	public void setM_total_price(BigDecimal m_total_price) {
		this.m_total_price = m_total_price;
	}

	public BigDecimal getM_total_price_act() {
		if (m_discount == null || getM_total_price() == null || m_discount.equals(new BigDecimal(0)))
			m_total_price_act = null;
		else{
			m_total_price_act = getM_total_price().multiply(m_discount);
		} 
		
		return m_total_price_act;
	}

	public void setM_total_price_act(BigDecimal m_total_price_act) {
		this.m_total_price_act = m_total_price_act;
	}

	public List<BidDto> getM_bidlist() {
		return m_bidlist;
	}

	public void setM_bidlist(List<BidDto> m_bidlist) {
		this.m_bidlist = m_bidlist;
	}

}
