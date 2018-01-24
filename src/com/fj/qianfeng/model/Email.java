package com.fj.qianfeng.model;

public class Email {
private String email_name;
private String email_title;
private String email_content;
private String accessory;
private Integer isdelete;
private Integer id;
private Integer isread;
private String send_name;
public String getSend_name() {
	return send_name;
}
public void setSend_name(String send_name) {
	this.send_name = send_name;
}
public Integer getIsread() {
	return isread;
}
public void setIsread(Integer isread) {
	this.isread = isread;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getEmail_name() {
	return email_name;
}
public void setEmail_name(String email_name) {
	this.email_name = email_name;
}
public String getEmail_title() {
	return email_title;
}
public void setEmail_title(String email_title) {
	this.email_title = email_title;
}
public String getEmail_content() {
	return email_content;
}
public void setEmail_content(String email_content) {
	this.email_content = email_content;
}

public String getAccessory() {
	return accessory;
}
public void setAccessory(String accessory) {
	this.accessory = accessory;
}
public Integer getIsdelete() {
	return isdelete;
}
public void setIsdelete(Integer isdelete) {
	this.isdelete = isdelete;
}
}
