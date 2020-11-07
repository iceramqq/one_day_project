package com.biz.team.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import com.biz.team.mapper.UserDao;
import com.biz.team.model.UserVO;

@Service
public class UserServiceImplV1 implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public List<UserVO> selectAll() {
		// TODO Auto-generated method stub
		return userDao.selectAll();
	}

	@Override
	public UserVO findById(String username) {
		// TODO Auto-generated method stub		
		return userDao.findById(username);
	}

	@Override
	public int insert(UserVO userVO) {
		// TODO Auto-generated method stub
		
		int nCount = userDao.userCount();
		if (nCount > 0) {
			userVO.setM_role("1");
		} else {
			userVO.setM_role("0");
		}
		
		return userDao.insert(userVO);
	}

	@Override
	public int update(UserVO userVO) {
		// TODO Auto-generated method stub
		return userDao.update(userVO);
	}

	@Override
	public int delete(String username) {
		// TODO Auto-generated method stub
		return userDao.delete(username);
	}

}
