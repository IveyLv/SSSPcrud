<%--
  Created by IntelliJ IDEA.
  User: 吕航
  Date: 2019/11/12
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSSP-CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <c:if test="${page == null || page.numberOfElements == 0}">
                    没有员工信息！
                </c:if>
                <c:if test="${page != null && page.numberOfElements > 0}">
                    <table class="table table-hover">
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>生日</th>
                            <th>创建时间</th>
                            <th>部门</th>
                            <th>编辑</th>
                            <th>删除</th>
                        </tr>
                        <c:forEach items="${page.content}" var="emp">
                            <tr>
                                <td>${emp.id}</td>
                                <td>${emp.lastName}</td>
                                <td>${emp.email}</td>
                                <td><fmt:formatDate value="${emp.birth}" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${emp.createDate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                                <td>${emp.department.deptName}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        编辑
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-sm">
                                        <span class="glyphicon glyphicon-trash"></span>
                                        删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-8">
                    共 ${page.totalPages} 条记录
                    共 ${page.totalPages} 页
                    当前第 ${page.number + 1} 页
                    <a href="${pageContext.request.contextPath}/emps?pageNo=${page.number + 1 - 1}">上一页</a>
                    <a href="${pageContext.request.contextPath}/emps?pageNo=${page.number + 1 + 1}">下一页</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
