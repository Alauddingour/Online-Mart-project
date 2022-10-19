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
      <style><%@include file="/WEB-INF/views/AdminCss.css"%></style>
      <script type="text/javascript">
      $(function()
    		  {
    	  $("#searchButton").click(function()
    			  {
    		     $('#product').find('option').each(function() {
      		               if($(this).text()==$("#browser").val())
      		            	   {
      		            	     var id= $(this).data("value");
      		            	   window.location="<spring:url value='/searchProduct'/>?id="+id;
      		            	   }
      		          });
    			  })
    	 
    		  })
      </script>
      <style type="text/css">
      body
      {
      width: 100%;
      }
      .text
      {
      overflow: hidden;
      text-overflow: ellipsis;
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
              <div class="dropdown nav-item">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  PRODUCT
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="<spring:url value='/showProductsPages'/>" style="width: 300px;border: 1px solid black;">All Products</a>
                  <a class="dropdown-item" href="<spring:url value='/addProduct'/>" style="width: 300px;border: 1px solid black;">Add Product</a>
                </div>
                </div>
                <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                    CATEGORY
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="<spring:url value='/showCategoryPages'/>" style="width: 300px;border: 1px solid black;">All Categories</a>
                    <a class="dropdown-item" href="<spring:url value='/addnewCategory'/>" style="width: 300px;border: 1px solid black;">Add Category</a>
                  </div>
                </div>
                <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                    BRANDS
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="<spring:url value='/showBrandPages'/>" style="width: 300px;border: 1px solid black;">All Brands</a>
                    <a class="dropdown-item" href="<spring:url value='/addnewBrand'/>" style="width: 300px;border: 1px solid black;">Add Brand</a>
                  </div>
                </div>
                <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                    ORDERS
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" >
                    <a class="dropdown-item" href="<spring:url value='/PendingOrders'/>" style="width: 300px;border: 1px solid black;">Pending Orders</a>
                    <a class="dropdown-item" href="<spring:url value='/PreviousOrders'/>?id=${user.id}" style="width: 300px;border: 1px solid black;">Previous Orders</a>
                  </div>
                </div> 
                <div class="collapse navbar-collapse" id="toggleContents">
                  <ul class="navbar-nav ms-auto"><!--ml auto push the toggle contents as suppose to in the right when device width is collapsed-->
                    <li class="nav-item">
                        <a class="nav-link" href="<spring:url value='/AdminDashboard'/>">Dashboard</a>
                    </li>
                  </ul>
              </div>
              <div class="collapse navbar-collapse" id="toggleContents">
                  <ul class="navbar-nav ms-auto"><!--ml auto push the toggle contents as suppose to in the right when device width is collapsed-->
                    <li class="nav-item">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;border-radius: 10px;font-family: 'Times New Roman', Times, serif;
                            font-weight:light;
                            font-size: large;border: transparent;width: 80px">
                              ${admin.firstName}
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                              <a class="dropdown-item" href="<spring:url value='/logout'/>">Logout</a>
                            </div>
                          </div>
                    </li>
                  </ul>
                </div>
          </nav>
          </header>
          <div class="container" style="margin-top: 60px;margin-left: -1px">
          <div>
<h3 class="text-center">All Products</h3>
<div style="margin-left: 800px">
<input  list="products" name="products" id="browser" placeholder="Search Products..." style="width: 400px;border-radius: 8px" list="products"> 
 <datalist id="products">
 <select id="product">
    <c:forEach items="${allProducts}" var="product">
        <option data-value="${product.id}" value="${product.name}">${product.name}</option>
    </c:forEach>
</select>
  </datalist>
  <input type="submit" value="Search" id="searchButton">
  </div>
  <div style="color: red">
  ${message}
  </div>
</div>
	<table class="table table-hover table-bordered" style="border: 1px solid black;margin-top: 20px;">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>Product Description&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>Image</th>
						<th>Price (&#x20b9;)</th>
						<th>Availability</th>
						<th>Brand Name</th>
						<th>Category Name</th>
						<th >Product Added</th>
						<th>Product Last Modified</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
        <c:when test="${data.size() > 0 }">
				<c:forEach var="product" items="${data}">
						<tr>
							<td>${product.id}</td>
							<td>${product.name}</td>
							<td >${product.description}</td>
							<td>
          <img src="${pageContext.request.contextPath}/images/${product.image}" width="70" style="margin-top: 20px" height="90" class="img img-responsiive" />
          </td>
          					<td class="text">${product.price}</td>
          					<c:if test= "${product.inStock==true}">
							<td class="text" style="color: green">Available</td>
							</c:if>
							<c:if test= "${product.inStock==false}">
							<td class="text" style="color: red">Unavailable</td>
							</c:if>
							<td >${product.brands.name}</td>
							<td >${product.category.name}</td>
							<td>${product.added_time}</td>
						    <td >${product.last_modified}</td>
						    <td style="padding-left: 10px"><a class="btn btn-secondary" href = "<spring:url value='/editProduct'/>?id=${product.id}">Edit</a></td>
						    <td style="padding-left: 10px"><a class="btn btn-secondary" style="background-color: red" href = "<spring:url value='/deleteProduct'/>?id=${product.id}">Delete</a></td>
						    <c:if test= "${product.inStock==true}">
						    <td style="padding-left: 10px"><a class="btn btn-secondary" href = "<spring:url value='/changeAvailability'/>?id=${product.id}">Make Unavailable</a></td>
						    </c:if>
						    <c:if test= "${product.inStock==false}">
						    <td style="padding-left: 10px"><a class="btn btn-secondary" href = "<spring:url value='/changeAvailabilityAvailable'/>?id=${product.id}">Make Available</a></td>
						    </c:if>
						    
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
            <tr align="center">
                <td colspan="5">No Products available</td>
            </tr>
        </c:otherwise>
    </c:choose>
				</tbody>
			</table>
			<c:if test="${data.size() > 0 }">
        <div class="panel-footer">
            <ul class="pagination">
                <c:forEach begin="0" end="${totalPages-1}" var="page">
                    <li class="page-item">
                        <a href="showProductsPages?pageNum=${page+1}" class="page-link">${page+1}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    </div>
</body>
</html>