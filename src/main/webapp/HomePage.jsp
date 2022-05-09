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
		
		
		<br>
		<br>
		<div>
			<form method="post" action="searchFunction.jsp">
				<input type="text" value="Title">
				<input type="submit" value="Search">
			</form>
			
		</div>
		
		<div>
		
			<%
				long item_ID = -100;
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
					item_ID = result.getLong("item_ID");
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
						
						<form method="post" action="BidPage.jsp">
						
							<input type="hidden" name="title" value="<%= title%>"> 
							<input type="hidden" name="description" value="<%= description%>"> 
							<input type="hidden" name="startPrice" value="<%= startPrice%>"> 
							<input type="hidden" name="highestCurrBid" value="<%= highestCurrBid%>"> 
							<input type="hidden" name="startDate" value="<%= startDate%>"> 
							<input type="hidden" name="endDate" value="<%= endDate%>"> 
							<input type="hidden" name="item_ID" value="<%= item_ID%>"> 
							
	
							<input type="submit" value="Bid">
						</form>
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