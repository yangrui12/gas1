package com.aud.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aud.mapper.RoleMapper;
import com.aud.mapper.UserMapper;
import com.aud.pojo.Distribution;
import com.aud.pojo.Project;
import com.aud.pojo.User;
import com.aud.tool.CryptographyUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller("adminUser")
@RequestMapping("/admin/users")
public class UsersController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(ModelMap model, @RequestParam(value = "role_id", required = false) Integer role_id,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize) {
		
		User user = new User();
		model.addAttribute("users", this.userMapper.selectBySelective(user));
		user.setRoleId(role_id);
		model.addAttribute("roles", this.roleMapper.all());

		PageHelper.startPage(pageNo, pageSize);
		List<User> list = this.userMapper.selectBySelective(user);
		PageInfo<User> page = new PageInfo<User>(list);
		
		model.addAttribute("pages", page);
		model.addAttribute("userId", user);
		return "admin/users/index";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newPage() {
		return "admin/users/new";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(User user, ModelMap model) {
		if (this.userMapper.getByUserName(user.getName()).size() > 0) {
			model.addAttribute("errorMessage", "不能插入相同的用戶名");
			model.addAttribute("alert", "alert-warning");
			return "/admin/users/new";
		} else {
			System.out.println("user  " + user);
			user.setPassword(CryptographyUtil.md5(user.getPassword(), "aud"));
			this.userMapper.insertSelective(user);
			System.out.println("user  " + user);
			return "redirect:/admin/users";
		}
	}

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap model) {
		model.addAttribute("user", this.userMapper.selectByPrimaryKey(id));
		System.out.println("id   " + id);
		return "/admin/users/edit";
	}

	@RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
	public String update(@PathVariable("id") int id, User user) {
		if ((!user.getPassword().equals("")) && (user.getPassword() != null)) {
			user.setPassword(CryptographyUtil.md5(user.getPassword(), "aud"));
		}
		this.userMapper.updateByPrimaryKeySelective(user);
		return "redirect:/admin/users";
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		this.userMapper.deleteByPrimaryKey(id);
		return "redirect:/admin/users";
	}
}