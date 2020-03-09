package com.smart.delivery.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smart.delivery.vo.MemberVO;
@Repository
public class MemberDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	public boolean signup(MemberVO vo) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.signup(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result==1) return true;
		return false;
	}
	public boolean login(MemberVO vo, HttpSession session) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.login(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result==0) return false;
		session.setAttribute("userId", vo.getUserId());
		return true;
	}
	public void logout(HttpSession session) {
		session.removeAttribute("userId");
	}
	
	public int checkid(String userId) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.checkid(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
