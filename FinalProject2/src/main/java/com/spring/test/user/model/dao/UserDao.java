package com.spring.test.user.model.dao;

import java.util.Map;

public interface UserDao {

	Map<String, String> login(String email);
}
