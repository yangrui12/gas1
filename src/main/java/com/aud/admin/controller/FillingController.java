package com.aud.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminFilling")
@RequestMapping("/admin/filling")
public class FillingController {
	@RequestMapping("")
	public String show(){
		return "admin/filling/index";
	}
}
