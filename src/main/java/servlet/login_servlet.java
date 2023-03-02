package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import dao.UserDao;

public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public login_servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		UserDao ud = new UserDao();
		String[] auth_user;
		try {
			auth_user = ud.userLogin(email, pass);
			if(!auth_user[0].equals("") && !auth_user[1].equals("")) {
				request.getSession().setAttribute("userid", auth_user[0]);
				request.getSession().setAttribute("username", auth_user[1]);
			}
			response.sendRedirect("index.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
