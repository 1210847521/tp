package com.ck.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ck.po.Option;
import com.ck.po.Play;
import com.ck.po.Post;
import com.ck.po.User;
import com.ck.po.ZhuTi;
import com.ck.po.page;
import com.ck.service.OptionService;
import com.ck.service.PlayPictureService;
import com.ck.service.PostService;
import com.ck.service.UserService;
import com.ck.service.ZhuTiService;
import com.github.pagehelper.Page;

@Controller
public class Meager {
	@Autowired
	private ZhuTiService zhuTiService;
	@Autowired
	private PlayPictureService pictureService;
	@Autowired
	private PostService postService;
	
	@Autowired
	private OptionService optionService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "meager/type", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView type() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/meager/type/type.jsp");

		List<ZhuTi> list = zhuTiService.listAll();
		System.out.println();

		mv.addObject("type", list);
		return mv;
	}

	@RequestMapping(value = "meager/adv", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView showAdv() {
		ModelAndView mv = new ModelAndView("/meager/advertisement/advertisement.jsp");
		List<Play> picPlays = pictureService.serchByType(1);
		mv.addObject("pic", picPlays);
		return mv;
	}

	@RequestMapping(value = "meager/sdv", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView MAdv() {
		ModelAndView mv = new ModelAndView("/meager/advertisement/adv.jsp");

		List<Play> picPlays = pictureService.serchAllPlc();
		mv.addObject("pic", picPlays);
		return mv;
	}

	@RequestMapping(value = "upPlcSrc", method = RequestMethod.POST)
	public void upPlcSrc(HttpServletRequest request, HttpServletResponse response, Play play) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			Integer i = pictureService.upPlcSrc(play);
			if (i > 0) {
				out.print(1);
			} else {
				out.print(0);
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "upPlc", method = RequestMethod.POST)
	public ModelAndView upPlc(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "myfiles") MultipartFile[] myfiles, Play play) {
		ModelAndView mv = new ModelAndView("redirect:/meager/sdv");

		Play p = upPic(myfiles, request, response);
		String filedir = request.getSession().getServletContext().getRealPath("/") + "//images/dress";
		if (p.getPicture() != null) {
			boolean f = deleteFile(filedir + "/" + play.getPicture());

			play.setPicture(p.getPicture());
			pictureService.upPlcById(play);
		}
		return mv;
	}

	private Play upPic(MultipartFile[] myfiles, HttpServletRequest request, HttpServletResponse response) {
		Play pic = new Play();
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String uploadPath = request.getSession().getServletContext().getRealPath("/") + "//images/lp";
			System.out.println("------------");
			MultipartFile myfile = myfiles[0];
			if (!myfile.isEmpty()) {
				String oldName = myfile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				String newName = uuid.toString() + oldName.substring(oldName.lastIndexOf("."));
				myfile.transferTo(new File(uploadPath, newName));
				pic.setPicture(newName);
			} else {
				pic.setPicture(null);
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pic;
	}

	private boolean deleteFile(String fileName) {
		File file = new File(fileName);
		if (file.isFile() && file.exists()) {
			file.delete();// "鍒犻櫎鍗曚釜鏂囦欢"+name+"鎴愬姛锛�
			return true;
		} // "鍒犻櫎鍗曚釜鏂囦欢"+name+"澶辫触锛�
		return false;
	}

	@RequestMapping(value = "meager/pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView pro(page page) {
		ModelAndView mv = new ModelAndView("/meager/products.jsp");

		int con = postService.getCountAll();
		System.out.println(con + "*****************************");
		int pg = 1;
		int num = 10;
		int end = con % num == 0 ? con / num : con / num + 1;
		System.out.println(end + "end");
		System.out.println(page);
		if (page.getPage() >= 1) {
			pg = page.getPage();

		}
		if (page.getPage() > end) {
			pg = end;
		}
		page.setCon(con);
		page.setNum(num);
		System.out.println(pg + "pg+++");
		int begin = (pg - 1) * num;
		System.out.println(begin + "#####");
		System.out.println(begin + "+++");
		page.setPage(pg);
		page.setStart(begin);
		page.setEnd(end);
		List<Post> list = postService.searchByPageAll(page);
		System.out.println(list.size() + "---------------");
		mv.addObject("posts", list);
		mv.addObject("page", page);
		return mv;
	}

	@RequestMapping(value="/updateProduct",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView update(Post p,Integer page)
	{
		ModelAndView mv=new ModelAndView("/meager/updateProduct.jsp");
		Post post = postService.checkById(p.getId());
		List<Option> option = optionService.checkByPostId(p.getId());
		post.setOption(option);
		mv.addObject("p", post);
		mv.addObject("page",page);
		/*System.out.println(page+"**************************");
		Post product=postService.checkById(p.getId());
		mv.addObject("p",product);
		mv.addObject("page",page);*/
		return mv;
	}
	
	@RequestMapping(value="/findOptionById",method={RequestMethod.GET,RequestMethod.POST})
	public List<Option> findOptionById(Post p)
	{
		List<Option> list=optionService.checkByPostId(p.getId());
		return list;
	}
	
	 @RequestMapping(value="uptype")
	   public void upType(ZhuTi zt,HttpServletRequest request,HttpServletResponse response){
		 try {
			  request.setCharacterEncoding("utf-8");
		      response.setContentType("text/html;charset=utf-8");
		      PrintWriter out=response.getWriter();
			  int i=zhuTiService.change(zt);
			  if(i>0){
				  out.print(1);  
			  }else{
				  out.print(0);
			  }
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }
	 
	 @RequestMapping(value="delZT")
	   public ModelAndView delZT(ZhuTi zt){
		 ModelAndView mv=new ModelAndView();
		 zhuTiService.delete(zt);
		 List<ZhuTi> list=zhuTiService.listAll();
			mv.addObject("type", list);
		 mv.setViewName("/meager/type/type.jsp");
		 return mv;
	   }
	
	 @RequestMapping(value="delPost",method=RequestMethod.POST)
		public void delPost(Post post,HttpServletRequest request,HttpServletResponse response,HttpSession session){
			try {
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out=response.getWriter();
				post.setPostState(3);
				post.setDeluid((Integer) session.getAttribute("id"));
				post.setDeltime(new Date());
				int i=postService.delete(post);
				if(i>0){
					out.print(1);
				}else{
					out.print(0);
				}	
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 } 
	 
	 @RequestMapping(value="meager/userOk",method={RequestMethod.GET,RequestMethod.POST})
		public ModelAndView userOk(page page){
			int con=userService.getCountAll();
			System.out.println(con+"*****************************");
			int pg=1;
			int num=1;
			int end=con % num == 0 ? con/ num : con / num + 1;
			System.out.println(end+"end");
			System.out.println(page);
			if(page.getPage()>=1)
			{
		     pg=page.getPage();	  
			
			}if(page.getPage()>end)
			{
				pg=end;
			}	
		    page.setCon(con);
			page.setNum(num);
			System.out.println(pg+"pg+++");
			int begin=(pg-1)*num;
			System.out.println(begin+"#####");
			System.out.println(begin+"+++");
			page.setPage(pg);
			page.setStart(begin);
			page.setEnd(end);
			ModelAndView mv=new ModelAndView("/meager/user/userOk.jsp");
			List<User>list=userService.serchUserAll(page);
			mv.addObject("users",list);
			mv.addObject("page",page);
			return mv;
		}
	 
	 @RequestMapping(value="meager/userApply",method={RequestMethod.GET,RequestMethod.POST})
		public ModelAndView userApply(page page){
			int con=userService.getcountFabu();
			System.out.println(con+"*****************************");
			int pg=1;
			int num=1;
			int end=con % num == 0 ? con/ num : con / num + 1;
			System.out.println(end+"end");
			System.out.println(page);
			if(page.getPage()>=1)
			{
		     pg=page.getPage();	  
			
			}if(page.getPage()>end)
			{
				pg=end;
			}	
		    page.setCon(con);
			page.setNum(num);
			System.out.println(pg+"pg+++");
			int begin=(pg-1)*num;
			System.out.println(begin+"#####");
			System.out.println(begin+"+++");
			page.setPage(pg);
			page.setStart(begin);
			page.setEnd(end);
			ModelAndView mv=new ModelAndView("/meager/user/userApply.jsp");
			List<User>list=userService.serchByFabu(page);
			mv.addObject("users",list);
			mv.addObject("page",page);
			return mv;
		}
	 
	 @RequestMapping(value="delUser",method=RequestMethod.POST)
		public void delUser(Integer id,HttpServletRequest request,
				HttpServletResponse response){
			try {
				PrintWriter out=response.getWriter();
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				Integer i=userService.delUser(id);
				if(i>0)
				{
					out.print("1");
				}else{
					out.print("0");
				}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
	 @RequestMapping(value="editFabu",method=RequestMethod.POST)
		public void editFabu(Integer id,HttpServletRequest request,
				HttpServletResponse response){
			try {
				PrintWriter out=response.getWriter();
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				Integer i=userService.delUser(id);
				if(i>0)
				{
					out.print("1");
				}else{
					out.print("0");
				}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
	 
}
