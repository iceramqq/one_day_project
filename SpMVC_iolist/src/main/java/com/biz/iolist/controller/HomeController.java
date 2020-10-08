package com.biz.iolist.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.iolist.model.IolistVO;
import com.biz.iolist.service.IolistService;

@Controller
public class HomeController {
	
	@Autowired
	private IolistService iolistService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		List<IolistVO> iolist_list = iolistService.selectAll();
		int in_sum = 0;
		int out_sum = 0;
		for (IolistVO iolistVO : iolist_list) {
			if(iolistVO.getIo_input()==1) {
				in_sum += iolistVO.getIo_total();
			} else {
				out_sum += iolistVO.getIo_total();
			}
			
		}
		
		model.addAttribute("ios",iolist_list);
		model.addAttribute("in_total", in_sum);
		model.addAttribute("out_total", out_sum);
		return "home";
	}
	
}
