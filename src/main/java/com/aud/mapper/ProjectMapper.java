package com.aud.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aud.pojo.Project;

public interface ProjectMapper {
	List<Project> all(String lang);

    int deleteByPrimaryKey(Integer id);
    
    int deleteByNavMenuId(int id);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKeyWithBLOBs(Project record);

    int updateByPrimaryKey(Project record);
    
    List<Project> getByNavMenuId(int nav_menu_id, String lang);

    int getMaxId();
}