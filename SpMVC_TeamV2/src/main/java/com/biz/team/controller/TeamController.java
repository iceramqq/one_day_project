package com.biz.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.team.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/team")
public class TeamController {

	@Autowired
	@Qualifier("teamServiceV1")
	private TeamService teamService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String list() {
		return "/team/list";
	}
}
