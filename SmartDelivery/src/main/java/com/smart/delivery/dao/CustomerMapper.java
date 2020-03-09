package com.smart.delivery.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.smart.delivery.vo.CustomerBoardVO;

public interface CustomerMapper {

	public ArrayList<CustomerBoardVO> customerBoardList(HashMap<String, String>map);
	public int customerBoardWrite(CustomerBoardVO vo);
	public ArrayList<CustomerBoardVO> customerBoardSearch(HashMap<String, String>map);
	public CustomerBoardVO customerBoardRead(int boardNum);
	public int customerBoardDelete(CustomerBoardVO vo);
	public void customerBoardHit(int boardNum);
	public int customerBoardUpdate(CustomerBoardVO vo);
	
}
