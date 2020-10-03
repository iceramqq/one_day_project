package com.biz.iolist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.iolist.mapper.IolistDao;
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
		model.addAttribute("iolist-list",iolist_list);
		log.debug(iolist_list.toString());
		return "home";
	}
}
