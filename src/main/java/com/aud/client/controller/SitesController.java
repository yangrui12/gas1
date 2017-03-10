package com.aud.client.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aud.mapper.BannerMapper;
import com.aud.mapper.NewsMapper;
import com.aud.pojo.News;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping({"/sites", "/"})
public class SitesController extends BaseController {
    @Autowired
    private BannerMapper bannerMapper;
    @Autowired
    private NewsMapper newsMapper;

    @RequestMapping(value = "", method=RequestMethod.GET)
    public String show(ModelMap model, Locale locale){
    	Map<String, Object> testMap = new HashMap<>();
    	testMap.put("test", "testHash");

    	PageHelper.startPage(1, 4);
	    List<News> list = this.newsMapper.all(locale.getLanguage());
	    PageInfo<News> page = new PageInfo<News>(list);
	    model.addAttribute("pages", page);
        model.addAttribute("banners", this.bannerMapper.all(locale.getLanguage()));

        return "client/sites/show";
    }
}