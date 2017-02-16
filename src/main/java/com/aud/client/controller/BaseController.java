package com.aud.client.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.aud.mapper.NavMenuMapper;
import com.aud.mapper.ProjectMapper;
import com.aud.pojo.NavMenu;

public class BaseController {
	@Autowired
	private NavMenuMapper navMenuMapper;
	@Autowired
	private ProjectMapper projectMapper;

	@ModelAttribute
	public void setNavMenus(ModelMap model, Locale locale) {
		model.addAttribute("teamsNavMenus", this.navMenuMapper.allNavMenuByParentNav(2, locale.getLanguage()));
		model.addAttribute("newsNavMenus", this.navMenuMapper.allNavMenuByParentNav(3, locale.getLanguage()));

		//获取项目列表
		List<NavMenu> projectNavMenus = this.navMenuMapper.allNavMenuByParentNav(1, locale.getLanguage());
		Iterator<NavMenu> iter = projectNavMenus.iterator();
		List<Map<String, Object>> projectMenus = new ArrayList<Map<String, Object>>();

		while(iter.hasNext()){
			Map<String, Object> item = new HashMap<String, Object>();
			NavMenu navMenu = iter.next();
			item.put("secondNavMenu", navMenu);
			item.put("thridNavMenu", projectMapper.getByNavMenuId(navMenu.getId(), locale.getLanguage()));
			projectMenus.add(item);
		}
		model.addAttribute("projectNavMenus", projectMenus);
	}
}
