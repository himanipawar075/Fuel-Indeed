package com.himani.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.himani.connectdb.ConnectDB;

/**
 * Servlet implementation class ChangePassword_fuelStation
 */
public class ChangePassword_fuelStation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword_fuelStation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
		    String femail = request.getParameter("femail");
		    String fpassword = request.getParameter("fpassword");
		    String newPassword = request.getParameter("newPassword");
		    String confirmPassword = request.getParameter("confirmPassword");

		    // Debug statements
		    System.out.println("UEmail: " + femail);
		    System.out.println("Old Password: " + fpassword);
		    System.out.println("New Password: " + newPassword);
		    System.out.println("Confirm Password: " + confirmPassword);

		    if (fpassword == null || newPassword == null || confirmPassword == null) {
		        response.getWriter().write("Password fields cannot be null.");
		        return;
		    }

		    if (newPassword.equals(confirmPassword)) {
		        Connection con = ConnectDB.dbCon();
		        // Check if the user exists and the old password matches
		        PreparedStatement ps = con.prepareStatement("SELECT * FROM fuelstation WHERE femail=? AND fpassword=?");
		        ps.setString(1, femail);
		        ps.setString(2, fpassword);  // In a real application, hash this password before comparing it
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            // Update the password
		            ps = con.prepareStatement("UPDATE fuelstation SET fpassword=? WHERE femail=?");
		            ps.setString(1, newPassword);  // In a real application, hash this password before storing it
		            ps.setString(2, femail);
		            int rowsUpdated = ps.executeUpdate();

		            if (rowsUpdated > 0) {
		                response.getWriter().write("Password changed successfully.");
		            } else {
		                response.getWriter().write("Error changing password.");
		            }
		        } else {
		            response.getWriter().write("User not found or old password does not match.");
		        }
		    } else {
		        response.getWriter().write("New passwords do not match.");
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		    response.getWriter().write("Error: " + e.getMessage());
		}
	}
}

	
