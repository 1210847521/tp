package com.ck.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ck.po.Result;
import com.ck.po.User;
import com.ck.service.UserService;
import com.ck.util.FileUpDownLoad;
import com.ck.util.UserCSVUtils;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@PostMapping("/register")
	@ResponseBody
	public Integer register(@RequestBody User user) {
		return userService.add(user);
	}

	@PostMapping("/login")
	@ResponseBody
	public Result login(HttpSession session, @RequestBody User userQuery) {
		Result result = new Result();
		if("".equals(String.valueOf(userQuery.getCertCode()))|| userQuery.getCertCode()==null){
			result.setSuccess(false);
			result.setMsg("请输入验证码!");
			return result;
		}
		if(!session.getAttribute("certCode").equals(userQuery.getCertCode())){
			result.setSuccess(false);
			result.setMsg("验证码错误!");
			return result;
		}
		User user = userService.login(userQuery);
		System.out.println();
		if (user != null) {
			 userQuery.setId(user.getId());
			//user.getLocknum()这里是判断错误次数 可以修改
			if (user.getIsLock() == 1) { 
				long nd = 1000 * 24 * 60 * 60;
				long nh = 1000 * 60 * 60;
				long nm = 1000 * 60;
				 Date date=user.getLocktime();
				 long diff = new Date().getTime() - date.getTime();
				 long min = diff % nd % nh / nm;
				if( min<= 5){//min这里是判断锁定时间距现在时间多久  单位分钟
					result.setSuccess(false);
					result.setMsg("账号已锁定，请稍后再试!");
					return result;
				}else{
					 userService.updateToSuccess(userQuery);
					 user = userService.login(userQuery);
					 if (user.getPwd().equals(userQuery.getPwd())) {
							// 登录成功
							session.setAttribute("id", user.getId());
							session.setAttribute("isadmin", user.getIsadmin());
							session.setAttribute("name", user.getNickName());
							session.setAttribute("user", user);
							System.out.println(session);
							 userService.updateToSuccess(userQuery);
							 result.setSuccess(true);
							 result.setMsg("登录成功！");
							 result.setData(user);
							return result;
						}else{
							 userQuery.setLocknum(user.getLocknum()+1);
							 if(user.getLocknum()+1==5){
								 userQuery.setIsLock(1);
								 userQuery.setLocktime(new Date());
							 }
							 userService.updateToFalse(userQuery);
							 result.setSuccess(false);
							result.setMsg("密码错误!");
							return result;
						}
				}
			}else {
				if (user.getPwd().equals(userQuery.getPwd())) {
					// 登录成功
					session.setAttribute("id", user.getId());
					session.setAttribute("name", user.getNickName());
					session.setAttribute("isadmin", user.getIsadmin());
					System.out.println(session);
					 userService.updateToSuccess(userQuery);
					 result.setSuccess(true);
					 result.setMsg("登录成功！");
					 result.setData(user);
					return result;
				}else{
					
					 userQuery.setLocknum(user.getLocknum()+1);
					 if(user.getLocknum()+1==5){
						 userQuery.setIsLock(1);
						 userQuery.setLocktime(new Date());
					 }
					 userService.updateToFalse(userQuery);
					 result.setSuccess(false);
					result.setMsg("密码错误!");
					return result;
				}
			}
		}else{
			result.setSuccess(false);
			result.setMsg("账号错误!");
			return result;
		}
		
	}

	@GetMapping("/myInfo/{id}")
	public String my(Model model, @PathVariable Integer id) {
		User user = userService.checkById(id);
		model.addAttribute("user", user);
		return "/my_info.jsp";
	}

	@PostMapping("/changePwd")
	@ResponseBody
	public Integer changePwd(@RequestBody User user) {
		// newPwd临时占用name字段
		String newPwd = user.getName();
		user.setName(null);
		return userService.changePwd(newPwd, user);
	}

	@PostMapping("/change")
	@ResponseBody
	public Integer change(@RequestBody User user) {
		return userService.change(user);
	}

	@GetMapping("/userInfo")
	public String checkAll(Model model, User user, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer rows) {
		PageInfo<User> pageInfo = userService.check(user, page, rows);
		model.addAttribute("pageInfo", pageInfo);
		return "/user_info.jsp";
	}

	@PostMapping("/upload")
	public String uploadExcel(@RequestParam("file") MultipartFile file) {
		String name = FileUpDownLoad.upload("D:/file/", file);
		if (name == null) {
			return "redirect:userInfo";
		} else {
			List<User> list = UserCSVUtils.read("D:/file/" + name);
			Integer count = 0;// 总数
			Integer ok = 0;// 成功个数
			for (User user : list) {
				count++;
				ok += userService.add(user);
			}
			System.out.println("总共" + count + "成功" + ok);
			return "redirect:userInfo";
		}
	}

	@GetMapping("/download")
	public ResponseEntity<byte[]> downloadExcel(HttpServletRequest request) {
		List<User> list = userService.download();
		String path = "D:/file/" + UUID.randomUUID() + ".csv";
		boolean ok = UserCSVUtils.write(path, list);
		if (ok) {
			ResponseEntity<byte[]> file = FileUpDownLoad.download(request, path);
			if (file == null) {
				return null;
			} else {
				return file;
			}
		} else {
			return null;
		}
	}
	
	//根据提示问题找到密码
	@PostMapping("/retrieve")
	@ResponseBody
	public Result retrieve(@RequestBody User userQuery) {
		Result result=new Result();
		User user=userService.login(userQuery);
		if(user==null){
			result.setMsg("账号错误！");
			result.setSuccess(false);
			return result;
		}else{
			if(StringUtil.isNotEmpty(user.getQuestion())){
				if(user.getAnswer().equals(userQuery.getAnswer())){
					result.setMsg("您的密码是："+user.getPwd());
					result.setSuccess(true);
					return result;
				}else{
					result.setMsg("您的答案不正确！");
					result.setSuccess(false);
					return result;
				}
			}else{
				result.setMsg("您还没有设置密码找回问题，请联系管理员！");
				result.setSuccess(false);
				return result;
			}
		}
	}
	
	//获取用户名是否存在
	@PostMapping("/getByName")
	@ResponseBody
	public Result getByName(@RequestBody User userQuery) {
		Result result=new Result();
		User user = userService.login(userQuery);
		if(user==null){
			result.setSuccess(true);
			result.setMsg("用户名可用");
			return result;
		}else{
			result.setSuccess(false);
			result.setMsg("用户名已存在！");
			return result;
		}
	}
	
	//图片上传
	@RequestMapping("/uploadFile")
	@ResponseBody
	public static String uploadFile(MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if(file!=null){
			//获取上传文件的原始名称
			String originalFilename = file.getOriginalFilename();
			String newFileName ="";
			String pic_path="";
			// 上传图片
			if ( originalFilename != null && originalFilename.length() > 0) {
				//获取Tomcat服务器所在的路径
				String tomcat_path = System.getProperty( "user.dir" );
				System.out.println(tomcat_path);
				//获取Tomcat服务器所在路径的最后一个文件目录
				String bin_path = tomcat_path.substring(tomcat_path.lastIndexOf("\\")+1,tomcat_path.length());
				System.out.println(bin_path);
				//若最后一个文件目录为bin目录，则服务器为手动启动
				if(("bin").equals(bin_path)){//手动启动Tomcat时获取路径为：D:\Software\Tomcat-8.5\bin
					//获取保存上传图片的文件路径
					pic_path = tomcat_path.substring(0,System.getProperty( "user.dir" ).lastIndexOf("\\"))+"\\image\\";
						
				}else{//服务中自启动Tomcat时获取路径为：D:\Software\Tomcat-8.5
					pic_path = tomcat_path+"\\image\\";
				}
				File file1 = new File(pic_path);
				if(!file1.exists()){
					file1.mkdirs();
				}
				// 新的图片名称
				newFileName =UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
				System.out.println("上传文件的路径：" + pic_path + newFileName);
				// 新图片
				File newFile = new File(pic_path + newFileName);
				// 将内存中的数据写入磁盘
				file.transferTo(newFile);
			}
			return pic_path + newFileName;
		}else{
			return null;
		}
	}
	
	 //验证码图片中可以出现的字符集，可以根据需要修改
	 private char mapTable[]={
	   'a','b','c','d','e','f',
	   'g','h','i','j','k','l',
	   'm','n','o','p','q','r',
	   's','t','u','v','w','x',
	   'y','z','0','1','2','3',
	   '4','5','6','7','8','9'
	 };
	/* 功能：生成彩色验证码图片
	 参数wedth为生成图片的宽度，参数height为生成图片的高度，参数os为页面的输出流
	*/
	//图片上传
	 public String getCertPic(int width,int height,OutputStream os){
	  if(width<=0)
	   width=60;
	  if(height<=0)
	   height=20;
	  BufferedImage image= new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	  //获取图形上下文
	  Graphics g = image.getGraphics();
	  //设定背景颜色
	  g.setColor(new Color(0xDCDCDC));
	  g.fillRect(0,0,width,height);
	  //画边框
	  g.setColor(Color.black);
	  g.drawRect(0,0,width-1,height-1);
	  //随机产生的验证码
	  String strEnsure = "";
	  //4代表4为验证码，如果要产生更多位的验证码，则加大数值
	  for(int i = 0;i<4;++i){
	   strEnsure += mapTable[(int) (mapTable.length*Math.random())];
	  }
	  //将认证码显示到图像中，如果要生成更多位的验证码，增加drawString语句
	  g.setColor(Color.black);
	  g.setFont(new Font("Atlantic Inline",Font.PLAIN,18));
	  String str = strEnsure.substring(0,1);
	  g.drawString(str,8,17);
	  str = strEnsure.substring(1,2);
	  g.drawString(str, 20, 15);
	  str = strEnsure.substring(2,3);
	  g.drawString(str, 35, 18);
	  str = strEnsure.substring(3,4);
	  g.drawString(str, 45, 15);
	  //随机产生15个干扰点
	  Random rand = new Random();
	  for(int i=0; i<10; i++){
	   int x = rand.nextInt(width);
	   int y = rand.nextInt(height);
	   g.drawOval(x,y,1,1);
	  }
	  //释放图形上下文
	  g.dispose();
	  try{
	   //输出图形到页面
	   ImageIO.write(image, "JPEG", os);
	   os.close();
	  }catch (IOException e){
	   return "";
	  }
	  return strEnsure;
	 }
	
}
