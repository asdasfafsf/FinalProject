package com.spring.test.user.model.service;

import java.util.Map;

public interface UserService {

	Map<String, String> login(String email);
	void sendEmail(String email,int random);
	int getTempKey();
}
