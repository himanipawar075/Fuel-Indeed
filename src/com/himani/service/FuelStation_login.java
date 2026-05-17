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
 * Servlet implementation class FuelStation_login
 */
public class FuelStation_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuelStation_login() {
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
		
		try
		{
			
			 String femail = request.getParameter("femail");
			 System.out.print("login failed "+femail);
			 Station.setFemail(femail);
			 String password = request.getParameter("fpassword");
			 System.out.print("login failed "+password);
				Connection con = ConnectDB.dbCon();
				PreparedStatement ps = con.prepareStatement("select * from fuelstation where femail=? and fpassword=?");
				ps.setString(1, femail);
				ps.setString(2, password);
				ResultSet rs = ps.executeQuery();
			if(rs.next())

			{
				
				response.sendRedirect("fuelstation_dashboard.html");
			}
			else
			{    System.out.print("login failed");
				response.sendRedirect("fuelStation_register.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

	
	
	

