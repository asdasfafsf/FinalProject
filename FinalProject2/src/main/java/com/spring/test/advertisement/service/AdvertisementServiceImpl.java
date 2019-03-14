package com.spring.test.advertisement.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.advertisement.dao.AdvertisementDao;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {
	@Autowired
	AdvertisementDao dao;
	
	@Override
	public List<Map<String, String>> selectAdList() {
		// TODO Auto-generated method stub
		return dao.selectAdList();
	}

}
