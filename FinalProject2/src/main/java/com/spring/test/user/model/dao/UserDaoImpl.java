package com.spring.test.user.model.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	
	//임시 이메일 자료
		String email2="qwer@qwer.qwe";
		String email3="asdf@asdf.asd";


	@Override
	public Map<String, String> login(String email) {
		
		//Map으로 DB에서 email, password, userNo, outDate 받아옴
		
		Map<String,String> user=new HashMap<String,String>();
		
		
		//임시 회원 데이터
			//활동회원
		if(email.equals(email2))
		{
			user.put("EMAIL", email2);
			user.put("USERNO", "9");
			user.put("PASSWORD", "1234");
			user.put("OUTDATE", null);
		}
			//탈퇴회원
		if(email.equals(email3))
		{
			user.put("EMAIL", email3);
			user.put("USERNO", "8");
			user.put("PASSWORD", "1234");
			user.put("OUTDATE", new Date().toString());
		}
		
		return user; 
	}
	
	//회원가입
		//이메일 중복확인
		@Override
		public int checkEmail(String email) {
			
			int check = 0;
			
			//임시데이터
			if(email.equals(email2))
			{
				check=1;
			}
				//탈퇴회원
			if(email.equals(email3))
			{
				check=0;
			}
			
			return check;
		}


		//회원 정보 저장
		@Override
		public int enrollUser(Map user) {
			System.out.println(user);
			return 1;
		}
}
