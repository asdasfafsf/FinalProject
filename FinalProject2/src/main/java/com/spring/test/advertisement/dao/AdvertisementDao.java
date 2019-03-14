package com.spring.test.advertisement.dao;

import java.util.List;
import java.util.Map;

public interface AdvertisementDao {
	List<Map<String,String>> selectAdList();
}
