package com.spring.test.user.model.dao;

import java.util.Map;

public interface UserDao {

	Map<String, String> login(String email);
	int checkEmail(String email);
	int enrollUser(Map user);
	Map findId(String email);
}
