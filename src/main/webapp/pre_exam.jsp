<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    
<%
String userid = (String)request.getSession().getAttribute("userid");
String username = (String)request.getSession().getAttribute("username");
if(userid != null && username != null) {
    request.setAttribute("userid", userid);
}
else{
	response.sendRedirect("index.jsp");
}
int MAXQ = 10;
String msg = (String)request.getSession().getAttribute("msg");
ArrayList<Integer> score = new ArrayList<>(Collections.nCopies(20, 0));
request.getSession().setAttribute("curr_score", score);
%> 
<!DOCTYPE html>
<html>
<head>
<%@include file="./includes/header.jsp"%>
<title>exam-pre</title>
</head>
<body>
<%@include file="./includes/navbar.jsp"%>

<div class="m-3 alert alert-info">
            <h3>Exam Rules and Guidelines</h3>
				<ol>
					<li><strong>Time Limit:</strong> The exam must be completed within the designated time limit.</li>
					<li><strong>No Communication:</strong> Candidates are not allowed to communicate with each other during the exam.</li>
					<li><strong>No Cheating:</strong> Cheating in any form is strictly prohibited.</li>
					<li><strong>No Distractions:</strong> Candidates are advised to take the exam in a quiet place, free from distractions.</li>
					<li><strong>No Breaks:</strong> Candidates are not allowed to take breaks during the exam.</li>
					<li><strong>No Backtracking:</strong> Once a candidate moves on to the next question, they cannot go back to the previous question.</li>
					<li><strong>Save Answers:</strong> Candidates are advised to save their answers periodically to avoid any loss of data.</li>
					<li><strong>Submit Answers:</strong> Candidates must submit their answers before the end of the exam.</li>
					<li><strong>No Copying:</strong> Copying questions or answers from any source is strictly prohibited.</li>
					<li><strong>Penalties:</strong> Any violation of the exam rules may result in penalties, including disqualification from the exam.</li>
				</ol>
</div> 
<div class="rounded m-4 p-3" style="background: #eee;">
        	<a href="exam.jsp?sub=MATH&qno=1" class="btn btn-primary mb-2">Math</a><br>
        	<a href="exam.jsp?sub=ENV&qno=1" class="btn btn-primary mb-2">Environmental Studies</a><br>
        	<a href="exam.jsp?sub=OS&qno=1" class="btn btn-primary mb-2">Operating System</a>
</div>
</body>
</html>