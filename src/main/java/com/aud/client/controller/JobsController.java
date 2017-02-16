package com.aud.client.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aud.mapper.JobMapper;

@Controller
@RequestMapping("/client/jobs")
public class JobsController extends BaseController{
	@Autowired
	private JobMapper jobMapper;

	@RequestMapping(value="", method=RequestMethod.GET)
	public String index(ModelMap model, Locale locale){
		if (this.jobMapper.all(locale.getLanguage()).size() >0 ) {
			model.addAttribute("job", this.jobMapper.all(locale.getLanguage()).get(0));
		} else {
			model.addAttribute("job", null);
		}
		return "client/jobs/index";
	}
	
}
