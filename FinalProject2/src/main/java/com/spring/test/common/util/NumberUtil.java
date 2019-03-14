package com.spring.test.common.util;

import org.springframework.stereotype.Component;

@Component
public class NumberUtil {

	public boolean isInteger(String text) {
		try {
			Integer.parseInt(text);
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
}
