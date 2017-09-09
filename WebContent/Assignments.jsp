<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "aA.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Assignments</title>
</head>
<body>
	<center><h3><b>Assignment page css</b></h3></center>
	<%@ page import = "java.sql.*" %>
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/Mini"; //test is the db name. 3306 is the default port
		String username = "root"; //username to db
		String password = "123"; //password to db
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,username,password);
		
		System.out.println("YO");
		System.out.println("Test.currentAssignmentCount : "+Test.currentAssignmentCount);
		
		String query = "select column_name from information_schema.columns where table_name='student'";
		PreparedStatement ps =conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery(query);
		
		//System.out.println("Selected values");
		
		while(rs.next())
		{
			String col = rs.getString("column_name");
			
			if(!col.equals("username") && !col.equals("name"))
			{
				Test.assignments[Test.currentAssignmentCount++] = col;
			}
		}
		System.out.println("Test.currentAssignmentCount : "+Test.currentAssignmentCount);
		//Thread.sleep(5000); // sleep 5 seconds
		int i=0;
		while(i<Test.currentAssignmentCount)
		{
			 query = "select "+Test.assignments[i]+" from student where username = \""+Test.userName+"\"";
			 System.out.println("query : "+query);
			 ps =conn.prepareStatement(query);
			 rs = ps.executeQuery(query);
			 if(rs.next())
			 {
				 Test.status[i] = rs.getString(Test.assignments[i]);
				 System.out.println("Status : "+Test.status[i]);
			 }
			 i++;
		}

	%>
	
<table>
<tr>
<th>Assignment</th>
<th>Status</th>
</tr>
	<%
		for (i =0; i < Test.currentAssignmentCount ; i++)
		{
	
	%>
		<tr>
		<td> <%=Test.assignments[i]%></td>
		<td><%=Test.status[i]%> </td>
		</tr>
		
	<%       
		}
	%>

</table>
	
</body>
</html>