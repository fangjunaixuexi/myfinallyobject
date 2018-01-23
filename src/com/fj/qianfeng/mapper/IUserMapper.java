package com.fj.qianfeng.mapper;

import java.util.List;

import com.fj.qianfeng.model.Vacate;
import com.fj.qianfeng.model.User;

public interface IUserMapper {
	User findByName(User user);
	void modifyById(User user);
	User findUser(User user);
	void findById(User user);
	List<User> selectAll();
	void addUser(User user);
	Vacate findAll(String name);
	void addVacate(Vacate vacate);
	List<Vacate> manageLeave(String username);
	void alter(String name);
	void disagree(String name);
}
