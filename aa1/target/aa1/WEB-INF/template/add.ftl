<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加</title>
</head>
<body>
<form action="/stu/add.do" method="post">
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
                    <#list gradeList as cla>
                        <option value="${cla.id}" >${cla.cname}</option>
                    </#list>
                </select>
            </td>
        </tr>
        <tr><td colspan="2"><input type="submit"></td></tr>
    </table>
</form>
</body>
</html>