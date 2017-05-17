package com.aud.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("adminAlarm")
@RequestMapping("/admin/alarm")
public class AlarmController {
	@RequestMapping("")
	public String show(){
		return "admin/alarm/index";
	}
}
