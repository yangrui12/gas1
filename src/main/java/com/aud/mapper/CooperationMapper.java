package com.aud.mapper;

import java.util.List;

import com.aud.pojo.Cooperation;

public interface CooperationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cooperation record);

    int insertSelective(Cooperation record);

    Cooperation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cooperation record);

    int updateByPrimaryKey(Cooperation record);
    
    List<Cooperation> all();
}