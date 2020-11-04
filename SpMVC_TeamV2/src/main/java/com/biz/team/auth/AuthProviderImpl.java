package com.biz.team.auth;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.biz.team.mapper.UserDao;
import com.biz.team.model.UserDetailsVO;

import lombok.extern.slf4j.Slf4j;

/*
 * 
 * spring seucrity의 
 * authentication-manager에서 사용할
 * authentication-provider 클래스 Customizing 수행하기
 * 
 */
@Slf4j
public class AuthProviderImpl implements AuthenticationProvider{

	@Autowired
	private UserDao userDao;
	
	// spring security를 통하여 login을 수행했을때 호출되는 method
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String username = (String) authentication.getPrincipal();
		log.debug(username);
		String password = (String) authentication.getCredentials();
		
		// 로그인 인증하는 부분...
		// 1. USerDetailService에 username을 전달하고 DB부터 사용자정보를
		//		select한 결과를 userVO에 받는다.
		UserDetailsVO userVO = userDao.findBySeq(username);
		
		// 사용자ID 검사
		if( userVO == null ) {
			
			String msg = String.format("[%s] 사용자 ID를 확인하세요", username);
			
			/*
			 * throw new Exception(message)
			 * throw : 강제로 exception을 발생시켜라
			 * 
			 * spring security login이 진행되는 도중에
			 * 어떤 문제가 발생을 하면
			 * 메시지를 만들고 강제로 exception을 발생시키면
			 * spring security에게 메시지를 전달하는 효과가 나타난다.
			 * 
			 * authenticate() method는 실행을 멈추고
			 * 		spring security 가 메시지를 수신하여 다시 login 화면을 열고
			 * 		메시지를 보여준다.
			 */
			throw new InternalAuthenticationServiceException(msg);
			// throw new UsernameNotFoundException(msg);
			
		}
		
		if(!password.equals(userVO.getPassword())) {
			throw new BadCredentialsException("비빌번호가 일치하지 않음");
		}
				
		// ROLE 정보 테스트 값 생성
		// 사용자ID에 부여된 ROLE List를 만들어서 추가하고
		// JSP 등에서 사용해 보자
		List<GrantedAuthority> authList = new ArrayList<>();
		
		if(userVO.isEnabled()) {
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		} else if (!userVO.isEnabled()) {
			authList.add(new SimpleGrantedAuthority("ROLE_USER"));	
		} 
		
		// 로그인만 성공을 하고 ROLE 정보 인가정보들이 모두 false인
		// 사용자 데이터를 생성하고
		// login 성공 메시지를 만들기
		UsernamePasswordAuthenticationToken token 
		= new UsernamePasswordAuthenticationToken(userVO,null,authList);
		
		return token;
	}

	// 현재 만들어진 AuthProviderImpl을 spring seucrity에서 사용가능하도록 설정
	// return값을 true로하여 사용가능한 상태로 전환
	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}

}
