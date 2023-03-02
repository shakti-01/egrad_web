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
          <img class="hero-img rounded" src="https://img.freepik.com/free-photo/smiling-happy-indian-student-with-backpack-pointing-his-finger-wall_496169-1532.jpg?w=740&t=st=1674465896~exp=1674466496~hmac=5d3d07e48719bb3505136f093d4a358c81dc33bab69adf2a0cded5c031e91469" alt="e-GRAD pic"/>
          <span>This is a website to store info on students. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Animi, veniam. Non voluptatibus, fuga quaerat vitae soluta similique blanditiis nam perspiciatis rerum, vel, nesciunt repellendus illo officia repellat autem eius assumenda? Lorem ipsum dolor sit, amet consectetur adipisicing elit. Mollitia officia quam repellat recusandae ipsam? Ipsum sequi voluptatum quis laudantium sint magnam tenetur, odio velit! Cum expedita facilis voluptate dolorem cupiditate culpa optio error reprehenderit. Nam iste sit dignissimos neque illum ex amet non. Nobis, suscipit! Et fugit totam dolor labore ipsa dicta possimus, porro cumque laboriosam necessitatibus velit odit ipsam iste fuga? Ipsa provident deleniti dicta dignissimos ratione architecto eligendi aperiam, quisquam numquam amet cupiditate iste consequuntur incidunt itaque delectus error minus quidem. Nam minima nobis eaque iusto non accusantium? Iste accusamus veritatis laboriosam. Eligendi inventore quae molestias reprehenderit repellendus perspiciatis corporis enim adipisci? Quibusdam, rerum. Beatae quis quo perferendis voluptatibus quaerat deserunt assumenda dolores! Ex harum animi porro libero?</span>
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