<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页面</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script>
	function setit() {
		document.forms[0].action="${pageContext.request.contextPath}/user/toagree";
		document.forms[0].submit();
	}
	function setit1() {
		document.forms[0].action="${pageContext.request.contextPath}/user/todisagree";
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
	<form id="myForm" name="myForm" action="userInfo!editData.action"
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
<title>休假管理页面</title>
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
					<div class="t">休假信息</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12%">申请人：</td>
								<td width="12%">开始时间：</td>
								<td width="12%">结束时间：</td>
								<td width="12%">天数：</td>
								<td width="12%">审核状态：</td>
								<td width="12%">原因：</td>
								<td width="12%"></td>
								<td width="12%"></td>
							</tr>
							<c:forEach items="${listVacate}" var="listVacate">
							<tr>
								<td>${listVacate.name }</td>
								<td>${listVacate.start_time } </td>
								<td>${listVacate.over_time } </td>
								<td>${listVacate.leave_day } </td>
								<td> <c:if test="${listVacate.audit==0 }">
									未审核
								</c:if>
								<c:if test="${listVacate.audit==1 }">
									审核通过
								 </c:if>
								  <c:if test="${sessionVacate.audit==2 }">
									审核未通过
								 </c:if>
								</td>
								<td>${listVacate.leave_cause } </td>
									<td align="center" colspan="2"><br/><input type="button"  id="save" value="同意" onclick="setit()" /></td>
									<td align="center" colspan="2"><br/><input type="button"  id="save1" value="不同意" onclick="setit1()" /></td>
							</tr>
							</c:forEach>
						</table>

					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
</html>

