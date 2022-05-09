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
			<form method="post" action="LogoutVerification.jsp">
				<input type="submit" value="Logout">
			</form>
			<form method="post" action="HomePage.jsp">
				<input type="submit" value="Home">
			</form>
		</div>
	
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
		
		<div>
			<h1>Comment Section | Customer Service</h1>
			<%
				String msgErr = (String) session.getAttribute("createCommentError");
				if(msgErr == "Error"){
			%>
					<p>Please try again</p>
			<%
				session.removeAttribute("createCommentError");
				}
			%>
		</div>
		<div>
			<form method="post" action="CustomerQuestionAndReply.jsp">
				<input type="text" name="name" placeholder="Name:">
				<br>
				<input type="text" name="title" placeholder="Title:">
				<br>
				<input type="text" name="commentDescription" placeholder="Comment Description:">
				<br>
				<input type="submit" value="Submit">
			</form>
		</div>
		
		
	</body>
</html>