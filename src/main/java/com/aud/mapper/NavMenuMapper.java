package com.aud.mapper;

import java.util.List;

import com.aud.pojo.NavMenu;

public interface NavMenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(NavMenu record);

    int insertSelective(NavMenu record);

    NavMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NavMenu record);

    int updateByPrimaryKey(NavMenu record);
    
    List<NavMenu> allNavMenuByParentNav(int parentNav, String lang);
    
    List<NavMenu> all();
}