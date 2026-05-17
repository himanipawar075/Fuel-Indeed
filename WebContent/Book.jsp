<%@page import="java.sql.*"%>
<%@page import="com.himani.service.*" %>
<%@page import="com.himani.connectdb.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Confirmation</title>
<!-- Tailwind CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 text-gray-900">
    <div class="container mx-auto p-4">
        <div class="bg-white rounded-lg shadow-md p-6">
            <%
            	//int bid=0;
                int fid = Integer.parseInt(request.getParameter("fid"));
                int uid = Integer.parseInt(request.getParameter("uid"));
                String fueltype = request.getParameter("fueltype");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String status = "Pending";
                int dcode = (int) (Math.random() * 9000 + 1000);
                String query = null;

                try {
                    Connection con = ConnectDB.dbCon();
                    if (fueltype.equals("Petrol")) {
                        query = "SELECT fpetrolrate FROM fuelstation WHERE fid = ?";
                    } else if (fueltype.equals("Disel")) {
                        query = "SELECT fdiselrate FROM fuelstation WHERE fid = ?";
                    }

                    PreparedStatement ps1 = con.prepareStatement(query);
                    ps1.setInt(1, fid);
                    ResultSet rs = ps1.executeQuery();
                    if (rs.next()) {
                        float rate = rs.getFloat(1);
                        float totalbill = rate * quantity;

                        PreparedStatement ps = con.prepareStatement("INSERT INTO bookings (uid, fid, fueltype, quantity, totalbill, status, dcode) VALUES (?, ?, ?, ?, ?, ?, ?)");
                        ps.setInt(1, uid);
                        ps.setInt(2, fid);
                        ps.setString(3, fueltype);
                        ps.setInt(4, quantity);
                        ps.setFloat(5, totalbill);
                        ps.setString(6, status);
                        ps.setDouble(7, dcode);
                        int result = ps.executeUpdate();
                        if (result > 0) {
            %>
            <p class="text-green-500">Booking successfully created! Your delivery code is <span class="font-bold"><%= dcode %></span> and your total bill is <span class="font-bold"><%= totalbill %> INR</span>.</p>
            <%
                        } else {
            %>
            <p class="text-red-500">Failed to create booking. Please try again.</p>
            <%
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            %>
            <p class="text-red-500">Exception occurred: <%= e.getMessage() %></p>
            <%
                }
            %>
            <a href="View_fuelStation.jsp" class="text-blue-500 hover:underline">Back to View Fuel Stations</a>
        </div>
    </div>
    
    <!--footer-->
    <script src="js/classie.js"></script>
    <script>
        var menuLeft = document.getElementById('cbp-spmenu-s1'),
            showLeftPush = document.getElementById('showLeftPush'),
            body = document.body;

        showLeftPush.onclick = function() {
            classie.toggle(this, 'active');
            classie.toggle(body, 'cbp-spmenu-push-toright');
            classie.toggle(menuLeft, 'cbp-spmenu-open');
            disableOther('showLeftPush');
        };

        function disableOther(button) {
            if (button !== 'showLeftPush') {
                classie.toggle(showLeftPush, 'disabled');
            }
        }
    </script>
</body>
</html>

