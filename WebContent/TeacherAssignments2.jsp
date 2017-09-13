<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "aA.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teachers' Assignments</title>
</head>
<body>
<object align = "right">	<a href = "SignOut.jsp">Sign Out</a> </object>
	<center><h3><b>Add new Assignment</b></h3></center>
	<%@ page import = "java.sql.*" %>
	
	
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/Mini"; //test is the db name. 3306 is the default port
		String username = "root"; //username to db
		String password = "123"; //password to db
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,username,password);

		String query;
	    PreparedStatement ps;
	    ResultSet rs;
		
	    String assignmentID = request.getParameter("assignmentID");
	    String title = request.getParameter("title");
	    String startdate = request.getParameter("startdate");
	    String duedate = request.getParameter("duedate"); 
	    String description = request.getParameter("description");
	    String status = "Ongoing";
	    //SOMETHING TO DO WITH THE ATTACHED FILE
	    
	    /*
	    	1. Add this assignment to the assignments table
	    	2. Add this assignment to the student_assignment table
	    	3. Add a column to the "student" table and set status to not submitted.
	    */
	    
	    //CREATE ASSIGNMENTS TABLE IF NOT EXIST
	    query = "CREATE TABLE IF NOT EXISTS assignments(assignmentID varchar(10), subject varchar(20),title varchar(50),startdate varchar(10), duedate varchar(10),description varchar(200),status varchar(10))";
		ps =conn.prepareStatement(query);
		ps.execute();
		
		//Add this assignment to the assignments table
		query = String.format("INSERT INTO assignments values(\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\")",assignmentID,Test.subject,title,startdate,duedate,description,status);
		ps =conn.prepareStatement(query);
		ps.execute();
		
		//Add a column to the "student" table and set status to not submitted.
		query = String.format("ALTER TABLE studentAssignment ADD COLUMN %s varchar(10) default \"NS\"",assignmentID);
		ps =conn.prepareStatement(query);
		ps.execute();
		
		ps.close();
		conn.close();
	%>
</body>
</html>