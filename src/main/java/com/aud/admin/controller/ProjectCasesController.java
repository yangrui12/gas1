package com.aud.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.tomcat.jni.Local;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.aud.mapper.NavMenuMapper;
import com.aud.mapper.ProjectMapper;
import com.aud.pojo.NavMenu;
import com.aud.pojo.Project;
import com.aud.tool.Utils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/projectCases")
public class ProjectCasesController {
	@Autowired
	private NavMenuMapper navMenuMapper;
	@Autowired
	private ProjectMapper projectMapper;

	@RequestMapping(value = "/{id}", method=RequestMethod.GET)
	public String show(@PathVariable("id") int id, ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			Locale locale){
		
		PageHelper.startPage(pageNo, pageSize);
	    List<Project> list = this.projectMapper.getByNavMenuId(id, locale.getLanguage());
	    PageInfo<Project> page = new PageInfo<Project>(list);
        
		model.addAttribute("navMenu", this.navMenuMapper.selectByPrimaryKey(id));
		model.addAttribute("pages", page);
		return "admin/projectCases/show";
	}
	
	@RequestMapping(value = "/{id}/edit", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap model){
		model.addAttribute("navMenu", this.navMenuMapper.selectByPrimaryKey(id));
		return "admin/projectCases/edit";
	}

	@RequestMapping(value = "", method=RequestMethod.GET)
	public String index(ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			Locale locale){

		PageHelper.startPage(pageNo, pageSize);
	    List<NavMenu> list = this.navMenuMapper.allNavMenuByParentNav(1, locale.getLanguage());
	    PageInfo<NavMenu> page = new PageInfo<NavMenu>(list);
	    model.addAttribute("pages", page);

		return "admin/projectCases/index";
	}

	@RequestMapping(value = "/new", method=RequestMethod.GET)
	public String newPage(){
		return "admin/projectCases/new";
	}
	
	@RequestMapping(value = "/{id}/delete", method=RequestMethod.POST)
	public String delete(@PathVariable("id") int id){
		this.navMenuMapper.deleteByPrimaryKey(id);
		this.projectMapper.deleteByNavMenuId(id);
		return "redirect:/admin/projectCases";
	}
	
	@RequestMapping(value = "/{id}/update", method=RequestMethod.POST)
	public String update(NavMenu navMenu, MultipartFile file, HttpServletRequest request, Locale locale) throws IllegalStateException, IOException{
		if(!file.isEmpty()){
			navMenu.setImgUrl(Utils.saveFile(file, request));	
		}
		this.navMenuMapper.updateByPrimaryKeySelective(navMenu);
		return "redirect:/admin/projectCases";
	}

	@RequestMapping(value = "", method=RequestMethod.POST)
	public String create(NavMenu navMenu, MultipartFile file, HttpServletRequest request, Locale locale) throws IllegalStateException, IOException{
		if(!file.isEmpty()){
			navMenu.setImgUrl(Utils.saveFile(file, request));	
		}
		navMenu.setParentNav(1);
		navMenu.setLang(locale.getLanguage());

		this.navMenuMapper.insertSelective(navMenu);
		return "redirect:/admin/projectCases";
	}
}
