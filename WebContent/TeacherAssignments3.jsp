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
<object align = "right">	<a href = "SignOut.jsp">Sign Out</a> </object>
	<center><h3><b>Review Assignments</b></h3></center>
	<%@ page import = "java.sql.*" %>
	
	<a href = "http://localhost:8080/Mini/TeacherWelcome.jsp">HOME</a>
	
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/Mini"; //test is the db name. 3306 is the default port
		String username = "root"; //username to db
		String password = "123"; //password to db
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,username,password);
		
		String filter = request.getParameter("filter");
		System.out.println(filter);
		if(filter == null)
		{
			filter = "D"; 
		}
		System.out.println("--> "+filter);
		
		int i=0;		
		String query;
	    PreparedStatement ps;
	    ResultSet rs,rs1;
			    
	    /*
	    	1. Look at all the submitted assignments.
	    	2. Change their status.
	    */
	    
	    query = String.format("SELECT assignmentID FROM assignments WHERE subject = \"%s\" AND status = \"Ongoing\"",Test.subject);
	    System.out.println(query);
	    ps =conn.prepareStatement(query);
		rs = ps.executeQuery(query);
		while(rs.next())
		{
			Test.assignmentID[i++]=rs.getString("assignmentID");
			Test.subjectAssignmentCount++;
			//System.out.println(Test.assignmentID[i-1]);
		}
		int ji=0;
	    for(int k=0;k<i;k++)
	    {
		    query = String.format("SELECT username,name FROM studentAssignment WHERE %s = \"%s\"",Test.assignmentID[k],filter);
		    System.out.println(">"+query);
		    ps =conn.prepareStatement(query);
			rs1 = ps.executeQuery(query);
			while(rs1.next())
			{
				Test.names[ji]=rs1.getString("name");
				Test.unames[ji]=rs1.getString("username");
				Test.assignmentIDs[ji]=Test.assignmentID[k];
				//System.out.println("-->"+Test.names[ji]+" "+Test.unames[ji]+" "+Test.assignmentID[k]);
				ji++;
				Test.a++;				
			}
	    }
		ps.close();
		conn.close();
		//System.out.println("---->"+ji);
	%>
	
<form action = "tempTeacherAssignments.jsp" method="post">	
	<table>
		<tr>
			<th>Sr.No.</th>
			<th>Student Name</th>
			<th>Assignment ID</th>
			<th>Input</th>
		</tr>
		
	<%
		for (int j =0; j < ji ; j++)
		{
	%>
		<tr>
			<td align="center"> <%=j+1%></td>
			<td align="center"> <%=Test.names[j]%></td>
			<td align="center"> <%=Test.assignmentIDs[j]%></td>
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