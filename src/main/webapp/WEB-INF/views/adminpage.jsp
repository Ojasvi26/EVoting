<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />

    <title>Admin Panel</title>
  </head>

  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarsExample08"
        aria-controls="navbarsExample08"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div
        class="collapse navbar-collapse justify-content-md-center"
        id="navbarsExample08"
      >
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="#">
              <h4>Admin Panel</h4>
              <span class="sr-only">(current)</span>
            </a>
          </li>
        </ul>
      </div>
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item active">
          <a class="nav-link" href="<c:url value="adminlogout"/>"
            >Logout<span class="sr-only">(current)</span></a
          >
        </li>
      </ul>
    </nav>
    <br />

    <div class="row">
      <div class="col-8">
        <div class="container" style="margin-left: 2%">
          <table class="table">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Candidate Id:</th>
                <th scope="col">Candidate Name:</th>
                <th scope="col">Number Of Votes:</th>
              </tr>
            </thead>
            <tbody>
            <!-- LOOP -->
            <c:forEach items="${candidateList}" var="cl">
              <tr>
                <th scope="row">${cl.id}</th>
                <td>${cl.name}</td>
                <td>${cl.votes}</td>
              </tr>
              </c:forEach>
              <!-- LOOP END -->
            </tbody>
          </table>
        </div>
      </div>

      <div class="col-lg-3" style="padding-top: 4%; margin-left: 2%">
        <a href="<c:url value="enableVoting"/>" ><button type="button"
            class="btn btn-lg btn-outline-success btn-block" >
            Enable voting
          </button></a>

        <br />

        <a href="<c:url value="disableVoting"/>" ><button
            type="button" class="btn btn-lg btn-outline-warning btn-block" >
            Disable voting
          </button></a >

        <br />

        <a href="<c:url value="generateResult"/>"><button
            type="button" class="btn btn-outline-primary btn-lg btn-block">
            Generate Results
          </button></a>

        <br />

        <a href="<c:url value="clearResult"/>"><button  type="button" class="btn btn-outline-danger btn-lg btn-block">
            Clear Entries
          </button></a >
      </div>
      <div class="col-lg-1"></div>
    </div>

      

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
