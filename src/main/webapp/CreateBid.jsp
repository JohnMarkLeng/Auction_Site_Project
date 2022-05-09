<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.sql.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, packageforDatabase.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	
	
	<body>
		<%
		
		try{
			
			String redirectLink = "BidPage.jsp";
			
			String strItem_ID = request.getParameter("item_ID");
			long member_ID = (long) session.getAttribute("member_ID");
			String strNewBid = request.getParameter("newBid");
			
			if (strNewBid == null || strNewBid == ""){
				session.setAttribute("createBidError", "Error");
				response.sendRedirect(redirectLink);
			}
			
			double newBid = Double.parseDouble(strNewBid);
			long item_ID = Long.parseLong(strItem_ID);
			
			
			//Database Connection
			DB_Connection db = new DB_Connection();	
			Connection con = db.getConnection();
			
			//Create SQL statement
			Statement stmt = con.createStatement();
			
			
			PreparedStatement checkMaxBid = con.prepareStatement("SELECT * FROM Auction WHERE item_ID = ? AND member_ID = ?");
			checkMaxBid.setLong(1, item_ID);
			checkMaxBid.setLong(2, member_ID);
			ResultSet result = checkMaxBid.executeQuery();
			
			double currentMaxBid = 0; 
			
			if(result.next()){
				currentMaxBid =  result.getDouble("currentBid"); 
			}
		
			
			if (newBid <= currentMaxBid || currentMaxBid == 0){
				
				result.close();
				db.closeConnection(con);
				stmt.close();
				con.close();
				
				session.setAttribute("createBidError", "Error");
				response.sendRedirect(redirectLink);
				
			}else{
				
				//Database Connection
				DB_Connection db1 = new DB_Connection();	
				Connection con1 = db1.getConnection();
				
				//Create SQL statement
				Statement stmt1 = con1.createStatement();
				
				
				PreparedStatement inputBid = con1.prepareStatement("INSERT INTO Auction values(?, ?, ?)");
				
				inputBid.setLong(1, item_ID);
				inputBid.setLong(2, member_ID);
				inputBid.setDouble(3, newBid);
				
				inputBid.executeUpdate();
				
				
				inputBid.close();
				db1.closeConnection(con);
				stmt1.close();
				con1.close();
				
				
			}
			
			
			result.close();
			
			db.closeConnection(con);
			stmt.close();
			con.close();
			
			
		}catch (Exception e) {
			
			out.print(e);
			out.print("Bidding Failed");
			
		}
		
		%>
	</body>
</html>