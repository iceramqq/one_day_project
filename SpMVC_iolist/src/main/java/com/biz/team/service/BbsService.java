package com.biz.team.service;

import java.util.List;

import com.biz.team.model.BbsVO;

public interface BbsService {


	
	public List<BbsVO> selectAll();
	public BbsVO findBySeq(long seq);
	public int insert(BbsVO bbsVO);
	public int update(BbsVO bbsVO);
	public int delete(long seq);
	
}
