package com.aud.mapper;

import java.util.List;

import com.aud.pojo.TeamMember;

public interface TeamMemberMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeamMember record);

    int insertSelective(TeamMember record);

    TeamMember selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TeamMember record);

    int updateByPrimaryKeyWithBLOBs(TeamMember record);

    int updateByPrimaryKey(TeamMember record);
    
    List<TeamMember> getTeamMemberByTeamId(int teamId, String lang);
    
    List<TeamMember> all(String lang); 
    
    int deleteByNavMenuId(int id);
    
    int getMaxId(); 

}