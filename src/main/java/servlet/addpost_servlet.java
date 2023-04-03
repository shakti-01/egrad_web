package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import dao.ForumDao;

public class addpost_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addpost_servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String uid = (String)request.getSession().getAttribute("userid");
		String uname = (String)request.getSession().getAttribute("username");
		
		//check
		if(title == "" || content =="") {response.sendRedirect("myforum.jsp");return;}
		
		ForumDao fd = new ForumDao();
		try {
			if(!fd.addPost(uid, uname, title, content)) {
				System.out.println("post not added");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("myforum.jsp");
	}

}
