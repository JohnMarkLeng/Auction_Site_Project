<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	
	
		<div>
			<h1>Delete an Account</h1>
			<%
				String msgError = (String) session.getAttribute("deleteUserError");
				if(msgError == "Error"){
			%>
					<p>Please try again</p>
			<%
				session.removeAttribute("deleteUserError");
				}
			%>
		</div>
		<div>
			<form method="post" action="DeleteUser.jsp">
				<input type="text" name="username" placeholder="Username:">
				<input type="submit" value="Submit">
			</form>
		</div>
		
		
	</body>
</html>