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

 <h1>My Bookings</h1>
    <table>
        <tr>
            <th>Id</th>
            <th>UserId</th>
            <th>StationId</th>
            <th>Deliveryperson Id</th>
            <th>Fuel Type</th>
            <th>Quantity</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
        try {
        	Connection con=ConnectDB.dbCon();
            PreparedStatement ps = con.prepareStatement("select * from  bookings where status=? and dpid=?");
            ps.setString(1,"assigned");
            ps.setInt(2,Fuel.getDpid());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(7) %></td>
            <td>
                <form action="ChangeStatus" method="post">
                    <input type="hidden" name="bid" value="<%= rs.getInt(1) %>">
                    <input type="text" name="dcode" class="delivery-code-input" placeholder="Enter Delivery Code" required>
                    <button type="submit">Mark as Delivered</button>
                </form>
            </td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
    </div>
</body>
</html>

</body>
</html>
