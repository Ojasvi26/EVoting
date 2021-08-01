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

  <title>Candidates</title>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><img src="5.jpeg" alt="" width="30" height="24"
          class="d-inline-block align-text-top">
        E-Voting</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<c:url value="voterlogout"/>">Logout</a>
        </li>
      </ul>
    </div>
  </nav>

  <br>

  <h1 style="margin-left:10%;">Candidates:</h1>
  <br>

  

<c:forEach items="${candidateList}" var="cl">

  <div class="card mb-3" style="max-width: 1200px; margin-left: 10%; margin-right: 10%;">
    <div class="row no-gutters">
      <div class="col-md-4">
        <img src="${pageContext.request.contextPath}/resources/images/candidate/${cl.image}" class="card-img" alt="image" style="width: 150px; height: 180px;">
      </div>

      <div class="col-md-7">
        <div class="card-body">
          <h3 class="card-title"> ${cl.name}</h3>
          <p class="card-text"> ${cl.about} </p>
          <p class="card-text"> ${cl.agenda} </p>
          <p class="card-text"><small class="text-muted"> ${cl.party} </small></p>
        </div>
      </div>
      <div class="col-1" style="margin-top:6%">
       <a href="<c:url value="/givevote/${cl.id}"/>"> <button type="button" class="btn btn-outline-info">Vote</button></a>
      </div>
    </div>
  </div>
  <br>

  </c:forEach>


  

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