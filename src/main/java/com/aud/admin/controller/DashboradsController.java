package com.aud.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aud.mapper.LeaveMessageMapper;
import com.aud.pojo.LeaveMessage;
import com.aud.pojo.Project;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/dashborad")
public class DashboradsController {
    @Autowired
	private LeaveMessageMapper leaveMessageMapper;

	@RequestMapping("")
	public String show(ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize){
		
		PageHelper.startPage(pageNo, pageSize);
	    List<LeaveMessage> list = this.leaveMessageMapper.all();
	    PageInfo<LeaveMessage> page = new PageInfo<LeaveMessage>(list);
	    model.addAttribute("pages", page);

		return "admin/dashborad/show";
	}

	@RequestMapping("/leaveMessages/{id}/delete")
	public String deleteMessage(@PathVariable("id") int id){
		this.leaveMessageMapper.deleteByPrimaryKey(id);
		return "redirect:/admin/dashborad";
	}
}
