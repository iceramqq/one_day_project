package com.biz.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.team.model.UserVO;
import com.biz.team.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

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
	public String mypage(Authentication authProvider, Model model) {

		UserVO userVO = (UserVO) authProvider.getPrincipal();
		model.addAttribute("userVO", userVO);
		return "/user/mypage";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public String mypage(UserVO userVO) {

		userService.update(userVO);
		return "redirect:/team/list/1";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {

		List<UserVO> userList = userService.selectAll();
		model.addAttribute("userList", userList);
		return "/user/user-list";
	}

	@ResponseBody
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
