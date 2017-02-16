package com.aud.mapper;

import java.util.List;

import com.aud.pojo.Job;

public interface JobMapper {
	List<Job> all(String lang);

    int deleteByPrimaryKey(Integer id);

    int insert(Job record);

    int insertSelective(Job record);

    Job selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
}