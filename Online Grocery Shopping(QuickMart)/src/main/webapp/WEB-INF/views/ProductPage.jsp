<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
.my_img {
    vertical-align: middle;
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
    height: 100%;
}
.section-bg {
    height: 550px;
}
section {
    padding: 60px 0;
}
.row-sm .col-md-6 {
    padding-left: 5px;
    padding-right: 5px;
}

body{
	font-family: 'system-ui';
	height: 1500px;
}

h1{
	font-weight: 700;
	font-size: 3.4em;
}

.card-block{
	height: 200px;
    width: 300px;
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

.subtitle
{
font-weight: bolder;
font-style: italic;
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
<section id="services" class="services section-bg">
        <div class="container-fluid">
          <div class="col-sm-12 text-center mb-4">
          </div>
           <div class="row row-sm" style="height: 450px">
              <div class="col-md-6" >
                 <img src="${pageContext.request.contextPath}/images/${product.image}" style="width: 500px;margin-left: 60px;height: 460px">
              </div>
              <div class="col-md-6">
                 <div class="product-detail-content">
                    <p class="name" style="font-size: x-large;overflow: hidden;text-overflow: ellipsis;">${product.name}</p>
                       <div class="price">
                     <span style="font-weight: bold;">M.R.P</span>  <span style="color: red;font-size: larger;font-style: italic;"><i class="fa fa-inr"></i> <del>&#x20b9;${originalValue}</del>   </span>
                          <span class="price" style="font-size:larger;color: green;font-weight: bolder;">&#x20b9;${product.price}</span>
                       </div>
                       <div class="p-cart" style="margin-top: 15px">
                             <div class="p-add-cart">
                       <form method="post">
        <div>
            <input type="number" max="10" min="1" value="1" name="quantity">
            <input type="hidden" value="${product.id}" name="productId">
            <input type="hidden" value="${user.id}" name="userId">
            <c:if test= "${user==null}">
             <span>Add Quantity</span>
            <input type="submit" value="Add to Cart" disabled="disabled" title="Login to add to cart" style="margin-left: 10px">
            </c:if>
            <c:if test= "${user!=null}">
            <c:if test= "${product.inStock==true}">
             <span>Add Quantity</span>
            <input type="submit" value="Add to Cart" style="margin-left: 10px">
            </c:if>
            <c:if test= "${product.inStock==false}">
            <input type="submit" value="Add to Cart" disabled="disabled" style="margin-left: 10px">
            </c:if>
            </c:if>
            <c:if test= "${product.inStock==false}">
            <span style="color: red;margin-left: 20px">Product currently unavailable</span>
            </c:if>
        </div>
        </form>
                             </div>
                          </div>
                          <div class="brand-info" style="margin-top: 20px">
                          <h4>Brand</h4><lable>${product.brands.name}</lable>
                          </div>
                        <div class="p-description" style="margin-top: 20px;height: 160px">
                          <h4> Description About this product:-</h4>
                          <span style="color: black">${product.description}</span>                      
                       </div>
                    </div>
                 </div>
              </div>
           </div>
        </div>
     </section>
     <hr>
     <div class="container-fluid">
        <h1 class="mt-5"></h1>
            <p class="subtitle">Similar Products</p>
            
        <div class="row flex-row flex-nowrap mt-3 pb-3 pt-2">
        <c:forEach var="c" items="${categories}">
                <div class="col-3" style="width: 280px">
                     <div class="card card-block card-12">
                    <a href="<spring:url value='/ProductPage'/>?id=${c.id}"> <img src="${pageContext.request.contextPath}/images/${c.image}" width="190" height="150" style="padding-top: 10px;margin-left: 30px;"> </a>
                        <div class="details" style="margin-left: 30px;padding-top: 15px">
                           <label style="font-weight: bold;overflow: hidden;text-overflow: ellipsis;max-width: 80px;max-height: 50px" title="${c.name}">${c.name}</label>
            <div style="margin-top: -36px;margin-left: 140px">&#x20b9;${c.price}</div>
                        </div>
                        <br>
                        <form method="post">
        <div style="padding-top: 10px;margin-left: 30px;margin-top:-15px">
            <input type="number" max="10" min="1" value="1" name="quantity">
            <input type="hidden" value="${c.id}" name="productId">
            <input type="hidden" value="${user.id}" name="userId">
            <c:if test= "${user==null}">
            <input type="submit" value="Add to Cart" disabled="disabled" title="Login to add to cart">
            </c:if>
            <c:if test= "${user!=null}">
            <c:if test= "${c.inStock==true}">
            <input type="submit" value="Add to Cart">
            </c:if>
            <c:if test= "${c.inStock==false}">
            <input type="submit" value="Add to Cart" disabled="disabled">
            </c:if>
            </c:if>
        </div>
        </form>
                    </div>
                    </div>
                    </c:forEach>
                <div class="col-3" style="width:105px">
                    <div class="seeAll" style="margin-top: 50px;margin-left: 20px;">
                        <h1><a class="btn btn-secondary" href="<spring:url value='/UserShowProductByCategory'/>?id=${product.category.id}" style="font-size: large;">See All</a></h1>
                    </div>
                </div>
        </div>
        </div>
        <br>
    <div class="container-fluid">
        <h1 class="mt-5"></h1>
            <p class="subtitle">Products From Same Brand</p>
             </div>
        <div class="row flex-row flex-nowrap mt-4 pb-4 pt-2">    
         <c:forEach var="brand" items="${brands}">
                <div class="col-3" style="width: 280px">
                    <div class="card card-block card-12">
                    <a href="<spring:url value='/ProductPage'/>?id=${brand.id}"> <img src="${pageContext.request.contextPath}/images/${brand.image}" width="190" height="150" style="padding-top: 10px;margin-left: 30px;"> </a>
                        <div class="details" style="margin-left: 30px;padding-top: 15px">
                           <label style="font-weight: bold;overflow: hidden;text-overflow: ellipsis;max-width: 80px;max-height: 50px" title="${brand.name}">${brand.name}</label>
            <div style="margin-top: -36px;margin-left: 140px">&#x20b9;${brand.price}</div>
                        </div>
                        <br>
                        <form method="post">
        <div style="padding-top: 10px;margin-left: 30px;margin-top:-15px">
            <input type="number" max="10" min="1" value="1" name="quantity">
            <input type="hidden" value="${brand.id}" name="productId">
            <input type="hidden" value="${user.id}" name="userId">
            <c:if test= "${user==null}">
            <input type="submit" value="Add to Cart" disabled="disabled" title="Login to add to cart">
            </c:if>
            <c:if test= "${user!=null}">
            <c:if test= "${brand.inStock==true}">
            <input type="submit" value="Add to Cart">
            </c:if>
            <c:if test= "${brand.inStock==false}">
            <input type="submit" value="Add to Cart" disabled="disabled">
            </c:if>
            </c:if>
        </div>
        </form>
                    </div>
                </div>
                </c:forEach>
                <div class="col-3" style="width:105px;">
                    <div class="seeAll" style="margin-top: 50px;margin-left: 20px;">
                        <h1><a class="btn btn-secondary" href="<spring:url value='/UserShowProductByBrand'/>?id=${product.brands.id}" style="font-size: large;">See All</a></h1>
                    </div>
                </div>
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