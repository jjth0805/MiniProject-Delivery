package com.smart.delivery.dao;

import com.smart.delivery.vo.MemberVO;

public interface MemberMapper {

	public int signup(MemberVO vo);
	public int login(MemberVO vo);
	public int checkid(String userId);
}
