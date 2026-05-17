<%@page import="java.sql.*" %>
<%@page import="com.himani.connectdb.*" %>
<%@page import="com.himani.service.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>View Pending Booking</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="container mx-auto mt-12 p-6 bg-white rounded-lg shadow-md">
  <h1 class="text-center text-2xl font-bold mb-4 text-gray-700">View Pending Booking</h1>
  <div class="overflow-x-auto">
    <table class="min-w-full bg-white border border-gray-200">
      <thead class="bg-gray-200">
        <tr>
            <th class="px-4 py-2 border">Id</th>
            <th class="px-4 py-2 border">UserId</th>
            <th class="px-4 py-2 border">StationId</th>
            <th class="px-4 py-2 border">Deliveryperson Id</th>
            <th class="px-4 py-2 border">Fuel Type</th>
            <th class="px-4 py-2 border">Quantity</th>
            <th class="px-4 py-2 border">Status</th>
            <th class="px-4 py-2 border">Actions</th>
        </tr>
      </thead>
      <tbody>
        <%
        try {
            Connection con = ConnectDB.dbCon();
            PreparedStatement ps = con.prepareStatement("select * from bookings where status=? and uid=?");
            ps.setString(1, "Pending");
            ps.setInt(2, User.getUid());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <tr class="hover:bg-gray-100">
            <td class="px-4 py-2 border"><%= rs.getInt(1) %></td>
            <td class="px-4 py-2 border"><%= rs.getString(2) %></td>
            <td class="px-4 py-2 border"><%= rs.getString(3) %></td>
            <td class="px-4 py-2 border"><%= rs.getString(4) %></td>
            <td class="px-4 py-2 border"><%= rs.getString(5) %></td>
            <td class="px-4 py-2 border"><%= rs.getString(6) %></td>
            <td class="px-4 py-2 border"><%= rs.getString(7) %></td>
            <td class="px-4 py-2 border space-y-2">
                <form action="ManageBooking" method="post" class="space-y-2">
                    <input type="hidden" name="bid" value="<%= rs.getInt(1) %>">
                    <input type="hidden" name="action" value="assign">
                    <input type="text" name="dpid" placeholder="Deliveryperson ID" class="block w-full px-2 py-1 border rounded-md">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-4 rounded">Assign</button>
                </form>
                <form action="ManageBooking" method="post">
                    <input type="hidden" name="bid" value="<%= rs.getInt(1) %>">
                    <input type="hidden" name="action" value="reject">
                    <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-4 rounded">Reject</button>
                </form>
            </td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>

