<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Sign Up</title>
</head>
<style>
    body {
        background-color: rgb(144, 219, 233);

    }
    

    #grad2 {
        height: 900px;
        background-image: linear-gradient(white, rgb(54, 164, 228), rgb(128, 128, 128));
    
    }
</style>

</head>

<body>

    <body>
        <div id="grad2">
           	
           	<jsp:include page="header.jsp"></jsp:include>
		

            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-xl-6 mx-auto">
                        <div class="card card-signin flex-row my-5">
                            <div class="card-img-left d-none d-md-flex">
                                <!-- Background image for card set in CSS! -->
                            </div>
                            <div class="card-body">
                                <h3 class="card-title text-center text-primary" ><span> Registration Form:</span></h3>
                                <form action="registervoter" method="post">
                                    <div class="form-label-group">
                                        <label for="inputUserame">Name</label>
                                        <input type="text" id="inputUserame" class="form-control" placeholder="Name" name="name"
                                            required autofocus>
                                    </div>


									<div class="form-label-group">
                                        <label for="inputNumber">Phone Number</label>
                                        <input type="text" id="inputNumber" class="form-control"
                                            placeholder="Phone Number" name="number" required>

                                    </div>
                                    
                                    <div class="form-label-group">
                                        <label for="inputEmail">Email address</label>
                                        <input type="email" id="inputEmail" class="form-control"
                                            placeholder="Email address" name="mail" required>

                                    </div>



                                    <div class="form-label-group">
                                        <label for="inputPassword">Password</label>
                                        <input type="password" id="inputPassword" class="form-control"
                                            placeholder="Password" name="pass" required>

                                    </div>


                                    <input type="submit"
                                        class="btn btn-lg btn-primary btn-block text-uppercase my-4"
                                         value="Register">
                                    


                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    </body>

</html>