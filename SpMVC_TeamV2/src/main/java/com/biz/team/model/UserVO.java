package com.biz.team.model;

import java.util.Collection;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("UserDetail")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserVO implements UserDetails {

	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	private String m_role;
	
	private boolean enabled;
	private boolean accountNonExpired;
	private boolean accountNonLocked;
	private boolean credentialsNonExpired;

	// List<GrandtedAuthriy>
	private Collection<? extends GrantedAuthority> authorities;
	
	
}
