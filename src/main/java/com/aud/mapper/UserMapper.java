package com.aud.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
}