<%@page import="java.sql.*"%>
<%@page import="java.sql.*" %>
<%@page import="com.himani.connectdb.*" %>
<%@page import="com.himani.service.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Fuel</title>
<!-- Tailwind CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 text-gray-900">
    <div class="container mx-auto p-4">
        <div class="bg-white rounded-lg shadow-md p-6">
            <h4 class="text-xl font-bold mb-4">Book Fuel:</h4>
            <div class="table-container">
                <form action="Book.jsp" method="post" class="space-y-4">
                    <%
                        int fid = 0;
                        String fidParam = request.getParameter("fid");
                        if (fidParam != null && !fidParam.trim().isEmpty()) {
                            fid = Integer.parseInt(fidParam);
                        }
                    %>
                    <input type="hidden" name="fid" value="<%=fid%>">
                    <input type="hidden" name="uid" value="<%=User.getUid()%>">
                    
                    <div>
                        <label for="fueltype" class="block text-sm font-medium text-gray-700">Select Fuel Type:</label>
                        <select id="fueltype" name="fueltype" required class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            <option value="Petrol">Petrol</option>
                            <option value="Disel">Disel</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="quantity" class="block text-sm font-medium text-gray-700">Quantity (in Litres):</label>
                        <input type="number" id="quantity" name="quantity" min="1" required class="mt-1 block w-full py-2 px-3 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                    </div>
                    
                    <div>
                        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Book</button>
                    </div>
                </form>
            </div>
            
            <a href="View_fuelStation.jsp" class="text-blue-500 hover:underline mt-4 block">Back to Fuel Stations</a>
        </div>
    </div>
</body>
</html>
