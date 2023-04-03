<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*" import = "beans.*, java.util.*" %>
<%
String userid = (String)request.getSession().getAttribute("userid");
String username = (String)request.getSession().getAttribute("username");
if(userid != null && username != null) {
	 request.setAttribute("userid", userid);
}
else{
	response.sendRedirect("index.jsp");
}
ForumDao fd = new ForumDao();
ArrayList<Post> plist = fd.getUserPosts(userid);
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./includes/header.jsp"%>
<title>forum</title>
</head>
<body>
	<%@include file="./includes/navbar.jsp"%>
	<div class="container my-5">
        <h1 class="text-center mb-4">User Forum Page</h1>
        <!-- Add New Post Form -->
        <form action="addpost_servlet" method="POST">
            <div class="mb-3">
                <label for="postTitle" class="form-label">Post Title</label>
                <input type="text" class="form-control" id="postTitle" name="title" required>
            </div>
            <div class="mb-3">
                <label for="postContent" class="form-label">Post Content</label>
                <textarea class="form-control" id="postContent" rows="3" name="content" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Post</button>
        </form>
        <!-- Posts -->
        <hr>
        <h2 class="mb-4">Posts</h2>
        <%for(Post p :plist){ %>
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title"><%=p.getTitle() %></h5>
                <p class="card-text"><%=p.getContent() %></p>
                <p class="card-text"><small class="text-muted">Posted by <%=p.getUserName() %></small></p>
            </div>
        </div>
        <%} %>
        <!-- Reply Modal -->
        <a class="link-info fs-4" href="allposts.jsp">View other posts</a>
    </div>
    <!-- Bootstrap 5 JS (with Popper.js) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>