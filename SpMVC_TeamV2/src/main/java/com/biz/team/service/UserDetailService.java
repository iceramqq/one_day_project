package com.biz.team.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.biz.team.mapper.UserDao;
import com.biz.team.model.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserDetailService implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserVO userVO = userDao.findById(username);
		if (userVO == null) {
			// 강제로 일부러 UsernameNotFoundException을 발생시킨다.
			throw new UsernameNotFoundException(username + " 정보를 찾을 수 없음");
		}
		log.debug("USER:" + userVO.toString());

		/*
		 * 사용자 정보테이블에서 enable 칼럼의 값이 boolean형으로 설정을 하고 최초에 회원가입을 했을때 이 값을 false로 세팅을 하고
		 * email 인증과 같은 절차를 통과했을대 이 값을 true로 만들어서 로그인이 될수 있도록 설정
		 */
		List<GrantedAuthority> authList = new ArrayList<>();

		if (!userVO.getM_role().equals("0")) {
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		} else {
			authList.add(new SimpleGrantedAuthority("ROLE_USER"));
		}
		
		userVO.setAuthorities(authList);
		return userVO;
	}

}
