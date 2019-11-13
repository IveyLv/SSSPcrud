<%--
  Created by IntelliJ IDEA.
  User: 吕航
  Date: 2019/11/12
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                var oldLastName = $("#oldLastName").val();
                oldLastName = $.trim(oldLastName);
                if (oldLastName != null && oldLastName !== "" && oldLastName === lastName) {
                    alert("用户名可用");
                    return;
                }

                var url = "${pageContext.request.contextPath}/ajaxValidate";
                var args = {"lastName" : lastName, "date" : new Date()};
                $.post(url, args, function (data) {
                    //alert(data);
                    if (data === "0") {
                        alert("用户名可用");
                    } else {
                        alert("用户名不可用");
                    }
                });
            });
        });
    </script>
</head>
<body>
    <c:set value="${pageContext.request.contextPath}/emp" var="url"/>
    <c:if test="${employee.id != null}">
        <c:set value="${pageContext.request.contextPath}/emp/${employee.id}" var="url"/>
    </c:if>
    <form:form action="${url}" method="POST" modelAttribute="employee">
        <c:if test="${employee.id != null}">
            <input type="hidden" id="oldLastName" value="${employee.lastName}">
            <form:hidden path="id"/>
            <input type="hidden" name="_method" value="PUT">
        </c:if>
        LastName:<form:input path="lastName" id="lastName"/>
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
