<%@page import="java.sql.*" %>
<%@page import="com.himani.connectdb.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		try
		{
			String fid=request.getParameter("fid");
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("update fuelstation set fstatus=? where fid=?");
			ps.setString(1, "Approve");
			ps.setInt(2, Integer.parseInt(fid));
			int i = ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("ViewPending_fuelstation.jsp");
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
%>

</body>
</html>