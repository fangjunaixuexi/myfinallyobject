package com.fj.qianfeng.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fj.qianfeng.mapper.IUserMapper;
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

}
