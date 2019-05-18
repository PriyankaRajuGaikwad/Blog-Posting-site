<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body bgcolor="gray">
<center>
	<h1>Login Page</h1>
	<hr>
	<form action="login" method="post">
	<table align="center" cellpadding="2" width="30%" height="30%" >
	<tr>
	<td>Email or mobile </td>
		<td><input type="text" name="email"></td>
		</tr>
		<tr>
		<td>Password</td>
		<td><input type="password" name="pass"></td>
		</tr>
		<tr>
		<td><input type="submit" value="Login"></td>
		</tr>
		</table>
		 </form><hr>
	<a href="register.jsp">Registration</a>
	</center>
</body>
</html>