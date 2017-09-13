<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Assignments</title>
</head>
<body>
<object align = "right">	<a href = "SignOut.jsp">Sign Out</a> </object>
<%@ page import = "java.sql.*" %>
 <%@ page import = "aA.Test" %>	
	
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/Mini"; //test is the db name. 3306 is the default port
		String username = "root"; //username to db
		String password = "123"; //password to db
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,username,password);
		
		String query,newStatus="";
	    PreparedStatement ps;
	    ResultSet rs;
		int i=0;
		String Subjects[]=new String[10];//TODO use count
		String Titles[]=new String[10];
		String Duedates[]=new String[10];
		String Startdates[]=new String[10];
		String Status[]=new String[10];
		int flag = 0;
	    try
	    {
		    query = String.format("SELECT * FROM assignments where subject = \"%s\" and status = \"Ongoing\"",Test.subject);
		    ps = conn.prepareStatement(query);
			rs = ps.executeQuery(query);
			
			while(rs.next())
			{
				Test.assignmentID1[i] = rs.getString("assignmentID");
				//Subjects[i] = rs.getString("subject");
				Titles[i] = rs.getString("title");
				Duedates[i] = rs.getString("duedate");
				Startdates[i] = rs.getString("startdate");
				Status[i] = rs.getString("status");
				i++;
				Test.b++;
			}
	    }
	    catch (Exception e)
	    {
	    	out.println("No ongoing assignments!");
	    	flag = 1;
	    }
	    if(flag==0)
	    {
	 %> 
<form action = "tempTeacherAssignments2.jsp" method="post">	 
<table>
<tr>
<th>Sr.No.</th>
<th>ID</th>
<!--	<th>Subject</th>	-->
<th>Title</th>
<th>Start-Date</th>
<th>Due-Date</th>
<th>Current Status</th>
<th>Change Status</th>
</tr>
	<%
		for (int j =0; j < i ; j++)
		{
	
	%>
		<tr>
		<td> <%=j+1%></td>
		<td> <%=Test.assignmentID1[j]%></td>
<!--  	<td> <%=Subjects[j]%></td>	-->
		<td><%=Titles[j]%> </td>
		<td> <%=Startdates[j]%></td>
		<td> <%=Duedates[j]%></td>
		<td><%=Status[j]%> </td>
		<td><select name = "<%="newStatus"+j %>">
				    <option value="ongoing">Ongoing</option>
				    <option value="complete">Complete</option>
			</select>
		</td>
		</tr>
		
	<%       
		}
	   }
	%>
</table>
	<input type="submit" value="Update"/>
</form>
</body>
</html>