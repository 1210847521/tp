package com.ck.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ck.po.Play;
import com.ck.po.User;
import com.ck.po.ZhuTi;
import com.ck.service.PlayPictureService;
import com.ck.service.UserService;
import com.ck.service.ZhuTiService;

@Controller
public class RedirectController {
	   @Autowired 
	    private PlayPictureService pictureService;
	   
	   @Autowired 
	    private ZhuTiService zhutiService;
	   
	   @Autowired 
	    private UserService userService;

	@GetMapping("/")
	public ModelAndView user(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Integer id = (Integer) session.getAttribute("id");
		Integer isadmin = (Integer) session.getAttribute("isadmin");
		User userQuery=new User();
		userQuery.setId(id);
		
		List<Play>picPlays=pictureService.serchByType(1);
		List<ZhuTi>zhitis=zhutiService.listAll();
		if (id != null) {
			User user = userService.login(userQuery);
			if(isadmin!=null){
				if (isadmin == 1) {
					mv.setViewName("meager/meager.jsp");
//					return "/admin.jsp";
				} else {
					mv.addObject("pics",picPlays);
					mv.addObject("zhuti",zhitis);
					mv.addObject("user",user);
					mv.setViewName("mani.jsp");
//					return "/main.jsp";
				}
			}else{
				mv.addObject("pics",picPlays);
				mv.addObject("zhuti",zhitis);
				mv.addObject("user",user);
				mv.setViewName("mani.jsp");
//				return "/main.jsp";
			}
			
		} else {
			mv.setViewName("userMeager.jsp");
//			return "/login.jsp";
		}
		return mv;
	}

	@GetMapping("/user/register")
	public String register() {
		return "/register.jsp";
	}

	@GetMapping("/user/login")
	public String login() {
		return "/login.jsp";
	}

	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/login.jsp";
	}

	@GetMapping("/post/newPost")
	public String newPost() {
		return "/new_post.jsp";
	}
}
