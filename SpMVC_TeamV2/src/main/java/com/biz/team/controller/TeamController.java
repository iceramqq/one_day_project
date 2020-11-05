package com.biz.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.biz.team.model.TeamVO;
import com.biz.team.model.UserVO;
import com.biz.team.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/team")
public class TeamController {

	@Autowired
	@Qualifier("teamServiceV1")
	private TeamService teamService;

	@RequestMapping(value = "/list/{category}", method = RequestMethod.GET)
	public String list(@PathVariable("category") String category, Model model) {

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

//	@RequestMapping(value = "/write", method = RequestMethod.GET)
//	public String write() {
//		return "/team/write";
//	}
//
//	@RequestMapping(value = "/write", method = RequestMethod.POST)
//	public String write(TeamVO teamVO, MultipartFile file) {
//
//		teamService.insert(teamVO, file);
//		return "redirect:/team/list/1";
//
//	}

	@RequestMapping(value = "/detail/{seq}", method = RequestMethod.GET)
	public String detail(@PathVariable("seq") String seq, Model model) {

		long long_seq = Long.valueOf(seq);
		TeamVO teamVO = teamService.findBySeq(long_seq);
		model.addAttribute("teamVO", teamVO);
		return "/team/detail";
	}

//	@RequestMapping(value = "/delete/{seq}", method = RequestMethod.GET)
//	public String update(@PathVariable("seq") String seq) {
//
//		long long_seq = Long.valueOf(seq);
//		teamService.delete(long_seq);
//
//		return "redirect:/team/list/1";
//	}
//
//	@RequestMapping(value = "/update/{seq}", method = RequestMethod.GET)
//	public String update(@PathVariable("seq") String seq, Model model) {
//		long long_seq = Long.valueOf(seq);
//		model.addAttribute("teamVO", teamService.findBySeq(long_seq));
//		return "/team/write";
//	}

	@RequestMapping(value = "/update/{seq}", method = RequestMethod.POST)
	public String update(TeamVO teamVO, @RequestParam("file") MultipartFile file) {

		teamService.update(teamVO, file);
		return "redirect:/team/list/1";

	}
}
