<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "aA.Test" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Tutorial | HelloWorld</title>
</head>
<body>
<h3> HelloWorld </h3>

The time on the server is <%= new java.util.Date() %>
<br>
<br>
<% Test.yo(); System.out.println("\tHW1"); Test.incA();%>
<!-- <form action = "HelloWorld2.jsp" method="post">
	<select name="<%="ff"+3 %>">
		<option value = "nsub">Not Submitted</option>
		<option value = "sub">Submitted</option>
	</select>
	
	<input type="submit" value="Submit"/>
	</form>
-->
	<select onchange="yesnoCheck(this);">
    <option value="">Valitse automerkkisi</option>
    <option value="lada">Lada</option>
    <option value="mosse">Mosse</option>
    <option value="volga">Volga</option>
    <option value="vartburg">Vartburg</option>
    <option value="other">Muu</option>
    </select>

    <div id="ifYes" style="display: none;">
    <label for="car">Muu, mikä?</label> <input type="text" id="car" name="car" /><br />
	</div>
    <script>
    function yesnoCheck(that) {
        if (that.value == "other") {
            //alert("check");
            document.getElementById("ifYes").style.display = "block";
        } else {
            document.getElementById("ifYes").style.display = "none";
        }
    }
</script>
	



</body>
</html>