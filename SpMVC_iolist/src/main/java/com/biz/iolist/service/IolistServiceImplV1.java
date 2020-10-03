package com.biz.iolist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.iolist.mapper.IolistDao;
import com.biz.iolist.model.IolistVO;

@Service
public class IolistServiceImplV1 implements IolistService{

	@Autowired
	private IolistDao iolistDao;
	
	@Override
	public List<IolistVO> selectAll() {
		// TODO Auto-generated method stub
		return iolistDao.selectAll();
	}

	@Override
	public IolistVO findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(IolistVO iolistVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(IolistVO iolistVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
