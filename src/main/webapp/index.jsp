<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String userid = (String)request.getSession().getAttribute("userid");
String username = (String)request.getSession().getAttribute("username");
if(userid != null && username != null) {
    request.setAttribute("userid", userid);
}


String msg = (String)request.getSession().getAttribute("msg");
%>    

<!DOCTYPE html>
<html lang="en">
<head>
    
    <%@include file="./includes/header.jsp"%>
    <title>e-GRAD portal</title>
</head>
<body>
    <%@include file="./includes/navbar.jsp"%>
    <section class="hero-section">
      <div class="cgrid-container">
        <div class="content-area">
          <div class="search-section">
            
            <input type="text" class="form-control sbar" placeholder="search..."/>
            <button class="btn btn-primary csearch-btn">Search &emsp;<i class="material-icons searchsym">&#xe8b6;</i></button>
          </div>
          <div class="mb-3" style="max-width:100%;"><img class="rounded" src="./static_files/img/books.jpg" alt="book" style="overflow:none;filter:brightness(45%);width:100%;"/></div>
            <a href="pre_exam.jsp"><button class="btn btn-primary mb-3">Proceed to give exam</button></a>
        </div>
        <% if(userid == null){ %>
        <div class="cdashboard card">
          <h5 class="card-title">Dashboard</h5>
          <form action="login_servlet" method="POST">
            <input type="email" class="form-control" placeholder="email" name="email"/><br>
            <input type="password" class="form-control" placeholder="password" name="password"/>
            <button type="submit" class="btn btn-success" style="margin-top: 0.7em;">Login</button>
            <hr>
          </form>
            <p class="text-muted">Do not have an account?</p>
            <a href="./registration.jsp"><button class="btn btn-success">Register</button></a>
        </div>
        <%} %>
        </div>
    </section>
    <footer class="c-footer">
      <a class="f-link" href="#">About us</a>  |  <a class="f-link" href="#">Contact</a>  |  <a class="f-link" href="#">Address</a>
    </footer>


	<% if(msg!=null){%>
		<script>
		alert(<%=msg %>);
		</script>
	<%} request.getSession().setAttribute("msg",null); %>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>