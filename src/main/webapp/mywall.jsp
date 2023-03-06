<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*" import = "beans.*" %>
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

UserDao ud = new UserDao();
User u = ud.getUserDetail(userid);
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./includes/header.jsp"%>
<title>My wall</title>
</head>
<body>
<%@include file="./includes/navbar.jsp"%>
<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
      <div class="col">
        <h4 class="text-primary bg-light rounded-3 p-3 mb-4">User Profile</h4>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"><%=u.getName() %></h5>
            <p class="text-muted mb-4"><%=u.getGender()+" - "+u.getAge() %></p>
            <!-- <div class="d-flex justify-content-center mb-2">
              <button type="button" class="btn btn-primary">Follow</button>
              <button type="button" class="btn btn-outline-primary ms-1">Message</button>
            </div>-->
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=u.getName() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=u.getEmail() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Gender</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=u.getGender() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Age</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=u.getAge() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">College Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=u.getCollegeAddress() %></p>
              </div>
            </div>
            <hr/>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Branch</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=u.getBranch() %></p>
              </div>
            </div>
            <hr/>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Skills</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=u.getSkills() %></p>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</section>
</body>
</html>