<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, packageforDatabase.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Verification Page</title>
	</head>
	
	
	<body>
	
		<%
		//Variable for database returns 
		String userNameDB = null;
		String userPasswordDB = null;
		String redirectLink = "LoginPage.jsp"; 
		
		//Variables for User input 
		String UserName = request.getParameter("username");
		String UserPassword = request.getParameter("password");
		
		String sqlQuery = "SELECT userName, userPassword FROM Member;";
		
		
		//Database Connection
		DB_Connection db = new DB_Connection();	
		Connection con = db.getConnection();
		
		//Create SQL statement
		Statement stmt = con.createStatement();
		
		
		ResultSet result = stmt.executeQuery(sqlQuery);
		
	
		
		if (UserName != null && UserName != "" && UserPassword != null && UserPassword != ""){
			while(result.next()){
				//Usernmae and password from database, line by line in "result"
				userNameDB = result.getString("userName");
				userPasswordDB = result.getString("userPassword");
				
				//check username and password given by user match with the database
				if(userNameDB.equals(UserName) && userPasswordDB.equals(UserPassword)){
					//I believe thise passes on information into the Session so it can be used later 
					session.setAttribute("username", UserName);
					
					//Distinguish admin vs common user
					if(UserName.equals("Admin") && UserPassword.equals("AdminPass")){
						session.setAttribute("userType", "admin");
					}else{
						session.setAttribute("userType", "commonUser");
					}
					redirectLink = "HomePage.jsp";
					break;
				}
			}
			
			response.sendRedirect(redirectLink);
			
			
		}else{
			response.sendRedirect(redirectLink);
		}

		
		
		db.closeConnection(con);
		con.close();
		result.close();
		stmt.close();
		
		%>
		
		
	
	
	
	
	
	</body>
</html>