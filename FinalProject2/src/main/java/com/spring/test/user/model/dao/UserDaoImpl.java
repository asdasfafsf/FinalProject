package com.spring.test.user.model.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public Map<String, String> login(String email) {
		
		//Map으로 DB에서 email, password, userNo, outDate 받아옴
		Map<String,String> user=session.selectOne("user.selectUser",email);
		
		return user; 
	}
	
	//회원가입
		//이메일 중복확인
		@Override
		public int checkEmail(String email) {
			
			/*int check = 0;
			
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
			
			return check;*/
			
			return session.selectOne("user.selectUserEmail",email);
		}


		//회원 정보 저장
		@Override
		public int enrollUser(Map user) {
			return session.insert("user.insertUser", user);
		}

		
	//id & pw 찾기
		//id 찾기
		@Override
		public Map findId(String email) {
			Map map=session.selectOne("user.findId",email);
			return map;
		}
		
}
