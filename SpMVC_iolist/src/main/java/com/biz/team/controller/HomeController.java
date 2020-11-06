package com.biz.team.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.team.model.TeamVO;
import com.biz.team.service.TeamService;


@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("teamServiceV1")
	private TeamService teamService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		String category = "1";
		List<TeamVO> teamList = teamService.selectAll(category);
		String name = null;
		if(category.equals("1")) {
			name = "고궁/성";
		} else if (category.equals("2")) {
			name = "고택/생가";
		} else if (category.equals("3")) {
			name = "유적지/사적지";
		}
		for (TeamVO teamVO : teamList) {
			String str = teamVO.getH_content();
			String content = str.substring(0, 90)+"...";
			teamVO.setH_content(content);
		}
		model.addAttribute("category", name);
		model.addAttribute("hlist", teamList);
		return "/team/list";
	}
	
}
