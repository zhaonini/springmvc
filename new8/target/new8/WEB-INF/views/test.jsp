<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Insert title here</title>

    <%--<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>--%>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
</head>

<body>
<c:if test="${not empty requestScope.employees}">
    <%--<c:if test="${empty request.getAttribute(employees)}">--%>
    <table border="1" cellpadding="10" cellspacing="10">

        <tr>

            <td>ID</td>

        </tr>

            <%--<c:forEach items="${requestScope.employees}" var="emp" >--%>
        <c:forEach items="${requestScope.employees}" var="emp">

            <tr>
                <td>emp.id</td>
            </tr>

        </c:forEach>

    </table>

</c:if>
<a href="emp">add new employee</a>
</body>
</html>