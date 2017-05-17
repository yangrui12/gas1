package com.aud.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller("adminCustomers")
@RequestMapping("/admin/customers")
public class CustomersController {
	@RequestMapping("")
	public String index(){
		
		return "admin/customers/index";
	}
}
