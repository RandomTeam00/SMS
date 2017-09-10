<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "aA.Test" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Tutorial | HelloWorld</title>
</head>
<body>
<h3> HelloWorld </h3>

The time on the server is <%= new java.util.Date() %>
<br>
<br>
<% Test.yo(); System.out.println("HW2");out.println(Test.showA()); %>

<%
	String uname= request.getParameter("ff1"); 
	System.out.println("HW2 "+ uname);
%>

</body>
</html>