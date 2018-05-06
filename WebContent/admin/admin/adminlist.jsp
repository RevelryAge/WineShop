<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/public.js">
	
</script>

</HEAD>
<script type="text/javascript">
	function addAdminUser() {
		window.location.href = "${pageContext.request.contextPath}/admin/admin/addadmin.jsp";
	}
</script>
<body>
	<br />
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="60%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>管理员列表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加"
							class="button_add" onclick="addAdminUser()">
							&#28155;&#21152;</button>
					</td>
				</tr>

				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="10%">序号</td>
								<td align="center" width="20%">登录名称</td>
								<td align="center" width="20%">真实姓名</td>
								<td width="10%" align="center">操作</td>
							</tr>
							<s:iterator var="au" value="pageBean.list" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="18%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><s:property value="#au.username" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><s:property value="#au.realname" /></td>
									<s:if test="#session.existAdminUser.uid == #au.uid">
										<td align="center" style="HEIGHT: 22px"><a
											href="${ pageContext.request.contextPath }/adminUser_edit.action?uid=<s:property value="#au.uid"/>">
												<img
												src="${pageContext.request.contextPath}/images/i_edit.gif"
												border="0" style="CURSOR: hand">
										</a></td>
									</s:if>
									<s:if test="#session.existAdminUser.uid != #au.uid">
										<td align="center" style="HEIGHT: 22px"><a
											href="${ pageContext.request.contextPath }/adminUser_delete.action?uid=<s:property value="#au.uid"/> "
											onclick="deluser()"> <img
												src="${pageContext.request.contextPath}/images/i_del.gif"
												width="16" height="16" border="0" style="CURSOR: hand">
										</a></td>
									</s:if>

								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td colspan="7">第<s:property value="pageBean.page" />/<s:property
							value="pageBean.totalPage" />页 <s:if test="pageBean.page != 1">
							<a
								href="${ pageContext.request.contextPath }/adminUser_findAll.action?page=1">首页</a>|
								<a
								href="${ pageContext.request.contextPath }/adminUser_findAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a>|
							</s:if> <s:if test="pageBean.page != pageBean.totalPage">
							<a
								href="${ pageContext.request.contextPath }/adminUser_findAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a>|
								<a
								href="${ pageContext.request.contextPath }/adminUser_findAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
							</s:if>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

