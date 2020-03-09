package com.smart.delivery.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.smart.delivery.vo.DeliveryBoardVO;

public interface BoardMapper {

	public ArrayList<DeliveryBoardVO> boardList(HashMap<String, String>map);
	public int boardWrite(DeliveryBoardVO vo);
	public ArrayList<DeliveryBoardVO> boardSearch(HashMap<String, String>map);
	public DeliveryBoardVO boardRead(int boardNum);
	public int boardDelete(DeliveryBoardVO vo);
	public void boardHit(int boardNum);
	public int boardUpdate(DeliveryBoardVO vo);
}
