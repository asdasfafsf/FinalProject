package com.spring.test.advertisement.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.advertisement.service.AdvertisementService;

@Repository
public class AdvertisementDaoImpl implements AdvertisementDao {
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectAdList() {
		// TODO Auto-generated method stub
		return session.selectList("ad.selectAdList");
	}

}
