<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript">
	function checkPname() {
		var pname = document.getElementById("pname").value;
		if (pname == "") {
			alert("请输入商品的名称！");
			return false;
		} else {
			var xhr = new XMLHttpRequest();
			/* 确定请求地址和请求参数 */
			var url = "${pageContext.request.contextPath}/adminProduct_findByName.action?pname="
					+ pname + "";
			/* 调用XMLHttpRequest对象的open()方法建立对服务器的调用 */
			xhr.open("post", url, true)
			//指定响应事件处理函数
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					document.getElementById("span1").innerHTML = xhr.responseText;
				}
			}
			//向服务器发送请求
			xhr.send();
		}
	}

	function checkForm() {
		var shop_price = document.getElementById("shop_price").value;
		var market_price = document.getElementById("market_price").value;
		var price = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
		var num = /(^[1-9]\d*(\.\d{1,2})?$)/;
		if (!price.test(shop_price || shop_price == "")) {
			alert("请重新输入正确的商场价格！");
			return false;
		}
		if (!price.test(market_price)) {
			alert("请重新输入正确的市场价格！");
			return false;
		}
		if (document.getElementById("upload").value == "") {
			alert("请上传商品的图片！");
			return false;
		}
		if (!num.test(document.getElementById("pcount").value)) {
			alert("请输入正确的库存数量！");
			return false;
		}
		return true;
	}
</script>
</HEAD>

<body>
	<!--  -->
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/adminProduct_save.action"
		method="post" enctype="multipart/form-data"
		onsubmit="return checkForm();">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="80%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加商品</STRONG> </strong></td>
			</tr>

			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商品名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="pname" value="" id="pname" class="bg"
					onblur="return checkPname();" /><span id="span1"></span></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					是否热门：</td>
				<td class="ta_01" bgColor="#ffffff"><select name="is_hot">
						<option value="1">是</option>
						<option value="0">否</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					市场价格：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="market_price" value="" id="market_price" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商城价格：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="shop_price" value="" id="shop_price" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商品图片：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="1"><input
					type="file" name="upload" id="upload" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					库存：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="pcount" value="" id="pcount" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					所属的二级分类：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3"><select
					name="categorySecond.csid">
						<s:iterator var="cs" value="csList">
							<option value="<s:property value="#cs.csid"/>"><s:property
									value="#cs.csname" /></option>
						</s:iterator>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商品描述：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3"><textarea
						name="pdesc" rows="5" cols="120"></textarea></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="userAction_save_do_submit" value="确定"
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
</HTML>