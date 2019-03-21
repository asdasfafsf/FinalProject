package com.spring.test.common.util;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class StringUtil {
	
	public static String getRandomPassword( int length ){

        char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};

        StringBuffer sb = new StringBuffer();

        Random rn = new Random();

        for( int i = 0 ; i < length ; i++ ){

            sb.append( charaters[ rn.nextInt( charaters.length ) ] );

        }

        return sb.toString();
	}
	
	
	public String parseToDate(String before) {
		double beforeNum = Double.parseDouble(before);
		String result = "";
		
		if (Math.floor((beforeNum/0.00069)) < 1) {
			return "방금";
		} else if (Math.floor((beforeNum/0.00069)) >= 1 && Math.floor((beforeNum/0.0414)) < 1) {
			return (int)(Math.floor((beforeNum/0.00069))) + "분전";
		} else if (Math.floor((beforeNum/0.0414)) >= 1 && Math.floor((beforeNum/0.0414)) < 24) {
			return (int)((int)Math.floor((beforeNum/0.0414))) + "시간전";
		} else if (beforeNum < 31 && Math.floor((beforeNum/0.0414)) >= 24) {
			return (int)((int)Math.floor(beforeNum)) + "일전";
		} else if (beforeNum < 366 && beforeNum >= 31) {
			return (int)((int)Math.floor(beforeNum/30)) + "개월전";
		}
		
		return ((int)Math.floor(beforeNum/365)) + "년전"	;	
	}
}
