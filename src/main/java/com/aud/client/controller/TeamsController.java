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
import com.aud.mapper.TeamMemberMapper;
import com.aud.pojo.LeaveMessage;
import com.aud.pojo.TeamMember;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller("clientTeams")
@RequestMapping("/client/teams")
public class TeamsController extends BaseController{
    @Autowired
    private TeamMemberMapper teamMemberMapper;
    @Autowired
	private NavMenuMapper navMenuMapper;
    @RequestMapping(value="", method=RequestMethod.GET)
    public String index(ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="12") Integer pageSize,
			Locale locale){
		
		PageHelper.startPage(pageNo, pageSize);
	    List<TeamMember> list = this.teamMemberMapper.all(locale.getLanguage());
	    PageInfo<TeamMember> page = new PageInfo<TeamMember>(list);
	    model.addAttribute("pages", page);

        return "client/teams/index";
    }
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    public String index(@PathVariable("id") int id,ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="12") Integer pageSize,
			Locale locale){
		
		PageHelper.startPage(pageNo, pageSize);
	    List<TeamMember> list = this.teamMemberMapper.getTeamMemberByTeamId(id, locale.getLanguage());
	    PageInfo<TeamMember> page = new PageInfo<TeamMember>(list);
	    model.addAttribute("pages", page);
	    model.addAttribute("team", this.navMenuMapper.selectByPrimaryKey(id));

        return "client/teams/index";
    }
}