<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login Page</title>
	</head>
	
	
	<body>
		<div> 
			<h1>Login Page</h1>
		</div>
		<div>
			<form method="post" action="LoginVerification.jsp">

				<input type="text" name="username" placeholder="Username:">
				<br>
				<input type="text" name="password" placeholder="Password:">
				<br>
				<input type="submit" value="Submit">
			</form>
		</div>
	
	</body>
</html>