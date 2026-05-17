<%@page import="java.sql.*" %>
<%@page import="com.himani.connectdb.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pending Fuel Stations</title>
<!-- Tailwind CSS -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="container mx-auto mt-8">
  <h1 class="text-center text-3xl font-semibold mb-8 text-gray-800">Pending Fuel Stations</h1>
  <table class="min-w-full border-collapse border border-gray-300">
    <thead class="bg-gray-200">
      <tr>
        <th class="border px-4 py-2">Sr No</th>
        <th class="border px-4 py-2">Name</th>
        <th class="border px-4 py-2">Contact</th>
        <th class="border px-4 py-2">Email</th>
        <th class="border px-4 py-2">City</th>
        <th class="border px-4 py-2">Address</th>
        <th class="border px-4 py-2">Area</th>
        <th class="border px-4 py-2">Pincode</th>
        <th class="border px-4 py-2">Petrol Quantity</th>
        <th class="border px-4 py-2">Petrol Rate</th>
        <th class="border px-4 py-2">Diesel Quantity</th>
        <th class="border px-4 py-2">Diesel Rate</th>
        <th class="border px-4 py-2">Open Time</th>
        <th class="border px-4 py-2">Close Time</th>
        <th class="border px-4 py-2">Status</th>
        <th class="border px-4 py-2">Approve</th>
        <th class="border px-4 py-2">Disapprove</th>
      </tr>
    </thead>
    <tbody>
      <% 
      try {
        Connection con = ConnectDB.dbCon();
        PreparedStatement ps = con.prepareStatement("select * from fuelstation where fstatus=?");
        ps.setString(1, "Pending");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
      %>
          <tr>
            <td class="border px-4 py-2"><%=rs.getInt(1)%></td>
            <td class="border px-4 py-2"><%=rs.getString(2)%></td>
            <td class="border px-4 py-2"><%=rs.getString(3)%></td>
            <td class="border px-4 py-2"><%=rs.getString(4)%></td>
            <td class="border px-4 py-2"><%=rs.getString(6)%></td>
            <td class="border px-4 py-2"><%=rs.getString(7)%></td>
            <td class="border px-4 py-2"><%=rs.getString(8)%></td>
            <td class="border px-4 py-2"><%=rs.getString(9)%></td>
            <td class="border px-4 py-2"><%=rs.getFloat(10)%></td>
            <td class="border px-4 py-2"><%=rs.getFloat(11)%></td>
            <td class="border px-4 py-2"><%=rs.getFloat(12)%></td>
            <td class="border px-4 py-2"><%=rs.getFloat(13)%></td>
            <td class="border px-4 py-2"><%=rs.getString(14)%></td>
            <td class="border px-4 py-2"><%=rs.getString(15)%></td>
            <td class="border px-4 py-2"><%=rs.getString(16)%></td>
            <td class="border px-4 py-2"><a href="Approved_fuelStation.jsp?fid=<%=rs.getInt(1)%>" class="text-blue-500 hover:text-blue-700">Approve</a></td>
            <td class="border px-4 py-2"><a href="DisApproved_fuelStation.jsp?fid=<%=rs.getInt(1)%>" class="text-red-500 hover:text-red-700">Disapprove</a></td>
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
</body>
</html>

