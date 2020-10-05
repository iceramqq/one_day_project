package com.biz.iolist.service;

import java.util.List;

import com.biz.iolist.model.IolistVO;

public interface IolistService {

	public List<IolistVO> selectAll();
	public IolistVO findById(long id);
	public int insert(IolistVO iolistVO);
	public int update(IolistVO iolistVO);
	public int delete(long id);
}
