package com.biz.iolist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.iolist.model.IolistVO;
import com.biz.iolist.service.IolistService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/iolist")
public class IolistController {
	
	@Autowired
	private IolistService iolistService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String list(Model model) {
		
		List<IolistVO> iolist_list = iolistService.selectAll();
		model.addAttribute("ios",iolist_list);
		return "home";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(@ModelAttribute("ioVO") IolistVO iolistVO, Model model) {
		model.addAttribute("BODY", "IO_WRITE");
		return "home";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute IolistVO iolistVO) {

		int ret = iolistService.insert(iolistVO);
		return "redirect:/iolist/";

	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(@RequestParam("id") String id, Model model) {
		
		long seq = Long.valueOf(id);
		IolistVO iolistVO = iolistService.findById(seq);
		model.addAttribute("ioVO",iolistVO);
		model.addAttribute("BODY","IO_DETAIL");
		return "home";
	
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(@RequestParam("id") String id,@ModelAttribute("ioVO") IolistVO iolistVO,Model model) {
		
		long seq = Long.valueOf(id);
		iolistVO = iolistService.findById(seq);
		model.addAttribute("ioVO",iolistVO);
		model.addAttribute("BODY","IO_WRITE");
		
		return "home";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@ModelAttribute IolistVO iolistVO,Model model) {
		
		
		int ret = iolistService.update(iolistVO);
		return "redirect:/iolist/";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(@RequestParam("id") String id) {
		
		long seq = Long.valueOf(id);
		int ret = iolistService.delete(seq);
		return "redirect:/iolist/";
	
	}
}
