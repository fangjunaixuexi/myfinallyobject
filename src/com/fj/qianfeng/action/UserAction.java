package com.fj.qianfeng.action;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fj.qianfeng.model.Vacate;
import com.fj.qianfeng.model.Email;
import com.fj.qianfeng.model.User;
import com.fj.qianfeng.service.inter.IUserService;



@Controller
@RequestMapping(value="/user")
public class UserAction {
	@Autowired
	IUserService ser;
	
	//转到登录页面控制器
	@RequestMapping(value="/tologin" )
	public String tologin() {
		return "login";
	}
	@RequestMapping(value="/login",produces="plain/text;charset=UTF-8")
	@ResponseBody
	public String doLogin(User user,HttpSession session){
		User sessionUser = ser.findByName(user);
		if(sessionUser!=null) {
			if(sessionUser.getPassword().equals(user.getPassword())) {
				session.setAttribute("sessionUser", sessionUser);
				return "1";
			}else {
				return "0";
			}
		}
			return "0";
	
	}
	
	//跳转主页面
	@RequestMapping(value="/toindex")
	public String toindex() {
		return "index";
	}
	
	//跳转个人信息页面
	@RequestMapping(value="/toperson")
	public String toperson() {
		return "person";
	}
	//跳转修改个人信息页面
	@RequestMapping(value="/toupdateperson")
	public String toupdataperson() {
		return "updateperson";
	}
	//修改个人信息之间的操作
	@RequestMapping(value="/updateUser")
	public String updataUser(User user,HttpSession session) {
	    User findSessionUser = (User) session.getAttribute("sessionUser");
	    Integer id = findSessionUser.getId();
	    user.setId(id);
	    ser.modifyById(user);
		
	    User sessionUser = ser.findUser(user);
	    session.setAttribute("sessionUser", sessionUser);
		return "person";
	}
	//跳转个人账户的页面 toPersonAccount
	@RequestMapping(value="/toPersonAccount")
	public String toPersonAccount() {
		return "PersonAccount";
	}
	//跳转修改个人账户的页面toUPPersonAccount
	@RequestMapping(value="/toUPPersonAccount")
	public String toUPPersonAccount() {
		return "UPPersonAccount";
		
	}
	//修改个人账户的操作upDatePerson
	@RequestMapping(value="/upDatePerson")
	public String upDatePerson(User user,HttpSession session) {
	    User findSessionUser = (User) session.getAttribute("sessionUser");
	    Integer id = findSessionUser.getId();
	    user.setId(id);
	    ser.saveById(user);
		
	    User sessionUser = ser.findUser(user);
	    session.setAttribute("sessionUser", sessionUser);
		return "PersonAccount";
	}
	//跳转管理账户页面tomanage
	@RequestMapping(value="/tomanage")
	public String tomanage(HttpSession session) {
		List<User> listusers = ser.selectAll();
		for (User user : listusers) {
			System.out.println(user.getUsername());
		}
		session.setAttribute("ListUser", listusers);
		return "manageAccount";
	}
	//添加用户页面toaddManage
	@RequestMapping(value="/toaddManage")
	public String toaddManage() {
		return "addManage";
	}
	//添加用户的操作addmanage
	@RequestMapping(value="/addmanage")
	public String addmanage(User user) {
		ser.addUser(user);
		return "redirect:tomanage";
	}
	//跳转休假页面toleave
	@RequestMapping(value="/toleave")
	public String toleave(HttpSession session) {
		User user=(User) session.getAttribute("sessionUser");
		String name=user.getUsername();
		Vacate sessionVacate = ser.findAll(name);
		session.setAttribute("sessionVacate", sessionVacate);
		System.out.println(sessionVacate.getName()+""+sessionVacate.getStart_time());
		return "leave";
	}
	//添加请假申请toaddleave
	@RequestMapping(value="/toaddleave")
	public String toaddleave() {
		return "addleave";
	}
	//添加申请请假的操作toaddsqlleave
	@RequestMapping(value="/toaddsqlleave")
	public String toaddsqlleave(Vacate vacate) {
		ser.addVacate(vacate);
		return "leave";
	}
	//管理员管理休假申请toleaveadmin
	@RequestMapping(value="/toleaveadmin")
	public String toleaveadmin(HttpSession session) {
		 User user= (User) session.getAttribute("sessionUser");
		 String username = user.getUsername();
		List<Vacate> listVacate = ser.manageLeave(username);
		session.setAttribute("listVacate", listVacate);
		return "manageleave";
	}
	//同意申请休假toagree
	@RequestMapping(value="/toagree")
	public String toagree(HttpSession session) {
	List<Vacate> listVacate = (List<Vacate>) session.getAttribute("listVacate");
	for (Vacate vacate : listVacate) {
		String name = vacate.getName();
		ser.alter(name);
	}
		return "redirect:toleave";
	}
	
	//不同意申请休假todisagree
	@RequestMapping(value="/todisagree")
	public String todisagree(HttpSession session) {
		List<Vacate> listVacate = (List<Vacate>) session.getAttribute("listVacate");
		for (Vacate vacate : listVacate) {
			String name = vacate.getName();
			ser.disagree(name);
		}
		return "redirect:toleave";
	}
	//跳转写邮件的页面toWriteEmail
	@RequestMapping(value="/toWriteEmail")
	public String toWriteEmail() {
		return "WriteEmail";
	}
	//上传文件sendEmail
	// 发送邮件
	@RequestMapping(value="/sendEmail")
	public String sendEmail(User user, Email email, HttpSession session, @RequestParam("file") MultipartFile file)
				throws Exception, IOException {
			if (!file.isEmpty()) {
				// String picName = UUID.randomUUID().toString();
				// 截取文件的扩展名(如.jpg)
				String oriName = file.getOriginalFilename();
				System.out.println(oriName);
				file.transferTo(new File("d:/" + file.getOriginalFilename()));
				email.setAccessory(oriName);;
			}
			User usersession = (User) session.getAttribute("sessionUser");
			String send_name = usersession.getUsername();
			email.setSend_name(send_name);
			ser.saveEmail(email);
			return "index";
		}
	
	
	//接收邮件toReceiveEmail
	@RequestMapping(value="/toReceiveEmail")
	public String toReceiveEmail(HttpSession session) {
		User user=(User) session.getAttribute("sessionUser");
		String username = user.getUsername();
		List<Email> findEmail = ser.findEmail(username);
		session.setAttribute("findEmail", findEmail);
		return "ReceiveEmail";
	}
	//下载附件download
	@RequestMapping(value="/download")
	public void down(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String file = request.getParameter("accessory");
		// 拼接路劲
		String fileName = "d:/" + file;
		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
		// 假如以中文名下载的话
		String filenameDown = file;
		// 转码，免得文件名中文乱码
		filenameDown = URLEncoder.encode(filenameDown, "iso-8859-1");
		// 设置文件下载头		
		response.addHeader("Content-Disposition", "attachment;filename=" + filenameDown);
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
	}
		//移除至垃圾箱toDeleteBox
	@RequestMapping(value="/toDeleteBox")
	public String toDeleteBox(Email email) {
		ser.toDelectBox(email);
		return "redirect:toReceiveEmail";
	}
	//邮件详情页toEmailDetails
	@RequestMapping(value="/toEmailDetails")
	public String toEmailDetails(Email email,HttpSession session) {
		Email sessionEmail=ser.toEmailDetails(email);
		session.setAttribute("sessionEmail", sessionEmail);
		return "EmailDetails";
	}
	
	//已读操作toRead
	@RequestMapping(value="/toRead")
	public String toRead(Email email) {
		ser.toRead(email);
		return "redirect:toReceiveEmail";
	}
	//进入垃圾邮件页面toRubbish
	@RequestMapping(value="/toRubbish")
	public String toRubbish(HttpSession session) {
		User user=(User) session.getAttribute("sessionUser");
		String username = user.getUsername();
		List<Email> findEmail = ser.findEmail(username);
		session.setAttribute("findEmail", findEmail);
		return "Rubbish";
	}
	//还原操作toRestore
	@RequestMapping(value="/toRestore")
	public String toRestore(Email email) {
		ser.toRestore(email);
		return "redirect:toReceiveEmail";
	}
	//彻底删除邮件DeleteEmail
	@RequestMapping(value="/DeleteEmail")
	public String DeleteEmail(Email email) {
		ser.DeleteEmail(email);
		return "redirect:toRubbish";
	}
}
