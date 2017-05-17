package com.aud.mapper;

import java.util.List;

import com.aud.pojo.Dashborad;
import com.aud.pojo.Distribution;

public interface DashboradMapper {

	List<Dashborad> selectBySelective(Dashborad dashborad);

	int insertSelective(Dashborad dashborad);

	int deleteByPrimaryKey(Integer id);

	Dashborad selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Dashborad dashborad);
    
}
