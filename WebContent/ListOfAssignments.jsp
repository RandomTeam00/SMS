<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List of Assignments</title>
</head>
<body>
	<center><h3><b>Recent Assignments</b></h3></center>
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
	    
	    query = "SELECT subject,title FROM assignments";
	    ps = conn.prepareStatement(query);
		rs = ps.executeQuery(query);
		
		int i=0;
		String Subjects[]=new String[10];//TODO use count
		String Titles[]=new String[10];
		while(rs.next())
		{
			Subjects[i] = rs.getString("subject");
			Titles[i] = rs.getString("title");
			i++;
		}
	 %> 
	 
	 <table>
<tr>
<th>Sr.No.</th>
<th>Subject</th>
<th>Title</th>
</tr>
	<%
		for (int j =0; j < i ; j++)
		{
	
	%>
		<tr>
		<td> <%=j+1%></td>
		<td> <%=Subjects[j]%></td>
		<td><%=Titles[j]%> </td>
		</tr>
		
	<%       
		}
	%>

</table>
</body>
</html>