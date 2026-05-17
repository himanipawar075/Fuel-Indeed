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
 * Servlet implementation class User_login
 */
public class User_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_login() {
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
			int uid=0;
			User.setUid(uid);
			String uemail = request.getParameter("uemail");
			String upassword = request.getParameter("upassword");
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("select * from user where uemail=? and upassword=?");
			ps.setString(1, uemail);
			ps.setString(2, upassword);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				
				response.sendRedirect("user_dashboard.html");
			}
			else
			{
				response.sendRedirect("user_register.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}

