package com.biz.team.service;

import java.util.List;

import com.biz.team.model.UserVO;

public interface UserService {

	public List<UserVO> selectAll();
	public UserVO findById(String username);
	public int insert(UserVO userVO);
	public int update(UserVO userVO);
	public int delete(String username);
}
