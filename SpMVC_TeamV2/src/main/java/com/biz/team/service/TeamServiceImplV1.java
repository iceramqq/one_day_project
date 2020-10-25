package com.biz.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.biz.team.mapper.TeamDao;
import com.biz.team.model.TeamVO;

@Service("teamServiceV1")
public class TeamServiceImplV1 implements TeamService {

	@Autowired
	private TeamDao teamDao;

	@Autowired
	@Qualifier("fileServiceV1")
	private FileService fileService;

	@Override
	public List<TeamVO> selectAll(String category) {
		// TODO Auto-generated method stub
		return teamDao.selectAll(category);
	}

	@Override
	public TeamVO findBySeq(long seq) {
		// TODO Auto-generated method stub
		return teamDao.findBySeq(seq);
	}

	@Override
	public void insert(TeamVO teamVO, MultipartFile file) {

		String fileName = fileService.fileUp(file);
		teamVO.setH_file(fileName);
		teamDao.insert(teamVO);
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
