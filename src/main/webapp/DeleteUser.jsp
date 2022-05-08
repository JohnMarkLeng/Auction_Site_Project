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
			
			
			String redirectLink = "AdminPage.jsp";
			
			

			String username = request.getParameter("username");

			if(username != null && username != ""){
				
				//Database Connection
				DB_Connection db = new DB_Connection();	
				Connection con = db.getConnection();
				
				
				//Create SQL statement
				Statement stmt = con.createStatement();
				
				PreparedStatement deleteUser = con.prepareStatement("DELETE FROM Member WHERE userName= (?)");
				deleteUser.setString(1, username);
				deleteUser.executeUpdate();
				
				db.closeConnection(con);
				stmt.close();
				con.close();
				
				response.sendRedirect(redirectLink);
			}else{
				session.setAttribute("deleteUserError", "Error");
				response.sendRedirect(redirectLink);
			}
			
			
			
		}
		catch (Exception ex) {
		out.print(ex);
		out.print("delete failed");
		}
		
		
		%>
	</body>
</html>