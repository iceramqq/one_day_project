package com.biz.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String list() {

//		List<BbsVO> bbsList = bbsService.selectAll();
//		model.addAttribute("hlist", bbsList);
		return "/bbs/bbs-list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/bbs/bbs-write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BbsVO BbsVO) {

		// bbsService.insert(BbsVO);
		return "redirect:/bbs/bbs-list";

	}
/*
	@RequestMapping(value = "/detail/{seq}", method = RequestMethod.GET)
	public String detail(@PathVariable("seq") String seq, Model model) {

		long long_seq = Long.valueOf(seq);
		BbsVO BbsVO = bbsService.findBySeq(long_seq);

		model.addAttribute("BbsVO", BbsVO);
		return "/bbs/bbs-detail";
	}

	@RequestMapping(value = "/delete/{seq}", method = RequestMethod.GET)
	public String update(@PathVariable("seq") String seq) {

		long long_seq = Long.valueOf(seq);
		bbsService.delete(long_seq);

		return "redirect:/bbs/bbs-list";
	}

	@RequestMapping(value = "/update/{seq}", method = RequestMethod.GET)
	public String update(@PathVariable("seq") String seq, Model model) {
		long long_seq = Long.valueOf(seq);
		model.addAttribute("BbsVO", bbsService.findBySeq(long_seq));
		return "/bbs/bbs-write";
	}

	@RequestMapping(value = "/update/{seq}", method = RequestMethod.POST)
	public String update(BbsVO BbsVO, @RequestParam("file") MultipartFile file) {

		bbsService.update(BbsVO);
		return "redirect:/bbs/bbs-list";

	}
	*/
}
