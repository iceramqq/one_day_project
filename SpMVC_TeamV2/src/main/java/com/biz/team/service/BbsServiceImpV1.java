package com.biz.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.team.mapper.BbsDao;
import com.biz.team.model.BbsVO;

@Service
public class BbsServiceImpV1 implements BbsService{

	@Autowired
	private BbsDao bbsDao;
	
	@Override
	public List<BbsVO> selectAll() {
		// TODO Auto-generated method stub
		return bbsDao.selectAll();
	}

	@Override
	public BbsVO findBySeq(long seq) {
		// TODO Auto-generated method stub
		return bbsDao.findBySeq(seq);
	}

	@Override
	public int insert(BbsVO bbsVO) {
		// TODO Auto-generated method stub
		return bbsDao.insert(bbsVO);
	}

	@Override
	public int update(BbsVO bbsVO) {
		
		return bbsDao.update(bbsVO);
		
	}

	@Override
	public int delete(long seq) {
		
		return bbsDao.delete(seq);
	}

}
