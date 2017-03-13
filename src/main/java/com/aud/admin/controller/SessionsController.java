package com.aud.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aud.mapper.RoleMapper;
import com.aud.mapper.UserMapper;
import com.aud.pojo.User;
import com.aud.tool.CryptographyUtil;

@Controller
@RequestMapping("/admin/sessions")
public class SessionsController {
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String login(User user, HttpServletRequest request, String backUrl, RedirectAttributes redirectAttributes) {
		Subject subject = SecurityUtils.getSubject();
		user.setPassword(CryptographyUtil.md5(user.getPassword(), "aud"));
		UsernamePasswordToken token = new UsernamePasswordToken(user.getName(), user.getPassword());
		try {
			subject.login(token);
			Session session = subject.getSession();
			user = this.userMapper.getByUserName(user.getName()).get(0);
			session.setAttribute("userId", user.getId());
			session.setAttribute("name", user.getName());
			session.setAttribute("roles", user.getRoles());
			backUrl = (backUrl == null || ("".equals(backUrl))) ? "/admin/dashborad" : "/" + backUrl;
			return "redirect:" + backUrl;
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "账号密码错误");
			return "redirect:/admin/sessions/new";
		}
	}
	@Autowired
	private RoleMapper roleMapper;
	@RequestMapping(value = { "/new", "", "/" }, method = RequestMethod.GET)
	public String newPage(ModelMap model) {
		User user = new User();
		model.addAttribute("users", this.userMapper.selectBySelective(user));
		model.addAttribute("roles", this.roleMapper.all());
		return "admin/sessions/new";
	}

	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String logOut() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/admin/sessions/new";
	}
}