<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title>Online Voting</title>
<style type="text/css">    
   body {
        background-color: beige;

    }
    
    </style>
</head>
<body>

<body>

        <jsp:include page="header.jsp" />

        <!-- Button trigger modal -->

  
  <!-- Candidate login Modal -->
 

        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <img src='${pageContext.request.contextPath}/resources/images/logo2.jpg' class="rounded" alt="Cinque Terre" style="width:95%; margin-top: 8%;">
                </div>
                <div class="col-lg-4" style="margin-top: 10%;">
                <h4 style="color: red; margin-bottom: 10%;">&nbsp;&nbsp;&nbsp;&nbsp; ${wrong2}</h4>
                    <div class="container">
                        <h2>Voter's Login:</h2>
                        <form class="form-horizontal" action="voterlogin" method="post">
                        
                        
                            <div class="form-group my-2">
                                <label class="control-label" for="email">Phone Number:</label>
                                <div class="my-2">
                                    <input type="text" class="form-control" id="email" placeholder="Enter Number" name="number">
                                </div>
                            </div>
                            <div class="form-group my-2">
                                <label class="control-label col-sm-2" for="pwd">Password:</label>
                                <div class="">
                                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="voterpass">
                                </div>
                            </div>
                            <div class="mb-3">
	                <h4 style="color: red">${wrong}</h4>
	                </div>
                            <!-- <div class="form-group">
                                <div class=" ">
                                    <div class="checkbox">
                                        <label><input type="checkbox" name="remember"> Remember me</label>
                                    </div>
                                </div>
                            </div> -->
                            <div class="form-group my-2">
                                <div class="">
                                    <input type="submit" class="btn btn-warning btn-block" value="Submit" 
                                   
                                    <%
                                    	boolean canvote=(Boolean)session.getAttribute("canvote");
                                    	if(!canvote)
                                    	{
                                    		out.print("disabled=\"disabled\"");
                                    	}
                                    %>
                           
                                    >
                                    
                                    
                                    <p class="text-left my-2">OR</p>
                                     
                                     <a href="<c:url value="/votersignup"/>"><button type="button" class="btn btn-warning btn-block"
                                     <%
                                     if(canvote)
                                 	{
                                 		out.print("disabled=\"disabled\"");
                                 	}
                                     
                                     %>
                                     
                                     >Register</button></a>
                                   <%-- <a href="<c:url value="uploadform"/>">Upload Image</a><br> --%>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
            crossorigin="anonymous"></script>

</body>
</html>
