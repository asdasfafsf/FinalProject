package com.spring.test.user.model.service;

import java.util.Map;

public interface UserService {

	Map login(String email,String password);
	void sendEmail(String email,int random);
	int getTempKey();
	int checkEmail(String email);
	int enrollUser(Map user);
}
