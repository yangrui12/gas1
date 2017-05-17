package com.aud.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("adminStatistics")
@RequestMapping("/admin/statistics")
public class StatisticsController {
	@RequestMapping("")
	public String show(){
		return "admin/statistics/index";
	}
}
