<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta content="UTF-8" />
<title>订单详情页</title>
</head>
<body style="text-align: center;">
<table width="80%" align="center" border="1" cellpadding="0" cellspacing="0" style="border-color: green;">
		<tr><th>序号</th><th>图片</th><th>商品名称</th><th>数量</th></tr>
	<s:iterator var="orderItem" value="list" status="id">
	<tr>
	<td>${id.index+1 }</td>
		<td><img width="40" height="45" src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/></td>
		<td><s:property value="#orderItem.product.pname"/></td>
		<td><s:property value="#orderItem.count"/></td>
	</tr>
	</s:iterator>
	</table>
	<center><a href="" onclick="history.go(-1)">返回</a></center>
</body>

</html>



