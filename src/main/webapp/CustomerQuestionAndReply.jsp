<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, packageforDatabase.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customer Rep</title>
	</head>
	
	<body>
		<%
		try{
			
			
			String redirectLink = "HomePage.jsp";
			
			
			String name = request.getParameter("name");
			String title = request.getParameter("title");
			String commentDescription = request.getParameter("commentDescription");

			
			if(name != null && name != "" && title != null && title != "" && commentDescription != null && commentDescription != ""){
				
				//Database Connection
				DB_Connection db = new DB_Connection();	
				Connection con = db.getConnection();
				
				
				//Create SQL statement
				Statement stmt = con.createStatement();
				
				PreparedStatement createComment = con.prepareStatement("INSERT INTO CommentSection values (NULL, ?, ?, ?)");
				createComment.setString(1, name);
				createComment.setString(2, title);
				createComment.setString(3, commentDescription);
				createComment.executeUpdate();
				
				db.closeConnection(con);
				stmt.close();
				con.close();
				
				response.sendRedirect(redirectLink);
			}else{
				session.setAttribute("createCommentError", "Error");
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