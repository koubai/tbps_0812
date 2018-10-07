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
			return price.multiply(discount).setScale(4, BigDecimal.ROUND_HALF_UP);
		} else {
			return new BigDecimal(0).setScale(4, BigDecimal.ROUND_HALF_UP);
		}
	}
}
