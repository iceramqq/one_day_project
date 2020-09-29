package com.biz.iolist.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.iolist.mapper.IolistDao;
import com.biz.iolist.model.IolistVO;

@Service
public class IoilstServiceImplV1 implements IolistService{

	@Autowired
	private IolistDao iolistDao;
	
	@Override
	public List<IolistVO> selectAll() {
		// TODO Auto-generated method stub
		return iolistDao.selectAll();
	}

	@Override
	public IolistVO findByID(long seq) {
		
		return iolistDao.findById(seq);
	}

	@Override
	public int insert(IolistVO iolistVO) {
		LocalDate localDate = LocalDate.now();
		LocalTime localTime = LocalTime.now();
		
		DateTimeFormatter dt = DateTimeFormatter.ofPattern("HH:mm:ss");
		DateTimeFormatter dd = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		
		iolistVO.setIo_date(localDate.format(dd).toString());
		iolistVO.setIo_time(localTime.format(dt).toString());

		int ret = iolistDao.insert(iolistVO);
		return ret;
	}

	@Override
	public int update(IolistVO iolistVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(long seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
