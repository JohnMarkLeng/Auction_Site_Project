<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--Import some libraries that have classes that we need -->
    <%@ page import="java.io.*, java.util.*, java.sql.*, java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, packageforDatabase.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home Page</title>
	</head>
	
	
	<body>
		<div>
			<form method="post" action="LogoutVerification.jsp">
				<input type="submit" value="Logout">
			</form>
		</div>
		
	
		<br>
		
		<form method="post" action="ListingInfoPage.jsp">

				<input type="submit" value="Create A Listing">
		</form>
		
		
		
		<div>
			<form method="post" action="searchFunction.jsp">
				<input type="text" value="Title">
				<br>
				<input type="submit" value="Search">
			</form>
			
		</div>
		
		<div>
		
			<%
				String title = null;
				String description = null;
				double startPrice = 0;
				double highestCurrBid = 0;
				LocalDateTime startDate = null;
				LocalDateTime endDate = null;
				
				
				
				//Database Connection
				DB_Connection db = new DB_Connection();	
				Connection con = db.getConnection();
				
				//Create SQL statement
				Statement stmt = con.createStatement();
				
				String searchQuery = "SELECT * FROM Item;";
				
				ResultSet result = stmt.executeQuery(searchQuery);   
			
				
				while(result.next()){
					title = result.getString("title");
					description = result.getString("itemDescription");
					startPrice = result.getDouble("startPrice");
					highestCurrBid = result.getDouble("currentHighestBid");
					startDate = result.getObject("startTime", LocalDateTime.class);
					endDate = result.getObject("endTime", LocalDateTime.class);
					
					%>
					
					<div>
						<h3>Title: <%= title%></h3>
						<h4>Description: <%= description %></h4>						
						<p>Starting Price: <%= startPrice %></p>
						<p>Highest Bid: <%= highestCurrBid %></p>
						<p>Start Date: <%= startDate %></p>
						<p>End Date: <%= endDate %></p>
						
						<br>
						<br>
						
					
					</div>
					
					
					
					<%
					
				}
				
				db.closeConnection(con);
				con.close();
				stmt.close();
				result.close();
			
			%>
		
		</div>
		
		
	
	</body>
</html>