package com.biz.team.service;

import java.util.List;

import com.biz.team.model.TeamVO;

public interface TeamService {
	
	public List<TeamVO> selectAll();
	public TeamVO findBySeq(long seq);
	public int insert(TeamVO teamVO);
	public int update(TeamVO teamVO);
	public int delete(long seq);

}
