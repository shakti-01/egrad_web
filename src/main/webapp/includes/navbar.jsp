<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand fs-3 fst-italic" href="#">E - Grad</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="index.jsp">e-Exam</a>
              </li>		
              <li class="nav-item">
                <a class="nav-link" href="#">Open forum</a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="myrepo.jsp" tabindex="-1" aria-disabled="true">e-Repository</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="mywall.jsp" tabindex="-1" aria-disabled="true">My-Wall</a>
              </li>
            </ul>
             <% if(request.getSession().getAttribute("userid") != null){ %>
             	<span class="text-success fs-5 me-3"><%=request.getSession().getAttribute("username") %></span>
              <a href="logout_servlet"><button class="btn btn-danger me-3">Logout</button></a>
              <% } else { %>
              <span class="text-success fs-5 me-3">Please login</span>
              <%} %>
          </div>
        </div>
      </nav>