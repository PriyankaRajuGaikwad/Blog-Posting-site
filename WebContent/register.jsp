<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body bgcolor="gray">
	<center>
		<h1>Registration Page</h1>
		<hr>
		<form action="register" method="post">
			<table align="center" cellpadding="2" width="40%" height="100%">
				<tr>
					<td>First Name</td>
					<td><input type="text" name="fname"></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="lname"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td>Confirm Password</td>
					<td><input type="password" name="cpass"></td>
				</tr>
				<tr>
					<td>DOB</td>
					<td><input type="date" name="dob"></td>
				</tr>
				<tr>
					<td>Mobile</td>
					<td><input type="text" name="mobile"></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="radio" name="x" value="male"/>Male <input
						type="radio" name="x" value="female"/>Female</td>
				</tr>
				<tr>
					<td align="center" colspan="3"><input type="submit" value="Register with us"></td>
				</tr>
				</form>
			</table>
			<hr>
			<a href="login.jsp">Login</a>
	</center>
</body>
</html>