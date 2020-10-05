package com.biz.iolist.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.iolist.mapper.IolistDao;
import com.biz.iolist.model.IolistVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public IolistVO findById(long id) {
		// TODO Auto-generated method stub
		return iolistDao.findById(id);
	}

	@Override
	public int insert(IolistVO iolistVO) {
		
		LocalDate localDate = LocalDate.now();
		LocalTime localTime = LocalTime.now();
				
		DateTimeFormatter dt = DateTimeFormatter.ofPattern("HH:mm:ss");
		DateTimeFormatter dd = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		iolistVO.setIo_date(localDate.format(dd).toString());
		iolistVO.setIo_time(localTime.format(dt).toString());
		iolistVO.setIo_total(iolistVO.getIo_price() * iolistVO.getIo_quan());
		
		int ret = iolistDao.insert(iolistVO);
		return ret;
	}

	@Override
	public int update(IolistVO iolistVO) {
		// TODO Auto-generated method stub
		
		iolistVO.setIo_total(iolistVO.getIo_price()*iolistVO.getIo_quan());
		int ret = iolistDao.update(iolistVO);
		log.debug(iolistVO.toString());
		return ret;
	}

	@Override
	public int delete(long id) {
		// TODO Auto-generated method stub
		int ret = iolistDao.delete(id);
		return ret;
	}

}
