<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Assignment</title>
</head>
<body>
<object align = "right">	<a href = "SignOut.jsp">Sign Out</a> </object>
	<form action = "TeacherAssignments2.jsp" method="post">
		<pre>
			Assignment ID : <input type = "text" name = "assignmentID"/>
			Title : <input type = "text" name = "title"/>
			Start Date : <input type = "date" name = "startdate"/>
			Due Date(dd/mm/yyyy) : <input type = "date" name = "duedate"/>
			Description :<textarea rows="5" cols="80" name="description1"></textarea>
			Attachment : <input type = "file" name = "attachment">
			
			
			<input type="submit" value="Submit!"/>
		</pre>
	</form>

</body>
</html>