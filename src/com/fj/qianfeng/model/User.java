package com.fj.qianfeng.model;

public class User {
private String sex;
private Integer id;
private Integer age;
private String username;
private String password;
private Integer phone;
private String addres;
private Integer isadmin;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public Integer getPhone() {
	return phone;
}
public void setPhone(Integer phone) {
	this.phone = phone;
}
public String getAddres() {
	return addres;
}
public void setAddres(String addres) {
	this.addres = addres;
}
public Integer getIsadmin() {
	return isadmin;
}
public void setIsadmin(Integer isadmin) {
	this.isadmin = isadmin;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public Integer getAge() {
	return age;
}
public void setAge(Integer age) {
	this.age = age;
}

}
