package com.aud.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aud.mapper.UserMapper;
import com.aud.pojo.User;
import com.aud.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> all() {
		return null;
	}

	@Override
	public List<User> getByUserName(String userName) {
		return this.userMapper.getByUserName(userName);
	}

	@Override
	public Set<String> getRoles(String userName) {
		Set<String> roles = new HashSet<>();
		if (this.getByUserName(userName).get(0).getRoleId() != null) {
			roles.add("admin");
		}
		return roles;
	}

}