package com.himani.service;
//package com.himani.service;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.util.Random;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.himani.connectdb.ConnectDB;
//
//public class Book_fuel extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    public Book_fuel() {
//        super();
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String uidParam = request.getParameter("uid");
//        String stationidParam = request.getParameter("fid");
//        String fueltype = request.getParameter("fueltype");
//        String quantityParam = request.getParameter("quantity");
//        String totalBillParam = request.getParameter("totalBill");
//
//        if (uidParam == null || stationidParam == null || fueltype == null || quantityParam == null || totalBillParam == null) {
//            response.getWriter().println("Error: Missing required parameters.");
//            return;
//        }
//
//        try {
//            int uid = Integer.parseInt(uidParam);
//            int fid = Integer.parseInt(stationidParam);
//            int quantity = Integer.parseInt(quantityParam);
//            double totalBill = Double.parseDouble(totalBillParam);
//
//            String dcode = generatedcode();
//
//            try (Connection con = ConnectDB.dbCon()) {
//                if (con == null) {
//                    response.getWriter().println("Error: Database connection failed.");
//                    return;
//                }
//
//                String query = "INSERT INTO bookings (uid, fid, fueltype, quantity, totalBill, status, dcode) VALUES (?, ?, ?, ?, ?, ?, ?)";
//                try (PreparedStatement ps = con.prepareStatement(query)) {
//                    ps.setInt(1, uid);
//                    ps.setInt(2, fid);
//                    ps.setString(3, fueltype);
//                    ps.setInt(4, quantity);
//                    ps.setDouble(5, totalBill);
//                    ps.setString(6, "pending");
//                    ps.setString(7, dcode);
//
//                    int rowsInserted = ps.executeUpdate();
//                    if (rowsInserted > 0) {
//                        response.getWriter().println("Booking created successfully with delivery code: " + dcode);
//                    }
//                }
//            }
//        } catch (NumberFormatException e) {
//            response.getWriter().println("Error: Invalid number format in parameters.");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            response.getWriter().println("Error: Database operation failed.");
//            e.printStackTrace();
//        }
//    }
//
//    private String generatedcode() {
//        Random random = new Random();
//        int code = random.nextInt(999999);
//        return String.format("%06d", code);
//    }
//}

