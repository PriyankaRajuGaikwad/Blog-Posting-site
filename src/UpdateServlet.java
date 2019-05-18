

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();

		String id = request.getParameter("id");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String cpass = request.getParameter("cpass");
		String dob = request.getParameter("dob");
		String mobile = request.getParameter("mobile");
		String gender = request.getParameter("x");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","redhat");
			PreparedStatement ps = con.prepareStatement("update register set fname=? ,lname=? ,email=?, pass=? ,dob=? ,mobile=? ,gender=?, status=? where id=?");
			ps.setString(1,fname);
			ps.setString(2,lname);
			ps.setString(3,email);
			ps.setString(4,pass);
			ps.setString(5,dob);
			ps.setInt(6,Integer.parseInt(mobile));
			ps.setString(7,gender);
			ps.setString(8,request.getParameter("status"));
			ps.setString(9,request.getParameter("id"));
			ps.execute();
			out.print("Record Updated!!!!");
			RequestDispatcher rd=request.getRequestDispatcher("userinfo.jsp");
			rd.include(request, response);
		}
		catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();

		}

	}
}
