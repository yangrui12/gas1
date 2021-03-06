package com.aud.admin.controller;

//文件上传 http://www.cnblogs.com/mumuxinfei/p/5363909.html
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.baidu.ueditor.ActionEnter;

@Controller
@RequestMapping("/admin/ued")
public class UEditorController {

	@RequestMapping(value = "/config")
	public void config(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		try {
			String exec = new ActionEnter(request, rootPath).exec();
			PrintWriter writer = response.getWriter();
			writer.write(exec);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String newPage(){
		return "admin/ued/new";
	}
}