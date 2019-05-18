

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		String pass = request.getParameter("pass");
		String data = request.getParameter("email");
		//String id = request.getParameter("id");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","redhat");
			PreparedStatement ps = con.prepareStatement("select * from register where email=? and pass=?");
			ps.setString(1,data);
			ps.setString(2,pass);
			ResultSet rs= ps.executeQuery();
			if(rs.next())
			{
				if(rs.getString(10)== "1")
				{
					HttpSession hs = request.getSession(true);
					out.println(hs.getId());
					ps = con.prepareStatement("update register set sessionID = ? where id = ?");
					ps.setString(1, hs.getId());
					ps.setString(2, rs.getString(1));
					ps.executeUpdate();	
					if(pass.equals("admin")){
						RequestDispatcher rd = request.getRequestDispatcher("userinfo.jsp");
						//out.println("login successfully");
						rd.include(request, response);
					}
					else{
						RequestDispatcher rd = request.getRequestDispatcher("normaluser.jsp");
						//out.println("login successfully");
						rd.include(request, response);
					}
				}
		
			}

			else {
				out.println("<span style='color:red'>please enter correct password or email</span>");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}

		}

		catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();

		}

	}

}
