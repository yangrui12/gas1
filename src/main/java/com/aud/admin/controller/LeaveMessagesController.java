package com.aud.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aud.mapper.LeaveMessageMapper;

@Controller
@RequestMapping("/admin/leaveMessages")
public class LeaveMessagesController {
  @Autowired
  private LeaveMessageMapper leaveMessageMapper;
  
  @RequestMapping(value="/{id}", method=RequestMethod.GET)  
  public String show(@PathVariable("id") int id, ModelMap model){
	  model.addAttribute("leaveMessage", this.leaveMessageMapper.selectByPrimaryKey(id));
	  return "admin/leaveMessages/show";
  }
}
