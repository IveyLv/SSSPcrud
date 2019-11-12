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
</head>
<body>
    <form:form action="${pageContext.request.contextPath}" method="post" modelAttribute="employee">
        LastName:<form:input path="lastName"/>
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
