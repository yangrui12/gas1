package com.aud.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aud.pojo.Banner;

public interface BannerMapper {

	List<Banner> all(String lang);
	
	int deleteByPrimaryKey(Integer id);
	
	int insert(Banner record);
	
	int insertSelective(Banner record);
	
	Banner selectByPrimaryKey(Integer id);
	
	int updateByPrimaryKeySelective(Banner record);
	
	int updateByPrimaryKey(Banner record);
}