package com.spring.test.user.model.service;

import java.util.Date;
import java.util.Map;

public interface UserService {

	Map login(String email,String password);

	
	void sendEmail(String email,int random);
	void sendEmail2(String email,String key);
	int getTempKey();
	
	int checkEmail(String email);
	
	int enrollUser(Map user);
	
	Map findId(String email);
	Map findUser(int userNo);
}
