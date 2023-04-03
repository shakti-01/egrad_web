package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import dao.ForumDao;

public class addreply_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addreply_servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String postid = request.getParameter("pid");
		String uname = (String)request.getSession().getAttribute("username");
		
		if(content == "") response.sendRedirect("allposts.jsp");
		
		ForumDao fd = new ForumDao();
		try {
			if(!fd.addReply(uname, postid, content)) {
				System.out.println("reply not added");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("allposts.jsp");
	}

}
