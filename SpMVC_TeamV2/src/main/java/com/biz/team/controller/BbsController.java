package com.biz.team.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.team.model.BbsVO;
import com.biz.team.service.BbsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/bbs")
public class BbsController {

	@Autowired
	private BbsService bbsService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {

		List<BbsVO> bbsList = bbsService.selectAll();
		model.addAttribute("bbsList", bbsList);
		return "/bbs/bbs-list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Model model) {
		LocalDateTime ldt = LocalDateTime.now();
		String cd = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(ldt);
		String ct = DateTimeFormatter.ofPattern("HH:mm:ss").format(ldt);
		
		BbsVO bbsVO = BbsVO.builder()
				.b_date(cd)
				.b_time(ct)
				.build();
		model.addAttribute("BbsVO",bbsVO);
		return "/bbs/bbs-write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BbsVO BbsVO) {

		bbsService.insert(BbsVO);
		return "redirect:/bbs/list";

	}

	@RequestMapping(value = "/detail/{seq}", method = RequestMethod.GET)
	public String detail(@PathVariable("seq") String seq, Model model) {

		long long_seq = Long.valueOf(seq);
		BbsVO bbsVO = bbsService.findBySeq(long_seq);

		model.addAttribute("BbsVO", bbsVO);
		return "/bbs/bbs-detail";
	}

	@RequestMapping(value = "/delete/{seq}", method = RequestMethod.GET)
	public String update(@PathVariable("seq") String seq) {

		Long long_seq = Long.valueOf(seq);
		bbsService.delete(long_seq);

		return "redirect:/bbs/list";
	}

	@RequestMapping(value = "/update/{seq}", method = RequestMethod.GET)
	public String update(@PathVariable("seq") String seq, BbsVO bbsVO, Model model) {
		Long long_seq = Long.valueOf(seq);
		bbsVO = bbsService.findBySeq(long_seq);
		model.addAttribute("BbsVO", bbsVO);
		return "/bbs/bbs-write";
	}

	@RequestMapping(value = "/update/{seq}", method = RequestMethod.POST)
	public String update(BbsVO bbsVO) {
		bbsService.update(bbsVO);
		return "redirect:/bbs/list";

	}

}
