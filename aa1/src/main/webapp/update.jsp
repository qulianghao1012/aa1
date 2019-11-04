<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>--xiugai--</title>
	<style type="text/css">
		#sub_button{
			width: 170px; /* 宽度 */
			height: 40px; /* 高度 */
			border-width: 0px; /* 边框宽度 */
			border-radius: 3px; /* 边框半径 */
			background: #1E90FF; /* 背景颜色 */
			cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
			outline: none; /* 不显示轮廓线 */
			font-family: Microsoft YaHei; /* 设置字体 */
			color: white; /* 字体颜色 */
			font-size: 17px; /* 字体大小 */
		}
		#sub_button:hover{
			background: #60ff47;
		}
		.in{
			width: 258px;
			position :relative;
			top: 2px;
			left: 2px;
			height: 18px;
			padding: 11px 0 11px 10px;
			line-height:8px;
			border: none;
			background: 0 0;
			color: #333;
			font-family: Verdana,Tahoma,Arial;
			font-size: 16px;
		}
		select{
			padding: 3px;
            font-size: 14px;
            font-weight: bold;
            color: #555;
		}
	</style>
</head>
<body>
${name}
<center>
<form action="<%=request.getContextPath() %>/stu/update.do" method="post">
	<input type="hidden" name="_method" value="PUT">
	<input type="hidden" name="stuno" value="${student.stuno}">
<table>
	<tr align="center">
		<th>姓名</th><td><input type = "text" name = "name" value="${student.name}" class="in"></td>
	</tr>
	<tr align="center">
		<th>
			性别
		</th>
		<td>
			<select name = "sex">
				<option value = "男" ${student.sex=='男'?'selected':''}>男</option>
				<option value = "女" ${student.sex=='女'?'selected':''}>女</option>
			</select>
		</td>
	</tr>
	<tr align="center">
		<th>年龄</th><td><input type = "text" name = "age" value="${student.age}" class="in"></td>
	</tr>
	<tr align="center">
		<th>班级</th><td>
		<select name="cid">
			<c:forEach items="${gradeList}" var="cla">
				<option value="${cla.id}" ${student.cid==cla.id?'selected':''}>${cla.cname}</option>
			</c:forEach>
		</select>
	</td>
	</tr>
	<tr align="center">
		<th colspan="2"><input type = "submit" value="修改" id="sub_button"></th>
	</tr>
</table>

</form>
</center>
</body>
</html>