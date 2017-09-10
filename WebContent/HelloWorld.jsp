<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "aA.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<% Test.yo(); System.out.println("\tHW1"); Test.incA();%>
<form action = "HelloWorld2.jsp" method="post">
	<select name="<%="ff"+3 %>">
		<option value = "nsub">Not Submitted</option>
		<option value = "sub">Submitted</option>
	</select>
	
	<input type="submit" value="Submit"/>
</form>


</body>
</html>