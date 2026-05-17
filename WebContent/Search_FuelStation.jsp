<%@page import="java.sql.*" %>
<%@page import="com.himani.connectdb.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Reminder</title>
<!-- Tailwind CSS -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<nav class="bg-gray-800 text-white p-4">
  <div class="container mx-auto">
    <a class="text-white text-xl font-bold" href="#">Search_fuelStation</a>
  </div>
</nav>

<div class="container mx-auto mt-8">
  <h1 class="text-center mb-4 text-gray-700">Search Fuel Station</h1>
  <form action="Search_FuelStation.jsp" method="get" class="mb-5">
    <div class="flex space-x-4">
      <input type="text" name="fcity" class="form-input px-4 py-2 rounded-lg border-gray-300 focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50" placeholder="Enter your City">
      <input type="text" name="fpincode" class="form-input px-4 py-2 rounded-lg border-gray-300 focus:border-blue-500 focus:ring focus:ring-blue-200 focus:ring-opacity-50" placeholder="Enter your Pincode">
      <button type="submit" class="btn-custom px-6 py-2 rounded-lg bg-blue-500 text-white hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-50">Search</button>
    </div>
  </form>

  <h1 class="text-center mb-4 text-gray-700">Book Fuel</h1>
  <table class="table-auto w-full border-collapse border border-gray-300">
    <thead class="bg-gray-200">
      <tr>
        <th class="px-4 py-2">Name</th>
        <th class="px-4 py-2">Contact Number</th>
        <th class="px-4 py-2">Email</th>
        <th class="px-4 py-2">City</th>
        <th class="px-4 py-2">Address</th>
        <th class="px-4 py-2">Pincode</th>
        <th class="px-4 py-2">Petrol Quantity</th>
        <th class="px-4 py-2">Petrol Rate</th>
        <th class="px-4 py-2">Diesel Quantity</th>
        <th class="px-4 py-2">Diesel Rate</th>
        <th class="px-4 py-2">Status</th>
        <th class="px-4 py-2">Book</th>
      </tr>
    </thead>
    <tbody>
    <% 
    try {
        String fcity = request.getParameter("fcity");
        String fpincode = request.getParameter("fpincode");
        Connection con = ConnectDB.dbCon();
        PreparedStatement ps = con.prepareStatement("select * from fuelstation where (Fcity=? or fpincode=?) and fstatus=?");
        ps.setString(1,fcity);
        ps.setString(2,fpincode);
        ps.setString(3,"Approve");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
    %>
            <tr>
                <td class="px-4 py-2"><%=rs.getString(2)%></td>
                <td class="px-4 py-2"><%=rs.getString(3)%></td>
                <td class="px-4 py-2"><%=rs.getString(4)%></td>
                <td class="px-4 py-2"><%=rs.getString(6)%></td>
                <td class="px-4 py-2"><%=rs.getString(7)%></td>
                <td class="px-4 py-2"><%=rs.getString(9)%></td>
                <td class="px-4 py-2"><%=rs.getString(10)%></td>
                <td class="px-4 py-2"><%=rs.getString(11)%></td>
                <td class="px-4 py-2"><%=rs.getString(12)%></td>
                <td class="px-4 py-2"><%=rs.getString(13)%></td>
                <td class="px-4 py-2"><%=rs.getString(16)%></td>
                <td class="px-4 py-2"><a href="Book_fuelStation.jsp?fid=<%=rs.getInt(1)%>" class="btn-custom px-4 py-2 rounded-lg bg-blue-500 text-white hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-50">Book</a></td>
            </tr>
    <% 
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
    %>
    </tbody>
  </table>
</div>

<footer class="text-white text-center py-3 mt-5 bg-gray-800">
  <div class="container mx-auto">
    <p>&copy; 2024 Remind Me App. All rights reserved.</p>
  </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

