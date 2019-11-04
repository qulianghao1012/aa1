<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>--Black Dragon--</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
       function selectAll() {
           var check = document.getElementsByName("chec");
           for(var a = 0;a < check.length; a++){
               check[a].checked = 'cheched';
           }
       }
       function deselect() {
           var check = document.getElementsByName("chec");
           for(var a = 0;a < check.length; a++){
               if(check[a].checked = "checked"){
                   check[a].checked = "";
               }
           }
       }
       function sub(aa) {
           var myform = document.getElementById(aa);
           myform.submit();
       }
    </script>

</head>

<body>

<form action="<%=request.getContextPath()%>/stu/querystu.do" method="post">
    姓名：<input type ="text" name = "name" id="sname">
    性别：<select name = "sex">
    <option value = "" selected="selected">请选择</option>
    <option value = "男">男</option>
    <option value = "女">女</option>
</select>
    班级：<select name = "cid">
    <option value = "" selected="selected">请选择班级~</option>
    <c:forEach items="${gradeList}" var="clist">
        <option value = "${clist.id }">${clist.cname }</option>
    </c:forEach>
</select>
    <input type = "submit" value = "查询" id="subInput" class="b">
</form>

<br>
<form action="<%=request.getContextPath()%>/stu/deleteMore.do" method="post">
<table border="1">
    <input type="button" onclick="selectAll()" value="全选"><input type="button" onclick="deselect()" value="反选">
    <tr>
        <th>---</th><th>编号</th><th>姓名</th><th>性别</th><th>年龄</th><th>班级</th><th><a href="<%=request.getContextPath()%>/stu/toAdd.do">添加</a></th>
    </tr>
    <c:forEach items="${list}" var="stu" varStatus="stat">
      <form id="myform_${stat.index+1}" action="<%=request.getContextPath()%>/stu/${stu.stuno}.do" method="post">
          <input type="hidden" name="_method" value="DELETE">
          <tr>
            <th><input type="checkbox" name="chec" value="${stu.stuno}"></th>
            <td>${stat.index+1}</td>
            <td>${stu.name}</td>
            <td>${stu.sex}</td>
            <td>${stu.age}</td>
            <td>${stu.grade.cname}</td>
            <td>
                <a href="<%=request.getContextPath()%>/stu/delete.do?stuno=${stu.stuno}">删除</a>
                <a href="<%=request.getContextPath()%>/stu/toUpdate.do?stuno=${stu.stuno}">修改</a>
            </td>
          </tr>
      </form>
    </c:forEach>
</table>
</form>
<br>
<a href="<%=request.getContextPath()%>/stu/querystu.do?nowPage=1">首页</a>&nbsp;&nbsp;

<a href=<c:if test="${nowPage>1}">"<%=request.getContextPath()%>/stu/querystu.do?nowPage=${nowPage-1}"</c:if>>上一页</a>&nbsp;&nbsp;

第${nowPage}页ღ&nbsp;共${totalPage}页&nbsp;&nbsp;

<a href=<c:if test="${nowPage<totalPage}">"<%=request.getContextPath()%>/stu/querystu.do?nowPage=${nowPage+1}"</c:if>>下一页</a>&nbsp;&nbsp;

<a href="<%=request.getContextPath()%>/stu/querystu.do?nowPage=${totalPage}">尾页</a>
</body>
</html>
