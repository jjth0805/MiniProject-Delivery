package com.smart.delivery.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smart.delivery.vo.DeliveryBoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<DeliveryBoardVO>boardList(String searchItem, String searchKeyword){
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		ArrayList<DeliveryBoardVO> list=null;
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			list = mapper.boardList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int boardWrite(DeliveryBoardVO vo, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		int result = 0;
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			result = mapper.boardWrite(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<DeliveryBoardVO> boardSearch(String searchItem, String searchKeyword){
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		ArrayList<DeliveryBoardVO> list = null;
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			list = mapper.boardSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public DeliveryBoardVO boardRead(int boardNum) {
		DeliveryBoardVO vo = null;
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			mapper.boardHit(boardNum);
			vo = mapper.boardRead(boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	public int boardDelete(DeliveryBoardVO vo, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		int result = 0;
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			result = mapper.boardDelete(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int boardUpdate(DeliveryBoardVO vo, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		int result = 0;
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			result = mapper.boardUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
