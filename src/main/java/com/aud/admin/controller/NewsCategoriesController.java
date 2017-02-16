package com.aud.admin.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aud.mapper.NavMenuMapper;
import com.aud.mapper.NewsMapper;
import com.aud.pojo.NavMenu;
import com.aud.pojo.News;

@Controller("adminCatetory")
@RequestMapping("/admin/newsCategories")
public class NewsCategoriesController {
	@Autowired
	private NavMenuMapper navMenuMapper;
	@Autowired
	private NewsMapper newsMapper;

	@RequestMapping(value="", method=RequestMethod.GET)
	public String index(ModelMap model, Locale locale){
		model.addAttribute("newsCategories", this.navMenuMapper.allNavMenuByParentNav(3, locale.getLanguage()));
		return "admin/newsCategories/index";
	}
	
	@RequestMapping(value="/{id}/edit", method=RequestMethod.GET)
	public String edit(ModelMap model, @PathVariable("id") int id){
		model.addAttribute("newsCategory", this.navMenuMapper.selectByPrimaryKey(id));
		return "admin/newsCategories/edit";
	}

	@RequestMapping(value="/{id}/update", method=RequestMethod.POST)
	public String update(ModelMap model, @PathVariable("id") int id, NavMenu navMenu){
		this.navMenuMapper.updateByPrimaryKeySelective(navMenu);
		return "redirect:/admin/newsCategories";
	}

	@RequestMapping(value="/{id}/delete", method=RequestMethod.POST)
	public String delete(ModelMap model, @PathVariable("id") int id){
		this.navMenuMapper.deleteByPrimaryKey(id);
		this.newsMapper.deleteByNavMenuId(id);
		return "redirect:/admin/newsCategories";
	}

	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String newPage(){
		return "admin/newsCategories/new";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(NavMenu navMenu, Locale locale){
		navMenu.setParentNav(3);
		navMenu.setLang(locale.getLanguage());
		this.navMenuMapper.insertSelective(navMenu);
		return "redirect:/admin/newsCategories";
	}

}
