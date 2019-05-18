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
<title>Insert title here</title>
</head>
<body bgcolor="silver">
<div >
			<center>
				<h1 style="color: blue; background-color: gray;">All User infromation</h1>
				<hr>
					<table align="center" cellpadding="20" frame="border">
						<tr>
		
	<%
	String id = session.getId();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","redhat");
	PreparedStatement ps = con.prepareStatement("select * from register where sessionID=?");
	ps.setString(1, id);
	ResultSet rs= ps.executeQuery();
	if(rs.next())
	{
		//ps = con.prepareStatement("select * from register"); //admin
		ps = con.prepareStatement("select * from register where status = 1"); //normal user
		rs= ps.executeQuery();
		while(rs.next()) 
		{
	%>
				<tr>
				<td> <%= rs.getString(2) + " " + rs.getString(3) %></td>				
				<td> <%= rs.getString(4) %></td>
				<td> <%= rs.getString(6) %></td>
				<td> <%= rs.getString(7) %></td>
				<td> <%= rs.getString(8) %></td>
				<td> <a href = "normaledit.jsp?id=<%= rs.getString(1) %>">Edit</a></td>
				<td> <a href = "delete.jsp?id=<%= rs.getString(1) %>">Delete</a></td>
				</tr>
	<%
		}
		
	}
	else{
		response.sendRedirect("login.jsp");
	}
	
	%>
					</tr>
					</table>
					<hr>
					<a href="logout.jsp">Logout</a>
			</center>
		</div>
</body>
</html>