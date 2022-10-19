<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
</head>
<style>
    .col
    {
        width: 300px;
        height: 310px;
    }
    input[type=number]::-webkit-inner-spin-button {
    opacity: 1
}

img:hover{
		transform: translateY(-2px);
		opacity: 0.9;
	}
</style>
<body>
<header>
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
          </header>
          <div class="row">
            <div class="col col-md-3" style="margin-top: 8%;height: 900px;">
                <h2 style="padding-left: 4px;">All Categories</h2>
                <hr>
                <br>
                <div>
                <c:forEach var="category" items="${categoryNames}">
                    <a href="<spring:url value='/UserShowProductByCategory'/>?id=${category.id}"><label style="font-size: large;font-weight: bolder;margin-left: 20px;cursor: pointer;color: black;">${category.name}</label></a><BR></BR>
                    </c:forEach>
                    <a href="<spring:url value='/UserSeeAllCategories'/>" class="btn btn-primary btn-lg" style="font-size: large;font-weight: bolder;margin-left: 20px;cursor: pointer;">See All</a>
                </div>
                <br>
                 <h2 style="padding-left: 4px;">All Brands</h2>
                 <hr>
                <br>
                <div>
                <c:forEach var="brand" items="${brandsName}">
                    <a href="<spring:url value='/UserShowProductByBrand'/>?id=${brand.id}"><label style="font-size: large;font-weight: bolder;margin-left: 20px;cursor: pointer;color: black;">${brand.name}</label></a><BR></BR>
                    </c:forEach>
                    <a href="<spring:url value='/UserShowAllBrands'/>" class="btn btn-primary btn-lg" style="font-size: large;font-weight: bolder;margin-left: 20px;cursor: pointer;">See All</a>
                </div>
            </div>
    <div class="col">
    <div class="container px-4 py-4" style="margin-top: 10%;margin-left: 12%;">
        <div class="row">
        <h4>${brandID.name}</h4>
        	<c:forEach var="product" items="${data}">
          <div class="col  col-md-auto" style="min-width: 200px;"><div style="width: 200px;height: 200px;border: 1px solid black;border-radius: 10px;">
              <a href="<spring:url value='/ProductPage'/>?id=${product.id}"><img src="${pageContext.request.contextPath}/images/${product.image}" style="width: 180px;height: 180px;margin-left: 8.5px;margin-top: 8px;"></a>
          </div>
          <div>
            <label style="font-weight: bold;overflow: hidden;text-overflow: ellipsis;max-width: 80px;max-height: 50px" title="${product.name}">${product.name}</label>
            <div style="margin-top: -36px;margin-left: 140px">&#x20b9;${product.price}</div>
          </div>
          <form method="post">
        <div style="padding-top: 10px;margin-left: 8px;">
            <input type="number" max="10" min="1" value="1" name="quantity">
            <input type="hidden" value="${product.id}" name="productId">
            <input type="hidden" value="${user.id}" name="userId">
            <c:if test= "${user==null}">
            <input type="submit" value="Add to Cart" disabled="disabled" title="Login to Add to cart">
            </c:if>
            <c:if test= "${user!=null}">
            <c:if test= "${product.inStock==true}">
            <input type="submit" value="Add to Cart">
            </c:if>
            <c:if test= "${product.inStock==false}">
            <input type="submit" value="Add to Cart" disabled="disabled">
            </c:if>
            </c:if>
        </div>
        </form></div>
        </c:forEach>
        </div>
      </div>
    </div>
    <c:if test="${data.size() > 0 }">
        <div class="panel-footer" style="margin-left: 30%;margin-top: 80px">
            <ul class="pagination">
                <c:forEach begin="0" end="${totalPages-1}" var="page">
                    <li class="page-item" style="margin-left: 4px">
                        <a href="UserShowProductByBrand?pageNum=${page+1}&id=${brandID.id}" class="page-link">${page+1}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    </div>
    <footer class="bottom" role="contentinfo" style="background-color:whitesmoke;height: 386px;margin-top: 95px" >  
            <div class="footer-middle">  
            <div class="container">  
              <div class="row">  
                <div class="col-md-3 col-sm-6">  
                  <div class="footer-pad" >
                      <img src="${pageContext.request.contextPath}/images/logo.png" width="150" height="150" style="padding-top: 20px;">  
                    <h4 style="padding-top: 20px;"> About Company</h4>  
                    <label style="padding-left: 20px;">QuickMart is an online delivery platform allowing users to get fresh groceries delivered instantly.</label>
                  </div>  
                </div> 
                <div class="col-md-3 col-sm-6" style="opacity: 0;"> 
                  </div>
                <div class="col-md-3 col-sm-6">  
                  <div class="footer-pad" style="padding-top: 30px;padding-left: 20px;">  
                    <h4> QuickMart</h4>  
                    <ul class="list-unstyled">  
                      <li> <a href="#" style="color: black;font-size: large;"> Accessibility </a> </li>  
                      <li> <a href="#" style="color: black;font-size: large;"> Privacy Policy </a> </li>  
                      <li> <a href="#" style="color: black;font-size: large;">FAQs</a> </li>  
                    </ul>  
                  </div>  
                </div>  
                  <div class="col-md-3"style="padding-top: 30px;">  
                      <h4> Follow Us </h4>  
                      <ul class="list-unstyled">  
                       <li> <a href="#" class="icoFacebook" title="Facebook" style="color: black;font-size: large;">Facebook </a> </li>  
                       <li> <a href="#" class="icoLinkedin" title="Linkedin" style="color: black;font-size: large;"> YouTube </a> </li>  
              <li> <a href="#" class="fa fa-youtube" aria-hidden="true" style="color: black;font-size: large;"> Instagram </a> </li>  
                      </ul>               
              </div>  
              </div>  
              <div class="row">  
              <div class="col-md-12" style="margin-top: 60px;">  
              <p class="text-center"> © Copyright 2022 All rights reserved. </p>  
              </div>  
              </div>  
            </div>  
            </div>  
          </footer> 
</body>
</html>