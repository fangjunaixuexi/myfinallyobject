package com.fj.qianfeng.mapper;

import java.util.List;

import com.fj.qianfeng.model.User;

public interface IUserMapper {
	User findByName(User user);
	void modifyById(User user);
	User findUser(User user);
	void findById(User user);
	List<User> selectAll();
}
