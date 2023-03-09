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
String msg = (String)request.getSession().getAttribute("msg");
ArrayList<Integer> score = (ArrayList<Integer>)request.getSession().getAttribute("curr_score");
int sum=0;
for (int i = 0; i < score.size(); i++){
	sum+= score.get(i);
}
int MAXQ=10;

%> 
<!DOCTYPE html>
<html>
<head>
<%@include file="./includes/header.jsp"%>
<title>result</title>
</head>
<body>
<%@include file="./includes/navbar.jsp"%>
<div class="container mt-5">
		<h1 class="text-center mb-4">Exam Score Result</h1>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Score</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=username %></td>
					<td><%=sum %>/<%=MAXQ %></td>
				</tr>
			</tbody>
		</table>
		<div class="text-center mt-4">
			<h2 class="text-success">Congratulations!</h2>
			<div class="progress mt-4" style="height: 30px;">
			  <div class="progress-bar bg-success" role="progressbar" style="width: <%=(sum/(MAXQ*1.0f))*100.0f %>%;"></div>
			</div>
			<p class="mt-2">You scored <%=(sum/(MAXQ*1.0f))*100.0f %>% in the exam</p>
		</div>
	</div>
</body>
</html>