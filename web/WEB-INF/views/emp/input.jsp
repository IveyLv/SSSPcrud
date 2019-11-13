<%--
  Created by IntelliJ IDEA.
  User: 吕航
  Date: 2019/11/12
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#lastName").change(function () {
                var lastName = $(this).val();
                lastName = $.trim(lastName);
                $(this).val(lastName);
                //alert(lastName);
                var url = "${pageContext.request.contextPath}/ajaxValidate";
                var args = {"lastName" : lastName, "date" : new Date()};
                $.post(url, args, function (data) {
                    //alert(data);
                    if (data === "0") {
                        $("#validateMsg").text("用户名可用");
                    } else {
                        $("#validateMsg").text("用户名不可用");
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form:form action="${pageContext.request.contextPath}/emp" method="post" modelAttribute="employee">
        LastName:<form:input path="lastName" id="lastName"/>
        <span id="validateMsg"></span>
        <br>
        Email:<form:input path="email"/>
        <br>
        Birth:<form:input path="birth"/>
        <br>
        Department:
        <form:select path="department.id" items="${departments}" itemLabel="deptName" itemValue="id">
        </form:select>
        <br>
        <input type="submit" value="Submit">
    </form:form>
</body>
</html>
