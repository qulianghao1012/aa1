<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改</title>
</head>
<body>
    <form action="/stu/update.do" method="post">
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
                            <option value = "男" <#if student.sex == '男'>selected = selected</#if>>男</option>
                            <option value = "女" <#if student.sex == '女'>selected = selected</#if>>女</option>

                    </select>
                </td>
            </tr>
            <tr align="center">
                <th>年龄</th><td><input type = "text" name = "age" value="${student.age}" class="in"></td>
            </tr>
            <tr align="center">
                <th>班级</th><td>
                    <select name="cid">
                        <#list gradeList as cla>
                            <#if student.cid == cla.id>
                                <option value="${cla.id}" selected = selected>${cla.cname}</option>
                            <#elseif student.cid != cla.id>
                                <option value="${cla.id}">${cla.cname}</option>
                            </#if>
                        </#list>
                    </select>
                </td>
            </tr>
            <tr align="center">
                <th colspan="2"><input type = "submit" value="修改" id="sub_button"></th>
            </tr>
        </table>

    </form>
</body>
</html>