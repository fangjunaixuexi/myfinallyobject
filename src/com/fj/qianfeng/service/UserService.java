package com.fj.qianfeng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fj.qianfeng.mapper.IUserMapper;
import com.fj.qianfeng.model.Vacate;
import com.fj.qianfeng.model.User;
import com.fj.qianfeng.service.inter.IUserService;

@Service
public class UserService implements IUserService {
	@Autowired
	IUserMapper usermapper;

	@Override
	public User findByName(User user) {
		return usermapper.findByName(user);
	}

	@Override
	public void modifyById(User user) {
		usermapper.modifyById(user);
	}

	@Override
	public User findUser(User user) {
	
		return usermapper.findUser(user);
	}

	@Override
	public void saveById(User user) {
		usermapper.findById(user);
		
	}

	@Override
	public List<User> selectAll() {
		
		return usermapper.selectAll();
	}

	@Override
	public void addUser(User user) {
		usermapper.addUser(user);
		
	}

	@Override
	public Vacate findAll(String name) {
	
		return usermapper.findAll(name);
	}

	@Override
	public void addVacate(Vacate vacate) {
		usermapper.addVacate(vacate);
		
	}

	@Override
	public List<Vacate> manageLeave(String username) {
		
		return usermapper.manageLeave(username);
	}

	@Override
	public void alter(String name) {
		usermapper.alter(name);
		
	}

	@Override
	public void disagree(String name) {
		usermapper.disagree(name);
	}

}
