package com.himani.service;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.himani.connectdb.ConnectDB;

/**
 * Servlet implementation class ChangePassword_deliveryPerson
 */
public class ChangePassword_deliveryPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword_deliveryPerson() {
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
		    String demail = request.getParameter("demail");
		    String dpassword = request.getParameter("dpassword");
		    String newPassword = request.getParameter("newPassword");
		    String confirmPassword = request.getParameter("confirmPassword");

		    // Debug statements
		    System.out.println("UEmail: " + demail);
		    System.out.println("Old Password: " + dpassword);
		    System.out.println("New Password: " + newPassword);
		    System.out.println("Confirm Password: " + confirmPassword);

		    if (dpassword == null || newPassword == null || confirmPassword == null) {
		        response.getWriter().write("Password fields cannot be null.");
		        return;
		    }

		    if (newPassword.equals(confirmPassword)) {
		        Connection con = ConnectDB.dbCon();
		        // Check if the user exists and the old password matches
		        PreparedStatement ps = con.prepareStatement("SELECT * FROM deliveryperson WHERE demail=? AND dpassword=?");
		        ps.setString(1, demail);
		        ps.setString(2, dpassword);  // In a real application, hash this password before comparing it
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            // Update the password
		            ps = con.prepareStatement("UPDATE deliveryperson SET dpassword=? WHERE demail=?");
		            ps.setString(1, newPassword);  // In a real application, hash this password before storing it
		            ps.setString(2, demail);
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

