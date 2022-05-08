<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Create Auction</title>
	</head>
	
	<body>
		
		<div>
			<form method="post" action="HomePage.jsp">

				<input type="submit" value="Go Home">
			</form>
		</div>
		
		
		<%
			String errorMsg = (String) session.getAttribute("createListingError");
			if(errorMsg == "Error"){
		%>
				<p>Please Try Listing Again</p>
		<%
			session.removeAttribute("createListingError");
			}
		%>
		
		<div>
			<form method="post" action="CreateListing.jsp">

				<input type="text" name="title" placeholder="Title:">
				<br>
				<input type="text" name="itemDescription" placeholder="Description:">
				<br>
				<input type="number" step="0.01" name="startPrice" placeholder="Start Price:">
				<br>
				<input type="number" step="0.01" name="minimumPrice" placeholder="Minimum Sell Price:">
				<br>
				<input type="number" step="0.01" value="1" name="bidIncrement" placeholder="Bid Increment:">
				<br>
				<input type="datetime-local" step="60" name="startDate" placeholder="Start Date:">
				<br>
				<input type="datetime-local" step="60" name="endDate" placeholder="End Date:">
				<br>
	
				<input type="submit" value="Create Listing">
			</form>
		</div>
		
		
	</body>
</html>