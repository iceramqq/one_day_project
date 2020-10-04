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
		List<IolistVO> iList = iolistDao.selectAll();
		for (int i = 0; i < iList.size(); i++) {
			IolistVO iolistVO = new IolistVO();
			iolistVO.setSeq(iList.get(i).getSeq());
			iolistVO.setIo_date(iList.get(i).getIo_date());
			iolistVO.setIo_time(iList.get(i).getIo_time());
			iolistVO.setIo_pname(iList.get(i).getIo_pname());
			if(iList.get(i).getIo_input() == '1') {
				iolistVO.setIn_io_price(iList.get(i).getIo_price());
				iolistVO.setIo_quan(iList.get(i).getIo_quan());
				iolistVO.setIn_io_total(iList.get(i).getIo_total());
			} else if(iList.get(i).getIo_input() == '2') {
				iolistVO.setIn_io_price(iList.get(i).getIo_price());
				iolistVO.setIo_quan(iList.get(i).getIo_quan());
				iolistVO.setIn_io_total(iList.get(i).getIo_total());
			}
			iList.add(iolistVO);
		}
		
		
		
		return iList;
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
