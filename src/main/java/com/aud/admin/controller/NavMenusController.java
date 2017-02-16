package com.aud.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aud.mapper.NavMenuMapper;
import com.aud.pojo.NavMenu;

@Controller
@RequestMapping("/admin/navMenus")
public class NavMenusController {
	@Autowired NavMenuMapper navMenuMapper;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String index(ModelMap model){
		model.addAttribute("navMenus", this.navMenuMapper.all());
		return "admin/navMenus/index";
	}

	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String newPage(){
		return "admin/navMenus/new";
	}

	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(NavMenu navMenu){
		this.navMenuMapper.insertSelective(navMenu);
		return "redirect:/admin/navMenus";
	}

	@RequestMapping(value="/{navMenuId}", method=RequestMethod.POST)
	public String delete(@PathVariable("navMenuId") Integer navMenuId){
		this.navMenuMapper.deleteByPrimaryKey(navMenuId);
		return "redirect:/admin/navMenus"; 
	}
	
	@RequestMapping(value="/{navMenuId}/edit", method=RequestMethod.GET)
	public String edit(@PathVariable("navMenuId") int navMenuId, ModelMap model){
		model.put("navMenu", this.navMenuMapper.selectByPrimaryKey(navMenuId));
		return "admin/navMenus/edit";
	}
	
	@RequestMapping(value="/{navMenuId}", method=RequestMethod.PATCH)
	public String update(NavMenu navMenu){
		this.navMenuMapper.updateByPrimaryKeySelective(navMenu);
		return "redirect:/admin/navMenus";
	}
}



















