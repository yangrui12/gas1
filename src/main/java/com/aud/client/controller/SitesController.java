package com.aud.client.controller;
import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aud.mapper.BannerMapper;
import com.aud.mapper.NewsMapper;
import com.aud.pojo.LeaveMessage;
import com.aud.pojo.News;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
@Controller
@RequestMapping({"/sites", "/"})
public class SitesController extends BaseController {
    @Autowired
    private BannerMapper bannerMapper;
    @Autowired
    private NewsMapper newsMapper;
	private static Logger logger = Logger.getLogger(SitesController.class);

    @RequestMapping(value = "", method=RequestMethod.GET)
    public String show(ModelMap model, Locale locale){
    	PageHelper.startPage(1, 4);
	    List<News> list = this.newsMapper.all(locale.getLanguage());
	    PageInfo<News> page = new PageInfo<News>(list);
	    model.addAttribute("pages", page);
        model.addAttribute("banners", this.bannerMapper.all(locale.getLanguage()));

        return "client/sites/show";
    }
}
