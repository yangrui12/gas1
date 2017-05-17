package com.aud.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminGasType")
@RequestMapping("/admin/gastype")
public class GasTypeController {
	@RequestMapping("")
	public String show(){
		return "admin/gastype/index";
	}
}
