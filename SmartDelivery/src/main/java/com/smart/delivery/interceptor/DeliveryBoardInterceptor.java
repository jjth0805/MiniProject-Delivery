package com.smart.delivery.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class DeliveryBoardInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		if(userId==null) {
			response.sendRedirect(request.getContextPath()+"/membership/loginForm");
			return false;
		}
		return true;
	}
}
