package com.fj.qianfeng.mapper;

import com.fj.qianfeng.model.User;

public interface IUserMapper {
	User findByName(User user);
	void modifyById(User user);
	User findUser(User user);
}
