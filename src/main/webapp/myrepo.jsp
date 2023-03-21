<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String userid = (String)request.getSession().getAttribute("userid");
String username = (String)request.getSession().getAttribute("username");
if(userid != null && username != null) {
    request.setAttribute("userid", userid);
}
else{
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./includes/header.jsp"%>
<title>E-Repository Page</title>
</head>
<body>
<%@include file="./includes/navbar.jsp"%>
<div class="container mt-5">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-center">E-Repository Page</h1>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-md-12">
          <h3>Upload Files</h3>
          <form action="#" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="file">Select file(s) to upload:</label>
              <input type="file" name="file" id="file" class="form-control-file">
            </div>
            <button type="submit" class="btn btn-primary">Upload</button>
          </form>
        </div>
      </div>
      <div class="row mt-5">
        <div class="col-md-12">
          <h3>Files List</h3>
          <table class="table table-striped">
            <thead>
              <tr>
                <th>File Name</th>
                <th>Uploaded By</th>
                <th>Time of Upload</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>example_file1.pdf</td>
                <td>User A</td>
                <td>March 7, 2023 12:35 PM</td>
                <td><a href="#" class="btn btn-sm btn-primary">Download</a></td>
              </tr>
              <tr>
                <td>example_file2.docx</td>
                <td>User B</td>
                <td>March 8, 2023 2:15 PM</td>
                <td><a href="#" class="btn btn-sm btn-primary">Download</a></td>
              </tr>
              <tr>
                <td>example_file3.jpg</td>
                <td>User C</td>
                <td>March 9, 2023 8:45 AM</td>
                <td><a href="#" class="btn btn-sm btn-primary">Download</a></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
</body>
</html>