<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Voter Registration</title>
    <style>
        body{
            background-image: url(${pageContext.request.contextPath}/resources/images/bc.jpg);
            
        }
    </style>
    
    
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="container" >
        <div class="row">
            <div class="col-lg-12 col-xl-9 mx-auto">
                <div class="card card-signin flex-row my-3">
                    <div class="card-img-left d-none d-md-flex">
                        <!-- Background image for card set in CSS! -->
                    </div>
                    <div class="card-body">
                        <h3 class="card-title text-center "><span>Candidate Details:</span></h3>
                        <form class="form-signin" action="registercandidate" method="post" enctype="multipart/form-data">

                            <!-- <div class="form-group">
                                <img src="me.jpeg" width="270px" height="200px">
                            </div> -->

                            <div class="form-group">
                                <label for="usr">Name:</label>
                                <input type="text" class="form-control" placeholder="Name" id="usr" name="name">
                            </div>
                             <div class="form-group">
                                <label for="number">Number:</label>
                                <input type="text" class="form-control" placeholder="Phone Number" id="number" required="required" name="number">
                            </div>
                            <div class="form-group">
                                <label for="number">Password:</label>
                                <input type="password" class="form-control" placeholder="Password" id="password" required="required" name="pass">
                            </div>
                             <div class="form-group">
                                <label for="mail">E-Mail:</label>
                                <input type="text" class="form-control" placeholder="Party Name" id="mail" name="mail" required="required">
                            </div>
                            <div class="form-group">
                                <label for="party">Party:</label>
                                <input type="text" class="form-control" placeholder="Party Name" id="party" name="party" required="required">
                            </div>
                            <div class="form-label-group my-2">
                                <label for="agenda">Agenda:</label>
                                <textarea class="form-control" rows="2" placeholder="Your Agenda"  id="agenda" name="agenda" required="required"></textarea>

                            </div>

                            <div class="form-label-group my-2">
                                <label for="about">About:</label>
                                <textarea class="form-control" rows="4" placeholder="Write about yourself.."id="about" name="about" required="required"></textarea>

                            </div>
                            <div class="form-label-group my-2">
                                <label class="form-label" for="image">Upload Your Photo:</label>
                                <input type="file" class="form-control" id="image" name="file" required="required" />
                            </div>

                            <input type="submit"class="btn btn-lg btn-primary btn-block text-uppercase my-4" value="Register">


                        </form>
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