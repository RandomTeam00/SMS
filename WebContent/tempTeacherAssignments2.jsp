<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "aA.Test" %>	
	
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/Mini"; //test is the db name. 3306 is the default port
		String username = "root"; //username to db
		String password = "123"; //password to db
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,username,password);

		int i=0;		
		String query;
	    PreparedStatement ps;
	    
	    for(i=0;i<Test.b;i++)
	    {
	    	String val = request.getParameter("newStatus"+i);
	    	System.out.println(val);
	    	if(val.equals("complete"))
	    	{
	    		query = "alter table studentAssignment drop column "+Test.assignmentID1[i];
	    		System.out.println(query);
	    		ps = conn.prepareStatement(query);
	    		ps.execute();
	    		
	    		query = "update assignments set status = \"Complete\" where assignmentID = \""+Test.assignmentID1[i]+"\"";
	    		ps = conn.prepareStatement(query);
	    		ps.execute();
	    	}
	    }

	%>
</body>
</html>