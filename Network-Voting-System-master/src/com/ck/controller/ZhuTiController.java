package com.ck.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ck.po.Option;
import com.ck.po.ZhuTi;
import com.ck.po.User;
import com.ck.service.OptionService;
import com.ck.service.ZhuTiService;
import com.ck.service.UserService;
import com.github.pagehelper.PageInfo;

@Service
@RequestMapping("/zhuti")
public class ZhuTiController {

	@Autowired
	private ZhuTiService zhuTiService;
	@Autowired
	private OptionService optionService;
	@Autowired
	private UserService userService;

	@PostMapping("/add")
	@ResponseBody
	public Integer add(@RequestBody ZhuTi zhuTi) throws Exception {
	
		zhuTiService.add(zhuTi);
		
		return 1;
	}

	@GetMapping("/delete/{id}")
	@ResponseBody
	public Integer delete(HttpSession session,@PathVariable Integer id) {
		ZhuTi zhuTi=new ZhuTi();
		zhuTi.setId(id);
		
		Integer ok = zhuTiService.delete(zhuTi);
		if (ok != 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@PostMapping("/change")
	@ResponseBody
	public Integer change(@RequestBody ZhuTi zhuTi) {
		try {
			zhuTiService.change(zhuTi);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	@GetMapping("/check")
	public String checkAll(Model model, String title, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows) {
		ZhuTi zhuTi = new ZhuTi();
		PageInfo<ZhuTi> pageInfo = zhuTiService.check(zhuTi, page, rows);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("title", title);
		return "/poll.jsp";
	}

	@GetMapping("/myPost/{id}")
	public String checkMeAll(Model model, @PathVariable Integer id, String title,
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows) {
		ZhuTi zhuTi = new ZhuTi();
		PageInfo<ZhuTi> pageInfo = zhuTiService.check(zhuTi, page, rows);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("title", title);
		return "/zhuTi.jsp";
	}

}
