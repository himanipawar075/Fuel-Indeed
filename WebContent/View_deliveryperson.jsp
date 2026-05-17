<%@page import="java.sql.*" %>
<%@page import="com.himani.connectdb.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<style>
  body {
    background-color: #f0f0f0;
  }
  .container {
    margin-top: 50px;
  }
  table {
    background: white;
  }
</style>
</head>
<body class="bg-gray-100">
<div class="container mx-auto mt-12">
  <h1 class="text-2xl font-bold mb-6 text-center text-gray-700">User Details</h1>
  <table class="table-auto w-full bg-white shadow-md rounded-lg">
    <thead>
      <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
        <th class="py-3 px-6 text-left">Fuel Station ID</th>
        <th class="py-3 px-6 text-left">Name</th>
        <th class="py-3 px-6 text-left">Contact</th>
        <th class="py-3 px-6 text-left">Email</th>
        <th class="py-3 px-6 text-left">City</th>
        <th class="py-3 px-6 text-left">Address</th>
        <th class="py-3 px-6 text-left">Pincode</th>
        <th class="py-3 px-6 text-left">Action</th>
      </tr>
    </thead>
    <tbody class="text-gray-600 text-sm font-light">
      <%
      try {
        Connection con = ConnectDB.dbCon();
        PreparedStatement ps = con.prepareStatement("select * from deliveryperson");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
      %>
      <tr class="border-b border-gray-200 hover:bg-gray-100">
        <td class="py-3 px-6 text-left whitespace-nowrap"><%=rs.getInt(2) %></td>
        <td class="py-3 px-6 text-left"><%=rs.getString(3)%></td>
        <td class="py-3 px-6 text-left"><%=rs.getString(4)%></td>
        <td class="py-3 px-6 text-left"><%=rs.getString(5)%></td>
        <td class="py-3 px-6 text-left"><%=rs.getString(6)%></td>
        <td class="py-3 px-6 text-left"><%=rs.getString(7)%></td>
        <td class="py-3 px-6 text-left"><%=rs.getString(8)%></td>
        <td class="py-3 px-6 text-left">
          <a href="View_deliveryperson.jsp?dpid=<%=rs.getInt(1)%>" class="text-red-500 hover:text-red-700">Delete</a>
        </td>
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

<%
try {
  String dpid = request.getParameter("dpid");
  if (dpid != null) {
    Connection con = ConnectDB.dbCon();
    PreparedStatement ps = con.prepareStatement("delete from deliveryperson where dpid=?");
    ps.setString(1, dpid);
    int i = ps.executeUpdate();
    if (i > 0) {
      response.sendRedirect("fuelstation_dashboard.html");
    } else {
      System.out.println("Error in deletion");
    }
  }
} catch(Exception e) {
  e.printStackTrace();
}
%>
</body>
</html>

