<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "aA.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import = "java.sql.*" %>
<title>Redirecting..</title>
</head>
<body>
Redirecting...

<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Mini"; //test is the db name. 3306 is the default port
	String username = "root"; //username to db
	String password = "123"; //password to db
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,username,password);
	
	String query;
	PreparedStatement ps;
	
	/*query = "update";
	ps =conn.prepareStatement(query);*/
	
	for(int i=0;i<Test.currentAssignmentCount;i++)
	{
		System.out.println(request.getParameter("input"+i));
		String val = request.getParameter("input"+i);
		Test.status[i]=val;
		
		query = "update student set "+Test.assignments[i]+" = \""+Test.status[i]+"\" where username = \""+Test.userName+"\"";
		System.out.println(query);
		ps =conn.prepareStatement(query);
		ps.execute();
		ps.close();
	}
	
	conn.close();
	//Thread.sleep(2000);
%>

	<jsp:forward page="StudentAssignments.jsp"/>
</body>
</html>