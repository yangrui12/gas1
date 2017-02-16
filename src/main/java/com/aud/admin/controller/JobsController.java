package com.aud.admin.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.aud.mapper.JobMapper;
import com.aud.pojo.Job;
import com.aud.tool.Utils;

@Controller("adminJobs")
@RequestMapping("/admin/jobs")
public class JobsController {

	@Autowired
	private JobMapper jobMapper;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String show(ModelMap model, Locale locale) {
		if (this.jobMapper.all(locale.getLanguage()).size() >0 ) {
			model.addAttribute("job", this.jobMapper.all(locale.getLanguage()).get(0));
		} else {
			model.addAttribute("job", null);
		}
		return "admin/jobs/show";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newPage() {
		return "admin/jobs/new";
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap model) {
		model.addAttribute("job", this.jobMapper.selectByPrimaryKey(id));
		return "admin/jobs/edit";
	}

	@RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
	public String update(@PathVariable("id") int id, Job job, MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		if(!file.isEmpty()){
			job.setImgUrl(Utils.saveFile(file, request));	
		}
		this.jobMapper.updateByPrimaryKeySelective(job);
		return "redirect:/admin/jobs";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Job job, MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		if(!file.isEmpty()){
			job.setImgUrl(Utils.saveFile(file, request));	
		}
		this.jobMapper.insertSelective(job);
		return "redirect:/admin/jobs";
	}
}
