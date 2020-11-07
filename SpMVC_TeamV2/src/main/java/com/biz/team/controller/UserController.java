package com.biz.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.team.mapper.UserDao;
import com.biz.team.model.UserVO;
import com.biz.team.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/user/login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		return "/user/logout";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		
		return "/user/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO userVO) {
		
		userService.insert(userVO);
		return "redirect:/team/list/1";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "/user/mypage";
	}

	@RequestMapping(value = "/password_check", method = RequestMethod.POST)
	public String password_check(String username, String password) {
		UserVO userVO = userService.findById(username);

		if (userVO.getPassword() == password) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/id_check", method = RequestMethod.POST)
	public String id_check(String username) {

		UserVO userVO = userService.findById(username);
		if (userVO == null) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
