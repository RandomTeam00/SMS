<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
</head>
<body>
	<center>
      <h1>Confirmation Page</h1>
    </center>
    <%@ page import = "java.sql.*" %>  
    
	<% 	    
	    String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/Mini"; //test is the db name. 3306 is the default port
		String username = "root"; //username to db
		String password = "123"; //password to db
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,username,password);
	    String name= request.getParameter("name"); 
	    String email= request.getParameter("email"); 
	    String uname= request.getParameter("username"); 
	    String pass= request.getParameter("password"); 
	    
	    try{
	    String query = String.format("insert into registrations values (\"%s\",\"%s\",\"%s\",\"%s\")",name,email,uname,pass);
	    System.out.println(query);
		PreparedStatement ps =conn.prepareStatement(query);
		ps.execute();
		
		ps.close();
		conn.close();
	    }
	    catch (SQLException e)
	    {
	    	if(e.getErrorCode() == 1062) //Looks like mysql is throwing 1062 error code for duplicate primary key
	    		{
	 %>
	    	
	    		<br><br><a href="http://localhost:8080/Mini/SignUp1.jsp"><b>TRY AGAIN.</b></a> Username taken.<br><br>
	    	
	 <% 
	    		System.out.println("Duplicate primary key error");
	    		return;
	    		}
	    	else
	    		System.out.println("Some Error");
	    }
    %>
    
    Name entered : <%=request.getParameter("name")%><br>
    Email entered : <%=request.getParameter("email")%><br>
    Username entered : <%=request.getParameter("username")%><br>
    Password entered : <%=request.getParameter("password")%><br>
      
      <% 
      	System.out.println(name); 
       	System.out.println(email);
       	System.out.println(uname);
       	System.out.println(pass);
      %>
     
</body>
</html>