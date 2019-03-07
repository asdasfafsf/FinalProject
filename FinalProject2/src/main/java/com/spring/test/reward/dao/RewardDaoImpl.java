package com.spring.test.reward.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RewardDaoImpl {
	@Autowired
	SqlSessionTemplate session;
}
