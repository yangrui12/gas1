package com.aud.mapper;

import java.util.List;

import com.aud.pojo.HistoryIntroduce;

public interface HistoryIntroduceMapper {
	List<HistoryIntroduce> all(String lang);

    int deleteByPrimaryKey(Integer id);

    int insert(HistoryIntroduce record);

    int insertSelective(HistoryIntroduce record);

    HistoryIntroduce selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HistoryIntroduce record);

    int updateByPrimaryKey(HistoryIntroduce record);
}