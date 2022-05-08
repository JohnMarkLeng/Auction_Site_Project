<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*, java.util.*, java.sql.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, packageforDatabase.*"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Creating Listing</title>
	</head>
	
	
	<body>
	
		<%
		
		try{
			
			String redirectLink = "ListingInfoPage.jsp";
			 
			
			String title = request.getParameter("title");
			String itemDescription = request.getParameter("itemDescription");
			String strStartPrice = request.getParameter("startPrice");
			String strMinimumPrice = request.getParameter("minimumPrice");
			String strBidIncrement = request.getParameter("bidIncrement");
			String strStartDate = request.getParameter("startDate");
			String strEndDate = request.getParameter("endDate");
			long member_ID = (long) session.getAttribute("member_ID");
			
			if(title != null && title != "" && itemDescription != null && itemDescription != "" && strStartPrice != null && strStartPrice != "" && strMinimumPrice != null && strMinimumPrice != "" && strBidIncrement != null && strBidIncrement != "" && strStartDate != null && strStartDate != "" && strEndDate != null && strEndDate != ""){
				
				float startPrice = Float.parseFloat(strStartPrice);
				float minimumPrice = Float.parseFloat(strMinimumPrice);
				float bidIncrement = Float.parseFloat(strBidIncrement);
				
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
				LocalDateTime startDate = LocalDateTime.parse(strStartDate, formatter);
				LocalDateTime endDate = LocalDateTime.parse(strEndDate, formatter);
				
				//Database Connection
				DB_Connection db = new DB_Connection();	
				Connection con = db.getConnection();
				
				//Create SQL statement
				Statement stmt = con.createStatement();
				
				
				PreparedStatement CreateListing = con.prepareStatement("INSERT INTO Item values(NULL, ?, ?, ?, ?, ?, ?, ?, NULL, ?)");
				
				CreateListing.setFloat(1, minimumPrice);
				CreateListing.setString(2, title);
				CreateListing.setString(3, itemDescription);
				CreateListing.setFloat(4, startPrice);
				CreateListing.setObject(5, startDate);
				CreateListing.setObject(6, endDate);
				CreateListing.setFloat(7, bidIncrement);
				CreateListing.setLong(8, member_ID);
				CreateListing.executeUpdate();
				
				db.closeConnection(con);
				stmt.close();
				con.close();
				
				redirectLink = "HomePage.jsp";
				response.sendRedirect(redirectLink);
			
			}else{
				session.setAttribute("createListingError", "Error");
				response.sendRedirect(redirectLink);
			}
			
			
		}catch (Exception e) {
			
			out.print(e);
			out.print("Listing Creation Failed");
			
		}
		
		
		%>
	
	
	
	</body>
</html>