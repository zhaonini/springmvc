<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Insert title here</title>

    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<%--  <script type="text/javascript" src="../static/js/jquery.min.js"></script>--%>

    <%-- 以下是删除相关的代码 --%>

    <script type="text/javascript">

        $(function(){

            $(".delete").click(function(){

                var href=$(this).attr("href");

                $("form").attr("action",href).submit();

                return false;

            });

        })

    </script>

    <%-- 以上是删除相关的代码 --%>

</head>

<body>

<!-- 以下是删除name="_method"为固定写法，Method从Post方法转为Delete请求 -->

<form action="" method="POST">

    <input type="hidden" name="_method" value="DELETE"/>



</form>

<!-- 以上是删除 -->

<c:if test="${empty requestScope.employees}">

<%--<c:if test="${empty request.getAttribute(employees)}">--%>

    没有任何员工信息

</c:if>

<c:if test="${not empty requestScope.employees}">
<%--<c:if test="${empty request.getAttribute(employees)}">--%>
    <table border="1" cellpadding="10" cellspacing="10">

        <tr>

            <td>ID</td>

            <td>LastName</td>

            <td>Email</td>

            <td>Gender</td>

            <td>Department</td>

            <td>Edit</td>

            <td>Delete</td>

        </tr>

        <%--<c:forEach items="${requestScope.employees}" var="emp" >--%>
        <c:forEach items="${requestScope.employees}" var="emp">
<Script>
    items=JSON.parse("${requestScope.employees}");
</Script>
            <tr>

                <td>${emp.id}</td>

                <td>${emp.lastName}</td>

                <td>${emp.email}</td>

                <td>${emp.gender==0?"Female":"Male"}</td>
            <td>${emp.gender}</td>

                <td>${emp.department.departmentName}</td>

                <td><a href="emp/${emp.id }">Edit</a></td>

                <td><a class="delete" href="emp/${emp.id}">Delete</a></td>

            </tr>

        </c:forEach>

    </table>

</c:if>

<a href="emp">add new employee</a>

</body>

</html>