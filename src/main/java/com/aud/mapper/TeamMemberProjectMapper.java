package com.aud.mapper;

import java.util.List;

import com.aud.pojo.TeamMemberProject;

public interface TeamMemberProjectMapper {
    int deleteByPrimaryKey(Integer id);
    
    int deletedByTeamMemberId(int teamMemberId);

    int insert(TeamMemberProject record);

    int insertSelective(TeamMemberProject record);

    TeamMemberProject selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TeamMemberProject record);

    int updateByPrimaryKey(TeamMemberProject record);
    
    List<TeamMemberProject> selectByTeamMemberId(int teamMemBerId);
    
    List<TeamMemberProject> selectByProjectId(int projectId);
}