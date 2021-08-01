  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src='${pageContext.request.contextPath}/resources/images/logo.jpg' alt="" width="30" height="24"
                        class="d-inline-block align-text-top">
                    E-Voting</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="<c:url value="home"/>">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="<c:url value="candidatelist"/>">Candidate List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="<c:url value="results"/>">View Result</a>
                        </li>
                        <%-- <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="<c:url value="about"/>">About</a>
                        </li> --%>
                    </ul>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Candidate
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item 
                            
                            <%
                            boolean canvote=(Boolean)session.getAttribute("canvote");
                        	if(canvote)
                        	{
                        		out.print("disabled");
                        	}
                            
                            %>
                            
                            " href="candregpage">Register</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item
                           <%
                           	
                           if(canvote)
	                       	{
	                       		out.print("disabled");
	                       	}
                           
                           %>
                            
                            " data-bs-toggle="modal" data-bs-target="#LoginModal">View Profile</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        
        
         <div class="modal fade" id="LoginModal" tabindex="-1" aria-labelledby="LoginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="LoginModalLabel">Candidate Login:</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form action="candidatelogin" method="post">
                <div class="mb-3">
                  <label for="exampleInputEmail1" class="form-label">Phone Number:</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="number">
                  <div id="emailHelp" class="form-text">We'll never share your number with anyone else.</div>
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" name="pass">
                </div>
               
                <!-- <div class="mb-3 form-check">
                  <input type="checkbox" class="form-check-input" id="exampleCheck1">
                  <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div> -->
                
                <input type="submit" class="btn btn-primary" value="Submit">
              </form>
        </div>
        
      </div>
    </div>
  </div>
