package com.aud.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller("adminHomePage")
@RequestMapping("/admin/homepage")
public class HomePageController {
	@RequestMapping("")
	public String show(){
		return "admin/homepage/show";
	}
	
}
