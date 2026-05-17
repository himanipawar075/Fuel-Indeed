package com.himani.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.himani.connectdb.ConnectDB;

/**
 * Servlet implementation class Upadte_fuel_rate
 */
public class Update_fuel_rate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_fuel_rate() {
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
					String femail = Station.getFemail();
					String fpetrolrate =request.getParameter("fpetrolrate");
					String fdiselrate =request.getParameter("fdiselrate");
					System.out.println(femail);
					System.out.println(fpetrolrate);
					System.out.println(fdiselrate);
					
					Connection con = ConnectDB.dbCon();
					PreparedStatement ps = con.prepareStatement("update fuelstation set fpetrolrate=?, fdiselrate=? where femail =?");
					ps.setInt(1, Integer.parseInt(fpetrolrate));
					ps.setInt(2, Integer.parseInt(fdiselrate));
					ps.setString(3, femail);
					int rs =ps.executeUpdate();
			if(rs>0)
			{
				response.sendRedirect("View_fuelStation.jsp");
			}
			else
			{
				response.sendRedirect("error.html");
			}
		}
		catch(Exception e)
		{
			
		}
	}

}
