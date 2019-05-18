<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserInfo</title>
</head>
<body bgcolor="gray">
	<%
		String id = session.getId();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "redhat");
		PreparedStatement ps = con.prepareStatement("select * from register where sessionID=?");
		ResultSet rs = ps.executeQuery();
		if (rs.next()) 
		{
			out.println("Welcome "+rs.getString(2)+" "+rs.getString(3));
			RequestDispatcher rd = request.getRequestDispatcher("userinfo.jsp");
			rd.forward(request, response);

		} 
		else 
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<a href="logout.jsp">Logout</a>
</body>
</html>