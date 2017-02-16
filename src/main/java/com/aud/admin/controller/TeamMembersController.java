package com.aud.admin.controller;
import java.io.IOException;
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
import com.aud.mapper.ProjectMapper;
import com.aud.mapper.TeamMemberMapper;
import com.aud.mapper.TeamMemberProjectMapper;
import com.aud.pojo.NavMenu;
import com.aud.pojo.TeamMember;
import com.aud.pojo.TeamMemberProject;
import com.aud.tool.Utils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
@Controller("adminTeamMembers")
@RequestMapping("/admin/teams/{teamId}/teamMembers")
public class TeamMembersController {
    @Autowired
    private NavMenuMapper navMenuMapper;
    @Autowired
    private TeamMemberMapper teamMemberMapper;
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private TeamMemberProjectMapper teamMemberProjectMapper;
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(@PathVariable("teamId") int teamId, ModelMap model,
			@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			Locale locale){

        model.addAttribute("team", this.navMenuMapper.selectByPrimaryKey(teamId));

		PageHelper.startPage(pageNo, pageSize);
	    List<TeamMember> list = this.teamMemberMapper.getTeamMemberByTeamId(teamId, locale.getLanguage());
	    PageInfo<TeamMember> page = new PageInfo<TeamMember>(list);
	    model.addAttribute("pages", page);

        return "admin/teamMembers/index";
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("teamId") int teamId, @PathVariable("id") int id) {
        this.teamMemberMapper.deleteByPrimaryKey(id);
        
        return "redirect:/admin/teams/" + teamId + "/teamMembers";
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable("teamId") int teamId, @PathVariable("id") int id, ModelMap model, Locale locale) {
        model.addAttribute("team", this.navMenuMapper.selectByPrimaryKey(teamId));
        model.addAttribute("teamMember", this.teamMemberMapper.selectByPrimaryKey(id));
        model.addAttribute("projects", this.projectMapper.all(locale.getLanguage()));
        model.addAttribute("teamMemberProjects", this.teamMemberProjectMapper.selectByTeamMemberId(id));
        return "admin/teamMembers/edit";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String create(@PathVariable("teamId") int teamId, TeamMember teamMember, MultipartFile file, MultipartFile personFile, HttpServletRequest request, int[] projectIds, Locale local)
            throws IllegalStateException, IOException {
    	if(!file.isEmpty()){
            teamMember.setImgUrl(Utils.saveFile(file, request));
    	}
    	if(!personFile.isEmpty()){
    		teamMember.setCard(Utils.saveFile(personFile, request));
    	}
        teamMember.setNavMenuId(teamId);
        teamMember.setLang(local.getLanguage());
        teamMember.setCreatedAt(new Date());
        this.teamMemberMapper.insertSelective(teamMember);
        int userId = this.teamMemberMapper.getMaxId();
        if(projectIds!=null){
          for(int projectId : projectIds){
            TeamMemberProject relation = new TeamMemberProject();
            relation.setProjectId(projectId);
            relation.setTeamMemberId(userId);
            this.teamMemberProjectMapper.insertSelective(relation);
          }
        }
        return "redirect:/admin/teams/" + teamMember.getNavMenuId() + "/teamMembers";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String update(@PathVariable("teamId") int teamId, @PathVariable("id") int id, TeamMember teamMember, int[] projectIds, MultipartFile file, MultipartFile personFile, HttpServletRequest request) throws IllegalStateException, IOException {
    	if(!file.isEmpty()){
            teamMember.setImgUrl(Utils.saveFile(file, request));
    	}
    	if(!personFile.isEmpty()){
    		teamMember.setCard(Utils.saveFile(personFile, request));
    	}
    	teamMember.setUpdatedAt(new Date());
        this.teamMemberMapper.updateByPrimaryKeySelective(teamMember);
        if(projectIds!=null){
            for(int projectId : projectIds){
                TeamMemberProject relation = new TeamMemberProject();
                relation.setProjectId(projectId);
                relation.setTeamMemberId(id);
                this.teamMemberProjectMapper.insertSelective(relation);
            }
        }
        return "redirect:/admin/teams/" + teamId + "/teamMembers";
    }
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newPage(@PathVariable("teamId") int teamId, ModelMap model, Locale locale) {
        model.addAttribute("team", this.navMenuMapper.selectByPrimaryKey(teamId));
        model.addAttribute("projects", this.projectMapper.all(locale.getLanguage()));
        return "admin/teamMembers/new";
    }
}