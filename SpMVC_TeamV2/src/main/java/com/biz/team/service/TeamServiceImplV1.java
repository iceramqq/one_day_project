package com.biz.team.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.biz.team.model.TeamVO;

@Service("teamServiceV1")
public class TeamServiceImplV1 implements TeamService{

	@Override
	public List<TeamVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TeamVO findBySeq(long seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(TeamVO teamVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(TeamVO teamVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(long seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
