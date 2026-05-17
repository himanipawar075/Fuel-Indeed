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
 * Servlet implementation class DeliveryPerson_login
 */
public class DeliveryPerson_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryPerson_login() {
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
			String demail = request.getParameter("demail");
			String dpassword = request.getParameter("dpassword");
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("select * from deliveryperson where demail=? and dpassword=?");
			ps.setString(1, demail);
			ps.setString(2, dpassword);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				
				response.sendRedirect("deliveryPerson_dashboard.html");
			}
			else
			{
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}

