<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>写邮件</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script>
	function setit() {
		document.forms[0].submit();
	}
</script>
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
	<form id="myForm" name="myForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/user/sendEmail"
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
<title>发邮件</title>
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
			<dd>
			<c:if test="${sessionUser.isadmin==1 }">
				<a href="${pageContext.request.contextPath }/user/toleaveadmin" target="_self">休假申请</a>
			</c:if>
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
					<div class="t">发送邮件</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
						
							<tr>
						
								<td align="right" width="30%">收件人:</td>
								<td align="left">
								<select name="email_name">
								<c:forEach items="${Listusername}" var="user">
								<option>
									${user.username }
								</option>
								</c:forEach>
								</select>
								</td>
								
							
							</tr>
						
							<tr>
								<td align="right" width="30%">邮件标题:</td>
								<td align="left"><input type="text" name="email_title" value="" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件内容:</td>
								<td align="left"><textarea name="email_content" cols="22" rows="10" ></textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">上传附件:</td>
								<td align="left"><input type="file" name="file" onclick="upload(this)" /></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><input type="submit"  value="发送邮件"  name="sendEmail" /></td>
							</tr>
						</table>

					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>
<script>
function upload(ele){
	
	if(ele.files[0].size>9437184){
		alert("文件不允许超过9M");
		$("#sendEmail").attr('disabled',true);  
	}else{
		$("#sendEmail").attr('disabled',false);
	}
}
</script>
</body>
</html>

