package com.dpip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter{



	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			request.setCharacterEncoding("UTF-8");
			HttpSession  session = request.getSession();
			Object customer = session.getAttribute("user");
			String path = request.getServletPath();
			String contextPath = request.getContextPath();
			response.setCharacterEncoding("UTF-8");
			if(customer==null&&!path.equals("/patient/login")&&!path.equals("/doctor/login")
					&&!path.equals("/admin/login")){
				response.sendRedirect("/");
				return false;
			}
		return true;
	}

	
}
