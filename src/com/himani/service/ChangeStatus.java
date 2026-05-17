package com.himani.service;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.himani.connectdb.ConnectDB;

/**
 * Servlet implementation class ChangeStatus
 */
public class ChangeStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatus() {
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
		 int enteredCode = Integer.parseInt(request.getParameter("dcode"));
		   String bid=request.getParameter("bid");
		
		 try {
			
	            Connection con =ConnectDB.dbCon();
	            // Retrieve the correct delivery code from the database
	            PreparedStatement ps = con.prepareStatement("SELECT dcode FROM bookings WHERE bid=?");
	            ps.setInt(1,Integer.parseInt(bid));
	            ResultSet rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                int correctCode = rs.getInt("dcode");

	                // Check if the entered code matches the correct code
	                if (enteredCode == correctCode) {
	                    // Update the status to "delivered"
	                    ps = con.prepareStatement("UPDATE bookings SET status=? WHERE bid=?");
	                    ps.setString(1,"delivered");
	                    ps.setInt(2, Integer.parseInt(bid));
	                    int result = ps.executeUpdate();

	                    if (result > 0) 
	                    {
	                        response.sendRedirect("deliveryPerson_dashboard.html");
	                    } 
	                    else
	                    {
	                        response.getWriter().println("Failed to update booking status. Please try again.");
	                    }
	                } 
	                else 
	                {
	                    response.getWriter().println("Incorrect delivery code. Please try again.");
	                }
	            } 
	            else 
	            {
	                response.getWriter().println("Booking not found.");
	            }
	        } 
		 catch(Exception e){
			 e.printStackTrace();
		 }	
}
}


