package com.fj.qianfeng.action;


import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value="/updateUser")
	public String updataUser(User user,HttpSession session) {
	    User findSessionUser = (User) session.getAttribute("sessionUser");
	    System.out.println(findSessionUser.getUsername()+"==="+findSessionUser.getPassword());
	    Integer id = findSessionUser.getId();
	    user.setId(id);
	    ser.modifyById(user);
		
	    User sessionUser = ser.findUser(user);
	    session.setAttribute("sessionUser", sessionUser);
		return "updateperson";
	}
}
