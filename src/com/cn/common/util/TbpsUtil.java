package com.cn.common.util;

import java.math.BigDecimal;

public class TbpsUtil {

	/**
	 * 根据折扣计算实收代理费
	 * @param price
	 * @param discount
	 * @return
	 */
	public static BigDecimal calcAgentPrice(BigDecimal price, BigDecimal discount) {
		if(price != null) {
			return price.multiply(discount).setScale(6, BigDecimal.ROUND_HALF_UP);
		} else {
			return new BigDecimal(0).setScale(6, BigDecimal.ROUND_HALF_UP);
		}
	}
	
	/**
	 * BigDecimal转化为字符串
	 * @param b
	 * @return
	 */
	public static String bigDecimal2str(BigDecimal b) {
		if(b != null) {
			return b.toString();
		}
		return null;
	}
	
	/**
	 * 字符转化为BigDecimal
	 * @param s
	 * @param newScale
	 * @return
	 */
	public static BigDecimal str2BigDecimal(String s, int newScale) {
		if(StringUtil.isNotBlank(s)) {
			try {
				return new BigDecimal(s).setScale(newScale, BigDecimal.ROUND_HALF_UP);
			} catch (Exception e) {
				return null;
			}
		}
		return null;
	}
}
