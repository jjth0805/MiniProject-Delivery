package com.smart.delivery.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smart.delivery.vo.CustomerBoardVO;


@Repository
public class CustomerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<CustomerBoardVO> customerBoardList(String searchItem, String searchKeyword){
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		ArrayList<CustomerBoardVO> list=null;
		try {
			// System.out.println("1");
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			list = mapper.customerBoardList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int customerBoardWrite(CustomerBoardVO vo, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		int result = 0;
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			result = mapper.customerBoardWrite(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<CustomerBoardVO> customerBoardSearch(String searchItem, String searchKeyword){
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		ArrayList<CustomerBoardVO> list = null;
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			list = mapper.customerBoardSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public CustomerBoardVO customerBoardRead(int boardNum) {
		CustomerBoardVO vo = null;
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			mapper.customerBoardHit(boardNum);
			vo = mapper.customerBoardRead(boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	public int customerBoardDelete(CustomerBoardVO vo, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		int result = 0;
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			result = mapper.customerBoardDelete(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int customerBoardUpdate(CustomerBoardVO vo, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		int result = 0;
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			result = mapper.customerBoardUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
