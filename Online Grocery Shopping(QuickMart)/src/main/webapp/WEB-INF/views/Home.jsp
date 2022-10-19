<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   <style><%@include file="/WEB-INF/views/CdacProjectLoginPage.css"%></style> 
   <style type="text/css">
 .box
    {
            padding-top: 10px;
    }
 body{
            height: 1980px;
     }
.scrolling-wrapper{
	overflow-x: auto;
}
h1{
	font-weight: 700;
	font-size: 3.4em;
}

.subtitle{
	font-size: 1.25em;
	opacity: 0.65;
}

.card-block{
	height: 200px;
    width: 250px;
	background-color: #fff;
	border: none;
	background-position: center;
	background-size: cover;
	transition: all 0.2s ease-in-out;
	border-radius: 20px;
	
}

.card-block:hover{
		transform: translateY(-5px);
		box-shadow: none;
		opacity: 0.9;
	}
	
input[type=number]::-webkit-inner-spin-button {
    opacity: 1
}

   </style>
 </head>
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
          
     <div class="carousel-div" style="margin-top: 5%;">
        <div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2500" style="width: 1400px;margin-left: 55px;">
       <div class="carousel-indicators">
         <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" style="margin-right: 3px;"></button>
         <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1" style="margin-right: 3px;margin-left: 3px;"></button>
         <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2" style="margin-left: 3px;"></button>
       </div>
       <div class="carousel-inner">
         <div class="carousel-item active">
           <img class="d-block" src="${pageContext.request.contextPath}/images/b1.png" alt="First slide" style="height: 100%; 
           object-fit: cover;width:100%;margin: auto;">
           <div class="carousel-caption d-none d-md-block" style="color: black;">
              <h5 style="font-size: xx-large;font-weight: 800;">JackPot</h5>
              <p style="font-size: larger;font-weight: bolder;">Say hello to savings with QuickMart!</p>
           </div>
         </div>
         <div class="carousel-item">
           <img class="d-block"src="${pageContext.request.contextPath}/images/homePage.jpg" alt="Second slide" style="height: 500px; 
           object-fit: cover;width:100%;margin: auto;">
           <div class="carousel-caption d-none d-md-block" style="color: black;">
              <h5 style="font-size: xx-large;font-weight: 800;">Summer Time</h5>
              <p style="font-size: larger;font-weight: bolder;">Time to beat the heat! Shop all summer essentials items now.</p>
           </div>
         </div>
         <div class="carousel-item">
           <img class="d-block" src="${pageContext.request.contextPath}/images/homePage2.jpg" alt="Third slide" style="height: 500px; 
           object-fit: cover;width:100%;margin: auto;">
           <div class="carousel-caption d-none d-md-block" style="color: black;">
             <h5 style="font-size: xx-large;font-weight: 800;">Chinese Corner</h5>
             <p style="font-size: larger;font-weight: bolder;">Now get upto 20% off on all your Chinese carvings!</p>
          </div>
         </div>
       </div>
       <button class="carousel-control-prev" data-bs-target="#carouselExample" type="button" data-bs-slide="prev" style="background-color: transparent;border: none;">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      </button>
      <button class="carousel-control-next" data-bs-target="#carouselExample" type="button" data-bs-slide="next" style="background-color: transparent;border: none;">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
      </button>
      </div>
      </div>
      <div class="jumbotron jumbotron-fluid" style="height: 500px;background-color: white;margin-top: 20px;background-image: url('${pageContext.request.contextPath}/images/offer.png');background-repeat:no-repeat;background-position: right center;">
        <div class="container">
          <h1 class="display-4">MEGA SALE FLAT 20% OFF</h1>
          <p class="lead">Avail flat 20% off on every product.</p>
          <a class="btn btn-primary btn-lg" href="<spring:url value='/UserShowAllProducts'/>" role="button">Shop Now</a>
        </div>
      </div>
            <div id="promo" style="border: 1px solid black;box-shadow:10px 10px 10px 10px #aaaaaa;">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="box">
                        <div class="title">
                            <h3>Free Shipping</h3>
                            <p>Above &#x20b9;199</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="box">
                        <div class="title">
                            <h3>Original Products</h3>
                            <p>100% guarantee</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="box">
                        <div class="title">
                            <h3>Huge Savings</h3>
                            <p>At lowest price</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="box">
                        <div class="title">
                            <h3>Easy Returns</h3>
                            <p>No questions asked policy*</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<p></p><br>
    <div class="container-fluid">
        <h1 class="mt-5"></h1>
            <p class="subtitle">Shop By Category</p>
        <div class="row flex-row flex-nowrap mt-3 pb-3 pt-2">
                 <c:forEach var="category" items="${dataCategory}">
                <div class="col-3" style="width: 280px">
                    <div class="card card-block card-12">
                      <a href="<spring:url value='/UserShowProductByCategory'/>?id=${category.id}">  <img src="${pageContext.request.contextPath}/images/${category.image}" width="190" height="180" style="padding-top: 10px;margin-left: 30px;"> </a>
                        <div style="margin-left: 30px;padding-top: 15px">
                            <label style="font-weight: bold;overflow: hidden;text-overflow: ellipsis;width: 130px;" title="${category.name}">${category.name}</label>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div class="col-3" style="width:118px">
                    <div class="seeAll" style="margin-top: 50px;margin-left: 20px;">
                        <h1><a class="btn btn-secondary btn-lg" href="<spring:url value='/UserSeeAllCategories'/>" style="font-size: large;">See All</a></h1>
                    </div>
                </div>
        </div>
    </div>
    <br>
    <div class="container-fluid">
        <h1 class="mt-5"></h1>
            <p class="subtitle">Browse Products</p>
        <div class="row flex-row flex-nowrap mt-4 pb-4 pt-2">
                <c:forEach var="product" items="${dataProduct}">
                <div class="col-3" style="width: 280px">
                    <div class="card card-block card-12">
                    <a href="<spring:url value='/ProductPage'/>?id=${product.id}"> <img src="${pageContext.request.contextPath}/images/${product.image}"" width="190" height="150" style="padding-top: 10px;margin-left: 30px;"> </a>
                        <div class="details" style="margin-left: 30px;padding-top: 15px">
                           <label style="font-weight: bold;overflow: hidden;text-overflow: ellipsis;max-width: 80px;max-height: 50px" title="${product.name}">${product.name}</label>
            <div style="margin-top: -36px;margin-left: 140px">&#x20b9;${product.price}</div>
                        </div>
                        <br>
                        <form method="post">
        <div style="padding-top: 10px;margin-left: 30px;margin-top:-15px">
            <input type="number" max="10" min="1" value="1" name="quantity">
            <input type="hidden" value="${product.id}" name="productId">
            <input type="hidden" value="${user.id}" name="userId">
            <c:if test= "${user==null}">
            <input type="submit" value="Add to Cart" disabled="disabled" title="Login to add to cart">
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
        </form>
                    </div>
                </div>
                </c:forEach>
                <div class="col-3" style="width:118px">
                    <div class="seeAll" style="margin-top: 50px;margin-left: 20px;">
                        <h1><a class="btn btn-secondary btn-lg"  href="<spring:url value='/UserShowAllProducts'/>" style="font-size: large;">See All</a></h1>
                    </div>
                </div>
        </div>
    </div><br><br><br><br><br>
    <section class="bottom" style="margin-top: 50px">
        <footer class="bottom" role="contentinfo" style="background-color:whitesmoke;height: 400px;" >  
            <div class="footer">  
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
    </section>
</body>
</html>