package com.aud.client.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aud.mapper.NavMenuMapper;
import com.aud.mapper.NewsMapper;
import com.aud.pojo.NavMenu;
import com.aud.pojo.News;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

@Controller("clientNews")
@RequestMapping("/client/newsCategories")
public class NewsCategoriesController extends BaseController {
	@Autowired
	private NavMenuMapper navMenuMapper;
	@Autowired
	private NewsMapper newsMapper;

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String index(@PathVariable("id") int newsCategoryId,ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			Locale locale){
		
		PageHelper.startPage(pageNo, pageSize);
		List<News> list = this.newsMapper.selectByNewsCategoryId(newsCategoryId);
		PageInfo<News> page = new PageInfo<News>(list);
		model.addAttribute("pages", page);
		
		List<NavMenu> newsNavMenus = this.navMenuMapper.allNavMenuByParentNav(3, locale.getLanguage());
		model.addAttribute("newsNavMenus", newsNavMenus);
		model.addAttribute("currentNewsCategoryId", newsCategoryId);

		return "client/newsCategories/index";
	}
}
