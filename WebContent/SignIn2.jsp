<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "aA.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
</head>
<body>
	<center>
      <h1>|Sign In|</h1>
    </center>
    <%@ page import = "java.sql.*" %>  
    
	<% 	    
	    String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/Mini"; //test is the db name. 3306 is the default port
		String username = "root"; //username to db
		String password = "123"; //password to db
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,username,password);
	    
		String uname= request.getParameter("username"); 
	    String pass= request.getParameter("password");
	    Test.userName=uname;
	    
	    
	  try{
	    String query = String.format("select username,password from registrations where username = \"%s\";",uname);
	    System.out.println(query);
		PreparedStatement ps =conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery(query);
		String pa="",un="";
		if(rs.next())
		{	
			pa = rs.getString("password");
			un = rs.getString("username");
		}
		System.out.println("DB : "+un+" "+pa);
		System.out.println("USER : "+uname+" "+pass);
		
		if(pass.equals(pa) && uname.equals(un))
		{
			System.out.println("Sign In successful");
			%>
				<jsp:forward page="StudentWelcome.jsp"/>
			<% 
		}
		else
		{
			System.out.println("Credentials dont match.");
        	
		%> 
			Credentials don't match. Please try again.
			<jsp:include page="SignIn1.jsp"/> 
			
		<% }
		
		rs.close();
		ps.close();
		conn.close();
	  }
	  catch(SQLException e)
	  {
		  System.out.println("Some Error");
	  }
	%>
     
</body>
</html>