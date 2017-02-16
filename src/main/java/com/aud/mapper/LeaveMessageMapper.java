package com.aud.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aud.pojo.LeaveMessage;
import com.aud.pojo.User;

public interface LeaveMessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LeaveMessage record);

    int insertSelective(LeaveMessage record);

    LeaveMessage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LeaveMessage record);

    int updateByPrimaryKey(LeaveMessage record);
    
    List<LeaveMessage> all();
    
    List<User> all(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
}