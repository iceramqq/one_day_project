package com.biz.team.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.biz.team.model.TeamVO;

public interface TeamService {
	
	public List<TeamVO> selectAll(String category);
	public TeamVO findBySeq(long seq);
	public void insert(TeamVO teamVO,MultipartFile file);
	public int update(TeamVO teamVO,MultipartFile file);
	public int delete(long seq);

}
