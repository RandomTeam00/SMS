<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "aA.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Assignments</title>
</head>
<body>
	<center><h3><b>Review Assignments</b></h3></center>
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
			    
	    /*
	    	1. Look at all the submitted assignments.
	    	2. Change their status.
	    */
	    
	    query = String.format("SELECT username,name FROM student WHERE %s = \"S\"",Test.subject);
	    ps =conn.prepareStatement(query);
		rs = ps.executeQuery(query);
		int i=0;
		while(rs.next())
		{
			Test.names[i]=rs.getString("name");
			Test.unames[i]=rs.getString("username");
			i++;
			Test.a++;
		}
		
		ps.close();
		conn.close();
	%>
	
<form action = "tempTeacherAssignments.jsp" method="post">	
	<table>
		<tr>
			<th>Sr.No.</th>
			<th>Student Name</th>
			<th>Input</th>
		</tr>
		
	<%
		for (int j =0; j < i ; j++)
		{
	%>
		<tr>
			<td align="center"> <%=j+1%></td>
			<td align="center"> <%=Test.names[j]%></td>
			<td align="center">
				<select name = "<%="input"+j %>">
					<option value = "D">Done</option>
					<option value = "R">Redo</option>
					<option value = "NS">Not Submitted</option>
				</select>
			</td>
		</tr>
	<%       
		}
	%>
		
	</table>
	<input type="submit" value="Update"/>
</form>	
</body>
</html>