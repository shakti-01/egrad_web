<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="dao.*" import = "beans.*" %>
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

String sub = request.getParameter("sub");
String qno = request.getParameter("qno");
ExamDao ed = new ExamDao();
Question q = ed.getQuestion(sub,qno);

int MAXQ = 10;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous" defer></script>
<title>Give exam</title>

<style>
	.container {
		margin-top: 2.5rem;
		padding: 2.5rem;
		background-color: #eee;
		border-radius: 1rem;
	}

	h1 {
		font-size: 2rem;
		margin-bottom: 2rem;
		color: #0066cc;
	}

	p {
		font-size: 1.4rem;
		margin-bottom: 2.5rem;
		color: #333;
	}

	

	.btn-secondary, .btn-primary {
		font-size: 1.2rem;
		border-radius: 5px;
		font-weight: bold;
		border:none;
	}
</style>
</head>
<body>
<%@include file="./includes/navbar.jsp"%>

<div class="container">
	<jsp:include page="./includes/countdown.jsp" />
		<h1>Question <%=q.getQno() %></h1>
		<p><%=q.getQuestion() %></p>
		<div class="form-check">
			<input class="form-check-input" type="radio" name="qsn" id="q1-a" value="<%=q.getOp1()%>">
			<label class="form-check-label" for="q1-a">
				a. <%=q.getOp1() %>
			</label>
		</div>
		<div class="form-check mt-3">
			<input class="form-check-input" type="radio" name="qsn" id="q1-b" value="<%=q.getOp2()%>">
			<label class="form-check-label" for="q1-b">
				b. <%=q.getOp2() %>
			</label>
		</div>
		<div class="form-check mt-3">
			<input class="form-check-input" type="radio" name="qsn" id="q1-c" value="<%=q.getOp3()%>">
			<label class="form-check-label" for="q1-c">
				c. <%=q.getOp3() %>
			</label>
		</div>
		<div class="form-check mt-3">
			<input class="form-check-input" type="radio" name="qsn" id="q1-d" value="<%=q.getOp4()%>">
			<label class="form-check-label" for="q1-d">
				d. <%=q.getOp4() %>
			</label>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
			<% if(q.getQno()>1){ %>
				<a href="exam.jsp?sub=<%=q.getSub() %>&qno=<%=q.getQno()-1 %>"><button class="btn btn-secondary px-3 py-2"">Previous</button></a>
			<%} %>
			</div>
			<div class="col-md-4 text-center">
				<button class="btn btn-success px-3 py-2" onclick="confirmAns()"> SAVE </button>
			</div>
			<div class="col-md-4 text-end">
			<%if(q.getQno()<MAXQ){ %>
				<a href="exam.jsp?sub=<%=q.getSub() %>&qno=<%=q.getQno()+1 %>"><button class="btn btn-primary px-3 py-2">Next</button></a>
			<%} else{%>
			<a href="exam_result.jsp"><button class="btn btn-danger px-3 py-2"> SUBMIT </button></a>
			<%} %>
			</div>
		</div>
	</div>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6">
				<p class="lead">Current date/time:</p>
				<p id="datetime"></p>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-xrRZO3oXO9UbD1gtxMxRdjA7fzG2CFeFN+0BtGvJj7nxl0lXuV7a+Jkzv0Fp+F5" crossorigin="anonymous"></script>
<script>
function updateDateTime(){
	var now = new Date();
	var datetimeElement = document.getElementById('datetime');
	datetimeElement.innerHTML = now.toLocaleString();
}

	// Call updateDateTime() once to display initial date/time
	updateDateTime();

	// Call updateDateTime() every second to update date/time every second
	setInterval(updateDateTime, 1000);
	function confirmAns(){
		const radioButtons = document.getElementsByName('qsn');
		let selectedValue;

		for (let i = 0; i < radioButtons.length; i++) {
		  if (radioButtons[i].checked) {
		    selectedValue = radioButtons[i].value;
		    break;
		  }
		}
		let canss = `<%=q.getAns()%>`;
		
		$.ajax({
		    type: "POST",
		    url: "checkans_servlet",
		    data: {cans: canss, sans: selectedValue, qno: `<%=q.getQno() %>`},
		    success: function(response) {
		        if (response == "1") {
		            console.log("Answer is correct!");
		        } else {
		            console.log("Answer is incorrect!");
		        }
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        console.log("Error: " + textStatus);
		    }
		});
	}
	function toggleFullScreen() {
	  if (!document.fullscreenElement) {
	    document.documentElement.requestFullscreen();
	  } else if (document.exitFullscreen) {
	    document.exitFullscreen();
	  }
	}

	document.addEventListener("keydown",(e) => {
		    if (e.key === "Enter") {
		      toggleFullScreen();
		    }
		  },false
	);
	

</script>
</body>
</html>