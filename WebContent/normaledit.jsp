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
<title>Updation Page</title>
</head>
<body bgcolor="gray">
	<center>
		<h1>Updation Page</h1>
		<hr>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "redhat");
			PreparedStatement ps = con.prepareStatement("select * from register where id=?");
			ps.setString(1, request.getParameter("id"));
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
		%>

		<form action="edit" method="post">
			<table align="center" cellpadding="2" width="40%" height="100%">

				<tr>
					<td>Id</td>
					<td><input type="text" name="id"
						value="<%=rs.getString(1)%>"></td>
				</tr>
				<tr>
					<td>First Name</td>
					<td><input type="text" name="fname"
						value="<%=rs.getString(2)%>"></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="lname"
						value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email"
						value="<%=rs.getString(4)%>"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pass"
						value="<%=rs.getString(5)%>"></td>
				</tr>
				<tr>
					<td>DOB</td>
					<td><input type="date" name="dob" value="<%=rs.getString(6)%>"></td>
				</tr>
				<tr>
					<td>Mobile</td>
					<td><input type="text" name="mobile"
						value="<%=rs.getString(7)%>"></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="radio" name="x" value="male" />Male <input
						type="radio" name="x" value="female" />Female</td>
				</tr>
				<tr>
					<td align="center" colspan="3"><input type="submit"
						value="UPDATE"></td>
				</tr>
			</table>
			</form>
			<hr>
			<% 
	}
			%>
		
	</center>
</body>
</html>