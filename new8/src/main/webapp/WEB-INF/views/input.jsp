<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@page import="java.util.Map" %>

<%@page import="java.util.HashMap" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<%-- 以上是sringmvc的表达标签 --%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Insert title here</title>

</head>

<body>

<br><br>

<!-- 使用form标签可以快速开发表单页面，可以方便的完成表单值回显 -->

<!-- modelAttribute="employee"中的属性值与handler中的map.put("employee",new Employee());一致 -->

<form:form action="${pageContext.request.contextPath }/emp" method="POST" modelAttribute="employee">

    <!-- path属性对应html表单标签的name属性值 -->



    <c:if test="${employee.id==null }">

        LastName:<form:input path="lastName"/>

    </c:if>

    <c:if test="${employee.id!=null }">

        <form:hidden path="id"/>

        <!--path所对应的属性必须在modelAttribute的bean中存在对应的属性，也就是

        以上的modelAttribute="employee"，所以以下的input不能用form：input

        来写，对于—_method不能使用form:hidden标签，因为modelAttribute对应的bean中没有_method

        这个属性 ，应该用<input type="hidden" name="_method" value="PUT"/>-->

        <!-- 把post转为put请求，用以下隐藏域方法来转换 -->

        <input type="hidden" name="_method" value="PUT"/>

    </c:if>

    <br>

    Email:<form:input path="email"/>

    <br>

    <%

        Map<String,String> genders=new HashMap();

        genders.put("1","Male");

        genders.put("0","Female");

        request.setAttribute("genders",genders);

    %>

    Gender:<form:radiobuttons path="gender" items="${genders}"></form:radiobuttons>



    <br>

    Department:<form:select path="department.id" items="${departments}" itemLabel="departmentName" itemValue="id">

</form:select>

    <br>

    <!--

    1、数据类型转换

    2、数据类型格式化

    3、数据校验

    -->

    <input type="submit" value="everything"/>

</form:form>

</body>

</html>