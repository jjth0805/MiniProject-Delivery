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

import com.smart.delivery.dao.CustomerDAO;
import com.smart.delivery.vo.CustomerBoardVO;

@Controller
public class CustomerController {

	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping(value = "customer/getCustomerBoardList", method = {RequestMethod.GET, RequestMethod.POST})
	public String customerBoardList(Model model
		,@RequestParam(value = "searchItem",defaultValue = "userId") String searchItem
		,@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword) {
		ArrayList<CustomerBoardVO> list = dao.customerBoardList(searchItem, searchKeyword);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("list",list);
		return "customer/customerBoardList";
	}
	@RequestMapping(value = "customer/customerBoardWriteForm", method = RequestMethod.GET)
	public String customerBoardWriteForm() {
		return"customer/customerBoardWriteForm";
	}
	@RequestMapping(value = "customer/customerBoardWrite", method = RequestMethod.POST)
	public String customerBoardWrite(CustomerBoardVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = false;
		if(dao.customerBoardWrite(vo, session)==1) result=true;
		rttr.addAttribute("writeResult", result);
		return"redirect:/customer/getCustomerBoardList";
	}
	@ResponseBody
	@RequestMapping(value = "customer/customerBoardSearch", method = RequestMethod.GET)
	public ArrayList<CustomerBoardVO> customerBoardSearch(String searchItem, String searchKeyword) {
		ArrayList<CustomerBoardVO> list = dao.customerBoardSearch(searchItem, searchKeyword);
		System.out.println(list);
		return list;
	}
	@RequestMapping(value="customer/customerBoardRead", method = RequestMethod.GET)
	public String customerBoardRead (int boardNum, Model model) {
		CustomerBoardVO vo = dao.customerBoardRead(boardNum);
		model.addAttribute("vo",vo);
		return "customer/customerBoardRead";
	}
	@RequestMapping(value = "customer/customerBoardDelete", method = RequestMethod.GET)
	public String customerBoardDelete(CustomerBoardVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = false;
		if(dao.customerBoardDelete(vo, session)!=0) result = true;
		rttr.addFlashAttribute("deleteResult", result);
		return "redirect:/customer/getCustomerBoardList";
	}
	@RequestMapping(value = "customer/customerBoardUpdateForm", method = RequestMethod.GET)
	public String customerBoardUpdateForm(int boardNum, Model model) {
		CustomerBoardVO vo = dao.customerBoardRead(boardNum);
		model.addAttribute("vo",vo);
		return "customer/customerBoardUpdateForm";
	}
	@RequestMapping(value = "customer/customerBoardUpdate", method = RequestMethod.POST)
	public String customerBoardUpdate(CustomerBoardVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = false;
		if(dao.customerBoardUpdate(vo, session) != 0) result = true;
		rttr.addAttribute("boardNum", vo.getBoardNum());
		rttr.addFlashAttribute("updateResult", result);
		return "redirect:/customer/customerBoardRead";
	}
}
