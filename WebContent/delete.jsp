<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DeletePage</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "redhat");
		//PreparedStatement ps = con.prepareStatement("delete from register where id=?");
		PreparedStatement ps = con.prepareStatement("update register set status = 0 where id=?");
		ps.setInt(1, id);
		int i = ps.executeUpdate();
		if(i== 0){
			out.print("can't deleted");
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("userinfo.jsp");
			rd.forward(request, response);
		}
	%>
</body>
</html>