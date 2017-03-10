package com.aud.mapper;

import java.util.List;

import com.aud.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectByUser(User user);
    
    List<User> all();

	List<User> getByUserName(String userName);

	List<User> selectBySelective(User user);
}