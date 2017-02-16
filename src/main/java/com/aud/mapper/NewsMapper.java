package com.aud.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aud.pojo.News;
public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(News record);
    int insertSelective(News record);
    News selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(News record);
    int updateByPrimaryKeyWithBLOBs(News record);
    int updateByPrimaryKey(News record);
    List<News> selectByNewsCategoryId(int categoryId);
    List<News> all(String lang);
    int deleteByNavMenuId(int id);
}
