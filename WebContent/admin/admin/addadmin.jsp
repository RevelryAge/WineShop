<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="zh-cn">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
	
<title>管理员添加页面</title>
</head>
<body>
	<form id="adminUserAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/adminUser_save.action"
		method="post">
		<table cellSpacing="1" cellPadding="5" width="70%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3; margin-top: 100px" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
				height="26"><strong><STRONG>管理员添加</STRONG> </strong></td>
			</tr>
			<tr>
				<td  align="center" bgColor="#f5fafe" class="ta_01">
					登录名：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="username" id="adminUserAction_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td  align="center" bgColor="#f5fafe" class="ta_01">
					真实姓名：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="realname" id="adminUserAction_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td  align="center" bgColor="#f5fafe" class="ta_01">
					登录密码：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="password" value="123456" id="adminUserAction_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="adminUserAction_save_do_submit" value="确定"
						class="button_ok">&#30830;&#23450;</button> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>