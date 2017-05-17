package com.aud.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aud.mapper.DashboradMapper;
import com.aud.mapper.LeaveMessageMapper;
import com.aud.pojo.Dashborad;
import com.aud.pojo.Distribution;
import com.aud.pojo.LeaveMessage;
import com.aud.pojo.Project;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

@Controller("adminDashborad")
@RequestMapping("/admin/dashborad")
public class DashboradController {
    /*@Autowired
	private LeaveMessageMapper leaveMessageMapper;*/
    @Autowired
    private DashboradMapper dashboradMapper;

	/*@RequestMapping("")
	public String show(ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize){
		
		PageHelper.startPage(pageNo, pageSize);
	    List<LeaveMessage> list = this.leaveMessageMapper.all();
	    PageInfo<LeaveMessage> page = new PageInfo<LeaveMessage>(list);
	    model.addAttribute("pages", page);

		return "admin/dashborad/show";
	}*/

   /* @RequestMapping("/leaveMessages/{id}/delete")
	public String deleteMessage(@PathVariable("id") int id){
		this.leaveMessageMapper.deleteByPrimaryKey(id);
		return "redirect:/admin/dashborad";
	}*/
    
	@RequestMapping(value="",method=RequestMethod.GET)
	public String index(ModelMap model,Dashborad dashborad,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize){
		
		List<Dashborad> list = this.dashboradMapper.selectBySelective(dashborad);
		System.out.println("-----list: "+new Gson().toJson(list));
		PageHelper.startPage(pageNo, pageSize);
	    list = this.dashboradMapper.selectBySelective(dashborad);
	    PageInfo<Dashborad> page = new PageInfo<Dashborad>(list);
	    
	    model.addAttribute("pages", page);
	    model.addAttribute("dashboradId", dashborad);

		return "admin/dashborad/index";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newpage(ModelMap model, Dashborad dashborad) {
		model.addAttribute("dashboradId", dashborad);
		return "/admin/dashborad/new";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	  public String create(Dashborad dashborad){
		  this.dashboradMapper.insertSelective(dashborad);
		  return "redirect:/admin/dashborad";
	  }
	@RequestMapping(value="/{id}/delete", method=RequestMethod.GET)
	  public String delete(@PathVariable("id") int id){
		  this.dashboradMapper.deleteByPrimaryKey(id);
		  return "redirect:/admin/dashborad";
	  }
	@RequestMapping(value="/{id}/edit", method=RequestMethod.GET)
	  public String edit(@PathVariable("id") int id, ModelMap model){
		  model.addAttribute("dashborad", this.dashboradMapper.selectByPrimaryKey(id));
		  System.out.println("this.dashboradMapper.selectByPrimaryKey(id)" + this.dashboradMapper.selectByPrimaryKey(id));
		  return "/admin/dashborad/edit";
	  }
	
	@RequestMapping(value="/{id}/update", method=RequestMethod.POST)
	  public String update(@PathVariable("id") int id, Dashborad dashborad, String backUrl){
		  this.dashboradMapper.updateByPrimaryKeySelective(dashborad);
		  System.out.println("this.dashboradMapper.updateByPrimaryKeySelective" + this.dashboradMapper.updateByPrimaryKeySelective(dashborad));
		  return "redirect:"+backUrl;
	  }

	
}
