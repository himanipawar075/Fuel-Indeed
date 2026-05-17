<%@page import="java.sql.*" %>
<%@page import="com.himani.connectdb.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Information</title>
<!-- Tailwind CSS -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="container mx-auto mt-8">
  <h1 class="text-center text-3xl font-semibold mb-8 text-gray-800">User Information</h1>
  <table class="min-w-full border-collapse border border-gray-300">
    <thead class="bg-gray-200">
      <tr>
        <th class="border px-4 py-2">UID</th>
        <th class="border px-4 py-2">Name</th>
        <th class="border px-4 py-2">City</th>
        <th class="border px-4 py-2">Contact</th>
        <th class="border px-4 py-2">Address</th>
        <th class="border px-4 py-2">Pincode</th>
        <th class="border px-4 py-2">Email</th>
      </tr>
    </thead>
    <tbody>
      <% 
      try {
        Connection con = ConnectDB.dbCon();
        PreparedStatement ps = con.prepareStatement("select * from user");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
      %>
          <tr>
            <td class="border px-4 py-2"><%=rs.getInt(1)%></td>
            <td class="border px-4 py-2"><%=rs.getString(2)%></td>
            <td class="border px-4 py-2"><%=rs.getString(3)%></td>
            <td class="border px-4 py-2"><%=rs.getString(4)%></td>
            <td class="border px-4 py-2"><%=rs.getString(5)%></td>
            <td class="border px-4 py-2"><%=rs.getString(6)%></td>
            <td class="border px-4 py-2"><%=rs.getString(7)%></td>
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
