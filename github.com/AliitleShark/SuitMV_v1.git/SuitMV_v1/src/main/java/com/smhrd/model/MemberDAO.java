package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 메소드 생성
	
	// 회원가입
	// SQL : insert into web_member values(id, pw, email)
	public int join(MemberDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("join", dto);
		
		return row;
	}
	
	// 로그인
	// SQL : select * from MV_member where id=? and pw=?
	public MemberDTO login(MemberDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		MemberDTO login_info = session.selectOne("login", dto);
		
		return login_info;
	}
	
	// 회원정보 수정
	// SQL : update MV_member set pw=?, email=? mbti=? where id=?
	public int update(MemberDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.update("update", dto);
		
		return row;
	}
	
	// 아이디 중복체크
	// result false = 중복아이디 없음
	// result true = 중복아이디 있음
	public boolean idCheck(String check_id) {
		boolean result = false;
		SqlSession session = sqlSessionFactory.openSession(true);
		String id = session.selectOne("idCheck", check_id);
		
		// id값이 null이 아닐때 = 중복되는 id값이 있다.
		if(id != null) {
			result = true;
		}
		
		return result;
	}

}
