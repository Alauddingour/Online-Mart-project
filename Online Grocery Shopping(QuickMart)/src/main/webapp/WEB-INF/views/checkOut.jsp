<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   <style><%@include file="/WEB-INF/views/CdacProjectLoginPage.css"%></style>
   <style type="text/css">
   .detais
   {
   font-size: medium;
   font-weight: bolder;
   }
   .user-detais
   {
   font-size: large;
   }
   body
   {
   height: 500px
   }
   
   </style>
</head>
<body>
<section>
        <nav class="navbar-expand-md navbar-light fixed-top" id="navbar" >
            <div class="container-fluid">
                <a class="navbar-brand" href="#">QuickMart</a>
              </div>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#toggleContents">
                  <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="toggleContents">
                  <ul class="navbar-nav ms-auto"><!--ml auto push the toggle contents as suppose to in the right when device width is collapsed-->
                    <li class="nav-item">
                        <a class="nav-link" href="<spring:url value='/Home'/>">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <c:if test= "${user==null}">
                    <li class="nav-item">
                        <a class="nav-link" href="<spring:url value='/login'/>">Login/SignUp</a>
                    </li>
                    </c:if>
                    <c:if test= "${user!=null}">
                    <li class="nav-item" style="margin-right: 20px;">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color: rgb(192, 88, 56);color: black;border-radius: 10px;font-family: 'Times New Roman', Times, serif;
                            font-weight:light;
                            font-size: large;border: transparent;margin-top: 3px;">
                              ${user.firstName}
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                              <a class="dropdown-item" href="<spring:url value='/UserCart'/>">Cart</a>
                              <a class="dropdown-item" href="<spring:url value='/UserOrderDetails'/>?id=${user.id}">Orders</a>
                              <a class="dropdown-item" href="<spring:url value='/logout'/>">Logout</a>
                            </div>
                          </div>
                    </li>
                    </c:if>
                  </ul>
              </div>
          </nav>
          </section>
          <div class="row card" style="margin-top: 140px;border: 1px solid black;width: 410px;height: 480px;margin-left: 550px;">
          <div style="margin-left: 10px">
          <div class="row">
          <div style="margin-top: 20px">
<h2 >Shipping Address</h2>
<div style="height: 65px;margin-top: 10px">
<span class="detais">Address: </span><span class="user-detais">${user.address}</span>
</div>
<span class="detais">City: </span><span class="user-detais">${user.city}</span><br>
<span class="detais">State: </span><span class="user-detais">${user.state}</span><br>
<span class="detais">Pin Code: </span><span class="user-detais">${user.pin}</span>
</div>
</div>
<hr>
<div class="row">
<h2>Mode of Payment</h2>
<span class="user-detais"><input type="radio" checked disabled="disabled" style="width: 30px;height: 15px">COD <span style="font-size: small;">(Currently available)</span></span>
<span class="user-detais"><input type="radio" disabled="disabled" style="width: 30px;height: 15px">UPI</span>
<span class="user-detais"><input type="radio" disabled="disabled" style="width: 30px;height: 15px">Credit/Debit Card</span>
<span class="user-detais"><input type="radio" disabled="disabled" style="width: 30px;height: 15px">Net Banking</span>
</div>
</div>
<div class="row" style="margin-top: 30px;margin-left: 1%">
<form method="post">
<input class="btn btn-secondary" type="submit" value="Order" style="width: 350px">
</form>
</div>
</div>
</body>
</html>