
<%@page import="java.sql.*" %>
<%@page import="com.himani.connectdb.*" %>
<%@page import="com.himani.service.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>View Delivered Bookings</h1>

        <table>
            <tr>
                <th>Id</th>
                <th>UserId</th>
                <th>StationId</th>
                <th>Deliveryperson Id</th>
                <th>Fuel Type</th>
                <th>Quantity</th>
                <th>Total Bill</th>
                <th>Status</th>
                <th>Delivery Code</th>
          
            </tr>
            <% 
            try {
                // Establish database connection
                Connection con = ConnectDB.dbCon();
                
                // Query to fetch delivered bookings
                PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE status=? and uid=?");
                ps.setString(1, "Delivered");
                ps.setInt(2,User.getUid());
                ResultSet rs = ps.executeQuery();
                
                // Iterate through results and display in table rows
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("bid") %></td>
                <td><%= rs.getString("uid") %></td>
                <td><%= rs.getString("fid") %></td>
                <td><%= rs.getString("dpid") %></td>
                <td><%= rs.getString("fueltype") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getDouble("totalbill") %></td>
                <td><%= rs.getString("status") %></td>
                 <td><%= rs.getString("dcode") %></td>
               
            </tr>
            <% 
                }
                
             
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </table>
</div>
       
    </div>
</body>
</html>
