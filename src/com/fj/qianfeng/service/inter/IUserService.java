package com.fj.qianfeng.service.inter;

import java.util.List;

import com.fj.qianfeng.model.User;

public interface IUserService {

	User findByName(User user);
	void modifyById(User user);
	User findUser(User user);
	void saveById(User user);
	List<User> selectAll();
}
