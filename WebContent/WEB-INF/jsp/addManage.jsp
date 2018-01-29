<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户页面</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script>
	function setit() {
		document.forms[0].action="/ProjectWorking/user/toindex";
		document.forms[0].submit();
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>

<body>
	<div class="top">
		<div class="global-width">
			<img src="${pageContext.request.contextPath}/Images/logo.gif" class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			${sessionUser.username}
			你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="location.href='${pageContext.request.contextPath}/user/tologin'";>注销</a>
		</div>
	</div>
	<form id="myForm" name="myForm" action="${pageContext.request.contextPath }/user/addmanage"
		method="post">
		<input type="hidden" name="u.id" value="26" /> <input type="hidden"
			name="u.sex" value="2" id="u_sex" /> <input type="hidden"
			name="u.supper" value="0" id="u_supper" />
		<div class="main">
			<div class="global-width">


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="nav" id="nav">
		<div class="t"></div>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/user/toperson" target="_self">详细信息</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				邮件管理</dt>
		<dd>
				<a href="${pageContext.request.contextPath }/user/toWriteEmail" target="_self">写邮件</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/user/toReceiveEmail" target="_self">收邮件</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath }/user/toRubbish" target="_self">垃圾邮件</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				考勤管理</dt>
			<dd>
				<a href="${pageContext.request.contextPath }/user/toleave" target="_self">休假</a>
			</dd>
		</dl>

		<dl>

			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				权限管理</dt>
			
			<dd>
				<a href="${pageContext.request.contextPath }/user/toPersonAccount" target="_self">个人账户</a>
			</dd>
		
			<c:if test="${sessionUser.isadmin==1 }">
			<dd>
				<a href="${pageContext.request.contextPath }/user/tomanage" target="_self">管理账户</a>
			</dd>
			</c:if>
		</dl>
	</div>
</body>
				</html>

			 
					<div class="action">
						<div class="t">
							详细信息
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">昵称：</td><td  align="left"><input type="text" name="username" id="username" /><label style="color: red">*</label></td>
									
								</tr>
								<tr >
									<td align="right" width="30%">密码：</td><td  align="left"><input type="text" name="password" id="password"/><label style="color: red">*</label></td>
								</tr>
								<tr >
									<td align="right" width="30%">年龄：</td><td  align="left"><input type="text" name="age" id="age" /></td>
								</tr>
								<tr >
									<td align="right" width="30%">性别：</td><td  align="left">
									<select name="sex" id="sex">
									<option value='男'>男</option>
									<option value='女'>女</option>
									</select>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">手机：</td><td  align="left"><input type="text" name="phone" id="phone"  /></td>
								</tr>
								<tr >
									<td align="right" width="30%">地址：</td><td  align="left"><input type="text" name="addres" id="addres" /></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/>
									<input type="button"   value="返回" onclick="setit()" />
									<input type="submit"  id="save" value="保存数据" />
									</td>
								</tr>
								
								</table>
								
						</div>
					</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>
<script type="text/javascript">
$(function() {
	$("#myForm").validate({
						rules : {
							username:{
								required:true
							},
							password:{
								required:true
							},
						
							age:{
								required:true
							},
							phone:{
								required:true,
							 	digits:true,
								minlength:11 
							}
							},
						messages : {
							username :{
								required:"用户名不能为空"
								},
							password:{
									required:"密码不能为空"
								},
							age:{
									required:"年龄不能为空"
									},
							phone:{
							required:"手机号不能为空",
							digits:"手机号必须是整数",
							minlength:"长度在11位"
									}
						}
			});
})


</script>
</body>
</html>

