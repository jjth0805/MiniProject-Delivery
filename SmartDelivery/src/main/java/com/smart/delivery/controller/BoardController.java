package com.smart.delivery.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smart.delivery.dao.BoardDAO;
import com.smart.delivery.vo.DeliveryBoardVO;
@Controller
public class BoardController {
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping(value = "board/getBoardList", method = RequestMethod.GET)
	public String boardList(Model model
		,@RequestParam(value = "searchItem",defaultValue = "userId") String searchItem
		,@RequestParam(value = "searchKeyword", defaultValue = "")String searchKeyword) {
		ArrayList<DeliveryBoardVO> list = dao.boardList(searchItem, searchKeyword);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("list",list);
		return "board/boardList";
	}
	@RequestMapping(value = "board/boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm() {
		return"board/boardWriteForm";
	}
	@RequestMapping(value = "board/boardWrite", method = RequestMethod.POST)
	public String boardWrite(DeliveryBoardVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = false;
		if(dao.boardWrite(vo, session)==1) result=true;
		rttr.addAttribute("writeResult", result);
		return"redirect:/board/getBoardList";
	}
	@ResponseBody
	@RequestMapping(value = "board/boardSearch", method = RequestMethod.GET)
	public ArrayList<DeliveryBoardVO> boardSearch(String searchItem, String searchKeyword) {
		ArrayList<DeliveryBoardVO> list = dao.boardSearch(searchItem, searchKeyword);
		return list;
	}
	@RequestMapping(value="board/boardRead", method = RequestMethod.GET)
	public String boardRead (int boardNum, Model model) {
		DeliveryBoardVO vo = dao.boardRead(boardNum);
		model.addAttribute("vo",vo);
		return "board/boardRead";
	}
	@RequestMapping(value = "board/boardDelete", method = RequestMethod.GET)
	public String boardDelete(DeliveryBoardVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = false;
		if(dao.boardDelete(vo, session)!=0) result = true;
		rttr.addFlashAttribute("deleteResult", result);
		return "redirect:/board/getBoardList";
	}
	@RequestMapping(value = "board/boardUpdateForm", method = RequestMethod.GET)
	public String boardUpdateForm(int boardNum, Model model) {
		DeliveryBoardVO vo = dao.boardRead(boardNum);
		model.addAttribute("vo",vo);
		return "board/boardUpdateForm";
	}
	@RequestMapping(value = "board/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(DeliveryBoardVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = false;
		if(dao.boardUpdate(vo, session) != 0) result = true;
		rttr.addAttribute("boardNum", vo.getBoardNum());
		rttr.addFlashAttribute("updateResult", result);
		return "redirect:/board/boardRead";
	}
}
