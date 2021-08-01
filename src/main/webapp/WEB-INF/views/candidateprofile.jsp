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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="5.jpeg" alt="" width="30" height="24"
                    class="d-inline-block align-text-top">
                E-Voting</a>
            
             <ul class="nav navbar-nav navbar-right">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<c:url value="/candidatelogout"/>">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container" >
        <div class="row">
            <div class="col-lg-12 col-xl-9 mx-auto">
                <div class="card card-signin flex-row my-3">
                    <div class="card-img-left d-none d-md-flex">
                        <!-- Background image for card set in CSS! -->
                    </div>
                    <div class="card-body">
                        <h3 class="card-title text-center "><span>Your Details:</span></h3>
                        
                        <div class="form-group">
                                <img src="${pageContext.request.contextPath}/resources/images/candidate/${candObj.image}" alt="image" style="width: 150px; height: 180px;">
                            </div>
                        <form class="form-signin" action="updatecandidate" method="post">
							<input type="text" name="id" value="${candObj.id}" hidden="true">
                            <div class="form-group">
                                <label for="usr">Name:</label>
                                <input type="text" class="form-control" placeholder="Name" id="usr" name="name" value="${candObj.name}">
                            </div>
                             <div class="form-group">
                                <label for="number">Number:</label>
                                <input type="text" class="form-control" placeholder="Phone Number" id="number" name="number" value="${candObj.number}">
                            </div>
                            
                            <div class="form-group">
                                <label for="number">Password:</label>
                                <input type="password" class="form-control" placeholder="Password" id="password" name="pass" value="${candObj.pass}">
                            </div>
                             <div class="form-group">
                                <label for="mail">E-Mail:</label>
                                <input type="text" class="form-control" placeholder="Party Name" id="mail" name="mail" value="${candObj.mail}">
                            </div>
                            <div class="form-group">
                                <label for="party">Party:</label>
                                <input type="text" class="form-control" placeholder="Party Name" id="party" name="party" value="${candObj.party}">
                            </div>
                            <div class="form-label-group my-2">
                                <label for="agenda">Agenda:</label>
                                <textarea class="form-control" rows="2" placeholder="Your Agenda"  id="agenda" name="agenda">${candObj.agenda}</textarea>

                            </div>

                            <div class="form-label-group my-2">
                                <label for="about">About:</label>
                                <textarea class="form-control" rows="4" placeholder="Write about yourself.."id="about" name="about" >${candObj.about}</textarea>

                            </div>
                            
							<input type="text" name="image" value="${candObj.image}" hidden="true">
							
                            <input type="submit"class="btn btn-lg btn-primary btn-block text-uppercase my-4" value="Update Details">


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


