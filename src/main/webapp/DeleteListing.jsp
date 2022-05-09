<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*, java.util.*, java.sql.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, packageforDatabase.*"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Admin | Delete Listing</title>
	</head>
	
	
	<body>
	
		<%
		
		try{
			
			String redirectLink = "ListingInfoPage.jsp";
			 
			
			String title = request.getParameter("title");
			
			if(title != null && title != ""){
				
				//Database Connection
				DB_Connection db = new DB_Connection();	
				Connection con = db.getConnection();
				
				//Create SQL statement
				Statement stmt = con.createStatement();
				
				
				PreparedStatement CreateListing = con.prepareStatement("DELETE FROM Item WHERE title= (?)");
				
				CreateListing.setString(1, title);
				CreateListing.executeUpdate();
				
				db.closeConnection(con);
				stmt.close();
				con.close();
				
				redirectLink = "HomePage.jsp";
				response.sendRedirect(redirectLink);
			
			}else{
				session.setAttribute("deleteListingError", "Error");
				response.sendRedirect(redirectLink);
			}
			
			
		}catch (Exception e) {
			
			out.print(e);
			out.print("Listing Creation Failed");
			
		}
		
		
		%>
	
	
	
	</body>
</html>