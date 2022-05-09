<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.sql.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, packageforDatabase.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Bid Page</title>
	</head>
	
	<body>
			
		<%
		long member_ID = (long) session.getAttribute("member_ID");
		
		String strItem_ID = request.getParameter("item_ID");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String strStartPrice = request.getParameter("startPrice");
		String strHighestCurrBid = request.getParameter("highestCurrBid");
		String strStartDate = request.getParameter("startDate");
		String strEndDate = request.getParameter("endDate");
		
		
		
		long item_ID = Long.parseLong(strItem_ID);
		float startPrice = Float.parseFloat(strStartPrice);
		float highestCurrBid = Float.parseFloat(strHighestCurrBid);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime startDate = LocalDateTime.parse(strStartDate, formatter);
		LocalDateTime endDate = LocalDateTime.parse(strEndDate, formatter);
		
		%>
			
		<%
		String errorMsg = (String) session.getAttribute("createBidError");
			if(errorMsg == "Error"){
				session.removeAttribute("createBidError");
		%>
				<p>Please put in a value greater than the highest bid</p>
		<%
	
			}
		%>
			
		<div>
			<h3>Title: <%= title%></h3>
				<h4>Description: <%= description %></h4>						
				<p>Starting Price: <%= startPrice %></p>
				<p>Highest Bid: <%= highestCurrBid %></p>
				<p>Start Date: <%= startDate %></p>
				<p>End Date: <%= endDate %></p>
		</div>
		<%
		
		if (java.time.LocalDateTime.now().compareTo(endDate) < 0){
		
		%>
		
			<form method="post" action="CreateBid.jsp">
				
				<input type="number" step="0.01" name="newBid" placeholder="New Bid">
				<input type="hidden" type="number" name="item_ID" value="<%= item_ID%>"> 
				<input type="hidden" type="number" name="member_ID" value="<%= member_ID%>"> 
				<input type="submit" value="Place Bid">
				
			</form>
		
		<%
		
		}
		
		%>




	</body>
</html>