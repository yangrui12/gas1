package com.aud.admin.controller;

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
import com.aud.pojo.NavMenu;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller("adminTeams")
@RequestMapping("/admin/teams")
public class TeamsController {
	@Autowired
	private NavMenuMapper navMenuMapper;
	@Autowired
	private TeamMemberMapper teamMemberMapper;

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") int id) {
		this.navMenuMapper.deleteByPrimaryKey(id);
		this.teamMemberMapper.deleteByNavMenuId(id);
		return "redirect:/admin/teams";
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap model) {
		model.addAttribute("team", this.navMenuMapper.selectByPrimaryKey(id));
		return "admin/teams/edit";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newPage() {
		return "admin/teams/new";
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			Locale locale){

		PageHelper.startPage(pageNo, pageSize);
	    List<NavMenu> list = this.navMenuMapper.allNavMenuByParentNav(2, locale.getLanguage());
	    PageInfo<NavMenu> page = new PageInfo<NavMenu>(list);
	    model.addAttribute("pages", page);

		return "admin/teams/index";
	}

	@RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
	public String update(NavMenu navMenu) {
		this.navMenuMapper.updateByPrimaryKeySelective(navMenu);
		return "redirect:/admin/teams";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(NavMenu navMenu) {
		navMenu.setParentNav(2);
		this.navMenuMapper.insertSelective(navMenu);
		return "redirect:/admin/teams";
	}
}
