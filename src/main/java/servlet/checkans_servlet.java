package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class checkans_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public checkans_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cans = request.getParameter("cans");
		String sans = request.getParameter("sans");
		String qno = request.getParameter("qno");
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    ArrayList<Integer> score = (ArrayList<Integer>) request.getSession().getAttribute("curr_score");
		if(cans.equals(sans)) {
			score.set(Integer.parseInt(qno), 1);
			request.getSession().setAttribute("curr_score", score);
			System.out.println("Score si: "+request.getSession().getAttribute("curr_score"));
			out.print("1");
		}
		else {
			score.set(Integer.parseInt(qno), 0);
			request.getSession().setAttribute("curr_score", score);
			out.print("0");
		}
	}

}
