package com.spring.test.notice.dao;

import java.util.List;
import java.util.Map;

public interface NoticeDao {
	List<Map<String,String>> selectMainNoticeList();
}
