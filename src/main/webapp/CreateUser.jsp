<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, packageforDatabase.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Creating User</title>
	</head>
	
	<body>
		
		<%
		try{
			
			
			String redirectLink = "LoginPage.jsp";
			 
			
			//Database Connection
			DB_Connection db = new DB_Connection();	
			Connection con = db.getConnection();
			
			
			//Create SQL statement
			Statement stmt = con.createStatement();
			
			
			String fName = request.getParameter("fName");
			String lName = request.getParameter("lName");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String phoneNumber = request.getParameter("phoneNumber");
			
			if(fName != null && fName != "" && lName != null && lName != "" && username != null && username != "" && password != null && password != "" && email != null && email != "" && address != null && address != "" && phoneNumber != null && phoneNumber != ""){
				
				PreparedStatement createUser = con.prepareStatement("INSERT INTO Member values (NULL, ?, ?, ?, ?, ?, ?, NULL, ?, NULL, NULL)");
				createUser.setString(1, fName);
				createUser.setString(2, lName);
				createUser.setString(3, username);
				createUser.setString(4, password);
				createUser.setString(5, email);
				createUser.setString(6, address);
				createUser.setString(7, phoneNumber);
				createUser.executeUpdate();
				
				db.closeConnection(con);
				stmt.close();
				con.close();
				
				response.sendRedirect(redirectLink);
			}else{
				session.setAttribute("createUserError", "Error");
				response.sendRedirect(redirectLink);
			}
			
			
			
		}
		catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
		}
		
		
		%>
	</body>
</html>