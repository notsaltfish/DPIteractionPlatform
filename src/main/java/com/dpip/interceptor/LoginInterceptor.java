package com.dpip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 登录拦截器
 */

public class LoginInterceptor extends HandlerInterceptorAdapter{



	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			request.setCharacterEncoding("UTF-8");
			HttpSession  session = request.getSession();
			//从session中获取用户 看当前是否已经登录
			Object customer = session.getAttribute("user");
			//获取当前的请求路径
			String path = request.getServletPath();
			String contextPath = request.getContextPath();
			response.setCharacterEncoding("UTF-8");
			//如果当前的用户为null说明没有登录并且请求路径不是下面这个几个 则需要返回到登录页面
			if(customer==null&&!path.equals("/patient/login")&&!path.equals("/doctor/login")
					&&!path.equals("/admin/login")){
				response.sendRedirect("/");
				return false;
			}
		return true;
	}

	
}
