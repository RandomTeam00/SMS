<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Assignment</title>
</head>
<body>

	<form action = "TeacherAssignments2.jsp" method="post">
		<pre>
			Subject : <input type = "text" name = "subject"/>
			Title : <input type = "text" name = "title"/>
			Due Date(dd/mm/yyyy) : <input type = "date" name = "duedate"/>
			Description :<textarea rows="5" cols="80" name="description1"></textarea>
			Attachment : <input type = "file" name = "attachment">
			
			
			<input type="submit" value="Submit!"/>
		</pre>
	</form>

</body>
</html>