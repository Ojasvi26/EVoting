<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

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
  
  <jsp:include page="header.jsp" />

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
          <h3 class="card-title">${cl.name}</h3>
          <p class="card-text">${cl.about}</p>
          <p class="card-text">${cl.agenda}</p>
          <p class="card-text">${cl.party}</p>
          <p class="card-text"><small class="text-muted">${cl.mail}</small></p>
        </div>
      </div>
    </div>
  </div>
  
  
  <br>
  
  </c:forEach>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</body>

</html>