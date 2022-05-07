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
		
		<div>
			<h1>Create an Account</h1>
			<%
				String errorMsg = (String) session.getAttribute("createUserError");
				if(errorMsg == "Error"){
			%>
					<p>Please try again</p>
			<%
				session.removeAttribute("createUserError");
				}
			%>
		</div>
		<div>
			<form method="post" action="CreateUser.jsp">

				<input type="text" name="fName" placeholder="First Name:">
				<br>
				<input type="text" name="lName" placeholder="Last Name:">
				<br>
				<input type="text" name="username" placeholder="Username:">
				<br>
				<input type="text" name="password" placeholder="Password:">
				<br>
				<input type="email" name="email" placeholder="Email:">
				<br>
				<input type="text" name="address" placeholder="Address:">
				<br>
				<input type="text" name="phoneNumber" placeholder="Phone Number:">
				<br>
				<input type="submit" value="Submit">
			</form>
		</div>
		
	
	</body>
</html>