package com.aud.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aud.mapper.DistributionMapper;
import com.aud.pojo.Distribution;
import com.aud.pojo.News;
import com.aud.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

@Controller("adminDistribution")
@RequestMapping("/admin/distribution")
public class DistributionContrroller {
	
	@Autowired
	private DistributionMapper distributionMapper;
	
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String index(ModelMap model, Distribution distribution, 
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize) {
		
		List<Distribution> list = this.distributionMapper.selectBySelective(distribution);
		System.out.println("-----------------list: "+new Gson().toJson(list));
		PageHelper.startPage(pageNo, pageSize);
	    list = this.distributionMapper.selectBySelective(distribution);
	    PageInfo<Distribution> page = new PageInfo<Distribution>(list);
	    
	    model.addAttribute("pages", page);
	    model.addAttribute("distributionId", distribution);

		return "/admin/distribution/index";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newpage(ModelMap model, Distribution distribution) {
		model.addAttribute("distributionId", distribution);
		return "/admin/distribution/new";
	}
    
	@RequestMapping(value="/{id}/edit", method=RequestMethod.GET)
	  public String edit(@PathVariable("id") int id, ModelMap model){
		  model.addAttribute("distribution", this.distributionMapper.selectByPrimaryKey(id));
		  System.out.println("this.distributionMapper.selectByPrimaryKey(id)" + this.distributionMapper.selectByPrimaryKey(id));
		  return "/admin/distribution/edit";
	  }
	
	 @RequestMapping(value="/{id}/delete", method=RequestMethod.GET)
	  public String delete(@PathVariable("id") int id){
		  this.distributionMapper.deleteByPrimaryKey(id);
		  return "redirect:/admin/distribution";
	  }
	 
	 @RequestMapping(value="/{id}/update", method=RequestMethod.POST)
	  public String update(@PathVariable("id") int id, Distribution distribution, String backUrl){
		  this.distributionMapper.updateByPrimaryKeySelective(distribution);
		  System.out.println("this.distributionMapper.updateByPrimaryKeySelective" + this.distributionMapper.updateByPrimaryKeySelective(distribution));
		  return "redirect:"+backUrl;
	  }
	 @RequestMapping(value="", method=RequestMethod.POST)
	  public String create(Distribution distribution){
		  this.distributionMapper.insertSelective(distribution);
		  return "redirect:/admin/distribution";
	  }
	
}
