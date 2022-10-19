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
          <div style="margin-top: 100px">
 <c:if test= "${empty cartItems}">
 <div class="img-fluid" style="margin-left: 40%;margin-top: 20%">
 <lable>There are no items in your cart....</lable><img src="${pageContext.request.contextPath}/images/empty.png" style="width:200px">
 <br>
 <a href="<spring:url value='/UserShowAllProducts'/>" class="btn btn-primary" style="margin-left: 40px">Add Items</a>
 </div> 
				 </c:if>
				 <c:if test= "${!empty cartItems}">
				 <h3 class="text-center"> Your Cart</h3>
				 </c:if>
<c:if test= "${!empty cartItems}">
<div class="container table-responsive py-5">
	<table id="example" class="table table-bordered table-hover text-center" style="width: 1000px;margin-left: 12%;margin-top: -35px">
				<thead>
					<tr>
						<th>Item</th>
                        <th style="padding-left: 40px">Quantity</th>
                        <th style="padding-left: 40px">&#x20b9;Price</th>
                        <th style="padding-left: 20px">Action</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${cartItems}">
						<tr>
						 <td><a href="<spring:url value='/ProductPage'/>?id=${item.product.id}">
          <img src="${pageContext.request.contextPath}/images/${item.product.image}" width="100" height="150" class="img-fluid" /></a>
          <br>${item.product.name}</td>
							<td style="padding-left: 55px;">${item.quantity}
							<div style="margin-top: 10px">
							<a class="btn btn-primary" href="<spring:url value='/addQuantity'/>?id=${item.id}" style="width: 25px;height: 25px;text-align:center; vertical-align:middle;padding: 0px;margin-right: 8px;background-color: black;">+</a>
							<a class="btn btn-primary" href="<spring:url value='/removeQuantity'/>?id=${item.id}" style="width: 25px;height: 25px;text-align:center; vertical-align:middle;padding: 0px;background-color: black;">-</a>
							</div>
							</td>
          					<td style="padding-left: 40px">${item.product.price}</td>
						    <td style="padding-left: 10px"><a class="btn btn-primary" style="margin-top: 60px;width: 80px;background-color: black"  href = "<spring:url value='/deleteCartItem'/>?id=${item.id}">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot style="background-color:white;">
      	<tr>
      		<td><b>Total</b></td>
      		<td style="padding-left: 50px"><b>${total_quantity}</b></td>
      		<td style="padding-left: 30px"><b>&#x20b9;${total_price}</b></td>
      		<td style="padding-left: 30px"><b><a class="btn btn-primary" href="<spring:url value='/checkOut'/>?check=1">Check Out</a></b></td>
<td>
</td>
      	</tr>
      </tfoot>
			</table>
			</div>
			     	</c:if>
			</div>
</body>
</html>