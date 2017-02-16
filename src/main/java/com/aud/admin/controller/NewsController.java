package com.aud.admin.controller;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.aud.mapper.NavMenuMapper;
import com.aud.mapper.NewsMapper;
import com.aud.pojo.LeaveMessage;
import com.aud.pojo.News;
import com.aud.tool.Utils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
@Controller("adminNews")
@RequestMapping("/admin/newsCategories/{newsCategoryId}/news")
public class NewsController {
    @Autowired
    private NavMenuMapper navMenuMapper;
    @Autowired
    private NewsMapper newsMapper;
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(@PathVariable("newsCategoryId") int id, ModelMap model,	
    		@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize){
		
		PageHelper.startPage(pageNo, pageSize);
	    List<News> list = this.newsMapper.selectByNewsCategoryId(id);
	    PageInfo<News> page = new PageInfo<News>(list);
	    model.addAttribute("pages", page);

        model.addAttribute("newsCategory", this.navMenuMapper.selectByPrimaryKey(id));
        return "admin/news/index";
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable("id") int id, ModelMap model) {
        model.addAttribute("news", this.newsMapper.selectByPrimaryKey(id));
        return "admin/news/edit";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("newsCategoryId") int newsCategoryId, @PathVariable("id") int id, ModelMap model) {
        this.newsMapper.deleteByPrimaryKey(id);
        return "redirect:/admin/newsCategories/"+newsCategoryId+"/news";
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newPage(@PathVariable("newsCategoryId") int newsCategoryId, ModelMap model) {
        model.addAttribute("newsCategory", this.navMenuMapper.selectByPrimaryKey(newsCategoryId));
        return "admin/news/new";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String update(@PathVariable("newsCategoryId") int id, News news,MultipartFile file, HttpServletRequest request)throws IllegalStateException, IOException {
        if(!file.isEmpty()){
            news.setHeadImg(Utils.saveFile(file, request));	
        }
        this.newsMapper.updateByPrimaryKeySelective(news);
        return "redirect:/admin/newsCategories/"+id+"/news";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String create(@PathVariable("newsCategoryId") int id, News news,MultipartFile file, HttpServletRequest request, Locale locale)throws IllegalStateException, IOException {
        news.setNavmenueId(id);
        news.setPublishAt(new Date());
        news.setHeadImg(Utils.saveFile(file, request));
        news.setLang(locale.getLanguage());
        this.newsMapper.insertSelective(news);
        return "redirect:/admin/newsCategories/"+id+"/news";
    }
}