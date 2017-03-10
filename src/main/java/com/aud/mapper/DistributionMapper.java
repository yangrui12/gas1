package com.aud.mapper;

import java.util.List;

import com.aud.pojo.Distribution;
import com.aud.pojo.User;

public interface DistributionMapper {

	List<Distribution> all();
	
	List<Distribution> selectBySelective(Distribution distribution);

	Distribution selectByPrimaryKey(Integer id);

	int deleteByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Distribution distribution);

	int insertSelective(Distribution distribution);


	
     
}
