package com.himani.service;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.himani.connectdb.ConnectDB;

/**
 * Servlet implementation class FuelStation_register
 */
public class FuelStation_register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuelStation_register() {
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
			int fno=0;
			String fname = request.getParameter("fname");
			String fcontact = request.getParameter("fcontact");
			String femail = request.getParameter("femail");
			String fpassword = request.getParameter("fpassword");
			String fcity = request.getParameter("fcity");
			String faddress = request.getParameter("faddress");
			String farea = request.getParameter("farea");
			String fpincode = request.getParameter("fpincode");
			String fpetrolqty = request.getParameter("fpetrolqty");
			String fpetrolrate = request.getParameter("fpetrolrate");
			String fdiselqty = request.getParameter("fdiselqty");
			String fdiselrate = request.getParameter("fdiselrate");
			String fopentime = request.getParameter("fopentime");
			String fclosetime = request.getParameter("fclosetime");
			String fstatus = "Pending";
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("insert into fuelstation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, fno);
			ps.setString(2, fname);
			ps.setString(3, fcontact);
			ps.setString(4, femail);
			ps.setString(5, fpassword);
			ps.setString(6, fcity);
			ps.setString(7, faddress);
			ps.setString(8, farea);
			ps.setString(9, fpincode);
			ps.setString(10, fpetrolqty);
			ps.setString(11, fpetrolrate);
			ps.setString(12, fdiselqty);
			ps.setString(13, fdiselrate);
			ps.setString(14, fopentime);
			ps.setString(15, fclosetime);
			ps.setString(16, fstatus);
			int i = ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("fuelstation_dashboard.html");
			}
			else
			{
				response.sendRedirect("error.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}

}

