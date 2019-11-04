<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>主页</title>
</head>
<body>

<form action="/stu/querystu.do" method="post">
    姓名：<input type ="text" name = "name" id="sname">
    性别：<select name = "sex">
        <option value = "" selected="selected">请选择</option>
        <option value = "男">男</option>
        <option value = "女">女</option>
    </select>
    班级：<select name = "cid">
        <option value = "" selected="selected">请选择班级~</option>
        <#list gradeList as clist>
            <option value = "${clist.id }">${clist.cname }</option>
        </#list>
    </select>
    <input type = "submit" value = "查询" id="subInput" class="b">
</form>

<br>

<table border="1">
<tr>
    <th>编号</th>
    <th>ID</th>
    <th>姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>班级</th>
    <th><a href="/stu/toAdd.do">添加</a></th>
</tr>
        <tr>
            <td th:text="${stu_index+1}"></td>
            <td th:text="${stu.stuno}"></td>
            <td th:text="${stu.name}"></td>
            <td th:text="${stu.sex}"></td>
            <td th:text="${stu.age}"></td>
            <td th:text="${stu.grade.cname}"></td>
            <td>
                <a th:href="/stu/delete.do">删除</a>
                <a th:href="/stu/toUpdate.do">修改</a>
            </td>
        </tr>
</table>

<br>
<a href="/stu/querystu.do?nowPage=1">首页</a>&nbsp;&nbsp;

<#if nowPage == 1>
    <a href="#">上一页</a>&nbsp;&nbsp;
<#else>
    <a href="/stu/querystu.do?nowPage=${nowPage-1}">上一页</a>&nbsp;&nbsp;
</#if>

第${nowPage}页ღ&nbsp;共${totalPage}页
&nbsp;&nbsp;
<#if nowPage == totalPage>
    <a href="#">下一页</a>&nbsp;&nbsp;
    <#else>
        <a href="/stu/querystu.do?nowPage=${nowPage+1}">下一页</a>&nbsp;&nbsp;
</#if>
<a href="/stu/querystu.do?nowPage=${totalPage}">尾页</a>
</body>
</html>