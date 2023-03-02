package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import beans.User;
import dao.UserDao;


public class register_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public register_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("cname");
        String email = request.getParameter("cemail");
        String password = request.getParameter("cpass");
        String age = request.getParameter("cage");
        String gender = request.getParameter("genradio");
        String address = request.getParameter("caddr");
        String branch = request.getParameter("cbranch");
        String[] skills = request.getParameterValues("cskills");
        //Part resume = request.getPart("cfile");
        
        // create instance of the Java bean class
        User user = new User();
        
        // set values in the bean using setters
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setAge(Integer.parseInt(age));
        user.setGender(gender);
        user.setCollegeAddress(address);
        user.setBranch(branch);
        List<String> skill_list = Arrays.asList(skills);
        user.setSkills(skill_list);
        //user.setResumeFilePath(resume);
        
        UserDao ud = new UserDao();
        try {
			boolean created = ud.userRegister(user);
			if(created) {
				request.getSession().setAttribute("msg", "Account created.");
			}
			else {
				request.getSession().setAttribute("msg", "Account not created. Try again");
			}
			response.sendRedirect("index.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
