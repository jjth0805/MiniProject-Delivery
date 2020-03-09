package com.smart.delivery.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smart.delivery.dao.MemberDAO;
import com.smart.delivery.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	public MemberDAO dao;
	//회원가입 화면 팝업
	@RequestMapping(value = "membership/signupForm", method = RequestMethod.GET)
	public String signupForm() {
		return "membership/signupForm";
	}
	@RequestMapping(value = "membership/signup", method = RequestMethod.POST)
	public String signup(MemberVO vo,RedirectAttributes rttr) {
		System.out.println(vo);
		boolean result = dao.signup(vo);
		rttr.addFlashAttribute("signupResult",result);
		return "redirect:/";
	}
	//로그인 화면
	@RequestMapping(value = "membership/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "membership/loginForm";
	}
	@RequestMapping(value = "membership/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = dao.login(vo, session);
		if(result) return "redirect:/";
		rttr.addFlashAttribute("loginResult", result);
		return "redirect:/membership/loginForm";
	}
	@RequestMapping(value = "membership/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		dao.logout(session);
		return "redirect:/";
	}
	@RequestMapping(value = "membership/idCheckForm", method = RequestMethod.GET)
	public String idCheckForm() {
		return "membership/idCheckForm";
	}
	@RequestMapping(value = "membership/checkid", method = RequestMethod.POST)
	public String checkid(String userId, RedirectAttributes rttr) {
		boolean checkResult = false; 
		if(dao.checkid(userId)==0) checkResult = true;
		rttr.addFlashAttribute("checkResult",checkResult);
		rttr.addFlashAttribute("userId", userId);
		return "redirect:/membership/idCheckForm";
	}
}
