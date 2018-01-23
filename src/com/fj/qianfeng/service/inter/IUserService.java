package com.fj.qianfeng.service.inter;

import java.util.List;

import com.fj.qianfeng.model.Vacate;
import com.fj.qianfeng.model.User;

public interface IUserService {

	User findByName(User user);
	void modifyById(User user);
	User findUser(User user);
	void saveById(User user);
	List<User> selectAll();
	void addUser(User user);
	Vacate findAll(String name);
	void addVacate(Vacate vacate);
	List<Vacate> manageLeave(String username);
	void alter(String name);
	void disagree(String name);
}
