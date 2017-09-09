<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
</head>
<body>
<form action = "SignUp2.jsp" method="post">
	Name : <input type = "text" name = "name"><br>
	E-Mail ID : <input type = "text" name = "email"><br>
	Username : <input type = "text" name = "username"><br>
	Password : <input type = "password" name = "password"><br>
	Designation : <input type = "radio" name = "designation" value = "teacher">Teacher
				<input type = "radio" name = "designation" value = "student" >Student<br>
				
	<input type="submit" value="Sign Up!">
</form>
</body>
</html>