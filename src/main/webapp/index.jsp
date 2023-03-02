<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String userid = (String)request.getSession().getAttribute("userid");
String username = (String)request.getSession().getAttribute("username");
if(userid != null && username != null) {
    request.setAttribute("userid", userid);
}
else{
	username = "Please login";
}
%>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./static_files/cstyles.css">
    <title>e-GRAD portal</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand fs-3 fst-italic" href="#">E - Grad</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">e-Exam</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Open forum</a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">e-Repository</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">My-Wall</a>
              </li>
            </ul>
            <span class="text-success fs-5 me-3"><%=username %></span>
             <% if(userid != null){ %> <a href="logout_servlet"><button class="btn btn-danger me-3">Logout</button></a><% } %>
          </div>
        </div>
      </nav>
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

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>