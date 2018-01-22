package com.fj.qianfeng.action;


import java.util.List;

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
	//修改个人信息之间的操作
	@RequestMapping(value="/updateUser")
	public String updataUser(User user,HttpSession session) {
	    User findSessionUser = (User) session.getAttribute("sessionUser");
	    Integer id = findSessionUser.getId();
	    user.setId(id);
	    ser.modifyById(user);
		
	    User sessionUser = ser.findUser(user);
	    session.setAttribute("sessionUser", sessionUser);
		return "updateperson";
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
	public String addmanage() {
		
		return "manageAccount";
	}
}
