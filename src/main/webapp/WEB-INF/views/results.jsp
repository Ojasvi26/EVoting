<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title>Result</title>
  </head>
  <body>
      
    <jsp:include page="header.jsp"></jsp:include>
    
    <br>
    <br>

    <h3 style="margin-left: 5%;">Result :</h3>
    <div class="container my-4" style="margin-left: 4%;">
      <table class="table">
          <thead class="thead-dark">
               <tr>
                  <th scope="col">Candidate Id:</th>
                  <th scope="col">Candidate Name:</th>
                  <th scope="col">Number Of Votes:</th>
                  <th scope="col">Party Name:</th>
              </tr>
          </thead>
          <tbody>
          <%
          int c=1;
          %>
          <c:forEach items="${candidateList}" var="cl">
              <tr style="background-color: 
              
              <%
              	if(c==1)
              		out.print("gold");
              	else if(c==2)
              		out.print("lightsalmon");
              	else if(c==3)
              		out.print("springgreen");
              	else
              		out.print("wheat");
              	c++;
              %>
              
              ;">
             
              
                  <th scope="row">${cl.id}</th>
                  <td>${cl.name}</td>
                  <td>${cl.votes}</td>
                  <td>${cl.party}</td>
              </tr>
             
              
              </c:forEach>
          </tbody>
      </table>
      

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
  </body>
</html>