<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*" import = "beans.*, java.util.*"%>
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
ArrayList<Post> plist = fd.getAllPosts();

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
        <h1 class="text-center mb-4">All posts</h1>
        <!-- Posts -->
        <hr>

        <%for(Post p:plist){ %>
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title"><%=p.getTitle() %></h5>
                <p class="card-text"><%=p.getContent() %></p>
                <p class="card-text"><small class="text-muted">Posted by <%=p.getUserName() %></small></p>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#replyModal<%=p.getPostid() %>">Reply</button>
                <!-- Replies -->
				<div class="mb-3 ms-5">
				    <div class="card-body">
				        <%for(Reply r:p.getReplies()){ %>
				        <p class="card-text"><%=r.getContent() %></p>
				        <p class="card-text"><small class="text-muted">Posted by <%=r.getUserName() %></small></p>
				        <%} %>
				    </div>
				</div>
            </div>
        </div>
        
        <!-- Reply Modal -->
        <div class="modal fade" id="replyModal<%=p.getPostid() %>" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="replyModalLabel">Reply to <%=p.getTitle() %></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                        <form action="addreply_servlet" method="POST">
                    <div class="modal-body">
                            <div class="mb-3">
                                <label for="replyContent" class="form-label">Your Reply</label>
                                <textarea class="form-control" id="replyContent" rows="3" name="content" required></textarea>
                                <input type="text" value="<%=p.getPostid() %>" name="pid" style="display:none"/>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Post Reply</button>
                    </div>
                        </form>
                </div>
            </div>
        </div>
        <%} %>
    </div>
    <!-- Bootstrap 5 JS (with Popper.js) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>