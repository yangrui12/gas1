package com.aud.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("adminStorage")
@RequestMapping("/admin/storage")
public class StorageController {
	@RequestMapping("")
	public String show(){
		return "admin/storage/index";
	}
}
