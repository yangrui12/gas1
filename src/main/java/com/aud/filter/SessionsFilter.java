package com.aud.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SessionsFilter implements HandlerInterceptor {
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
	    throws Exception {
	}
	
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
	    throws Exception {
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// 1、请求到登录页面 放行
		if (request.getServletPath().startsWith("/admin") && request.getServletPath().startsWith("/admin/sessions")) {
			return true;
		}
		if (request.getSession().getAttribute("userId") != null) {
			//TODO 更好的实现方式的使用cookie
			return true;
		}

		if(!request.getServletPath().startsWith("/admin")){
			return true;
		}

		// 4、非法请求 即这些请求需要登录后才能访问
		// 重定向到登录页面
		response.sendRedirect(request.getContextPath() + "/admin/sessions/new?backUrl="+request.getServletPath());
		return false;
	}
}
