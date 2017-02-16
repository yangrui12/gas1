package com.aud.client.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aud.mapper.NewsMapper;
import com.aud.pojo.News;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/client/newsCategories/{newsCategoryId}/news")
public class NewsController extends BaseController {

	@Autowired
	private NewsMapper newsMapper;

	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public String show(@PathVariable("newsCategoryId") int newsCategoryId, @PathVariable("id") int id, ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize){
		
		PageHelper.startPage(pageNo, pageSize);
		List<News> list = this.newsMapper.selectByNewsCategoryId(newsCategoryId);
		PageInfo<News> page = new PageInfo<News>(list);
		model.addAttribute("pages", page);
    
		model.addAttribute("newItem", this.newsMapper.selectByPrimaryKey(id));
		return "client/news/show";
	}
}
