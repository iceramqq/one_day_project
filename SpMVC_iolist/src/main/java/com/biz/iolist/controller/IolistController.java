package com.biz.iolist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.iolist.mapper.IolistDao;
import com.biz.iolist.model.IolistVO;

@Controller
public class IolistController {

	@Autowired
	private IolistDao iolistDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model) {

		List<IolistVO> Iolist_list = iolistDao.selectAll();
		model.addAttribute("iolists", Iolist_list);
		return "home";
	}
}
