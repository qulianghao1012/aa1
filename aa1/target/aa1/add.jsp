<%--
  Created by IntelliJ IDEA.
  User: 20799
  Date: 2019-10-08
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>添加</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/stu/add.do" method="post">
    <table>
        <tr align="center">
            <th>姓名</th><td><input type = "text" name = "name" class="in" id="name">
        </tr>

        <tr align="center">
            <th>
                性别
            </th>
            <td>
                <select name = "sex">
                    <option value = "" selected="selected">请选择</option>
                    <option value = "男">男</option>
                    <option value = "女">女</option>
                </select>
            </td>
        </tr>
        <tr align="center">
            <th>年龄</th><td><input type = "text" name = "age" class="in"></td>
        </tr>
        <tr align="center">
            <th>班级</th>
            <td>
                <select name = "cid" >
                    <option value="0">请选择。。</option>
                    <c:forEach items="${gradeList}" var="cla">
                        <option value="${cla.id}" >${cla.cname}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr><td colspan="2"><input type="submit"></td></tr>
    </table>
</form>
</body>
</html>
