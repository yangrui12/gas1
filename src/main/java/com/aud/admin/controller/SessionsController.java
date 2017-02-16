package com.aud.admin.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aud.mapper.UserMapper;
import com.aud.pojo.User;

@Controller
@RequestMapping("/admin/sessions")
public class SessionsController {
	@Autowired
	private UserMapper userMapper;

	@RequestMapping(value = {"/new", "", "/"}, method = RequestMethod.GET)
	public String newPage() {
		return "admin/sessions/new";
	}

	@RequestMapping(value = "/{id}/logOut", method = RequestMethod.GET)
	public String logOut(@PathVariable("id") int id, HttpSession session) {
		session.invalidate();
		return "redirect:/admin/sessions/new";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(User user, HttpSession session, String backUrl) {
		List<User> users = userMapper.selectByUser(user);
		if (users != null) {
			Iterator<User> iter = users.iterator();
			while (iter.hasNext()) {
				User newUser = iter.next();
				session.setAttribute("userId", newUser.getId());
				session.setAttribute("name", newUser.getName());
				session.setAttribute("isRoot", newUser.getRoot());
			}
			backUrl = (backUrl == null||("".equals(backUrl))) ? "/admin/dashborad" : backUrl;
			return "redirect:/" + backUrl;
		} else {
			return "redirect:/admin/sessions/new?errorMessage=show";
		}
	}
}
