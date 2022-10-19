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
    	            $("#submitButton").click(function()
    	            {
    	                var name=$("#name").val();
    	                var description=$("#description").val();
    	                var image=$("#image").val().split('.').pop().toLowerCase();
    	                var isValid=true;

    	                if(!name.match('^[a-zA-Z\\-\\s]{0,30}$'))
    	                {
    	                    $("#errorName").text("Invalid Name");
    	                    isValid=false;
    	                }
    	                else{
    	                    $("#errorName").text("");
    	                }
    	                if($("#image").val()=="" || $("#image").val()==null)
                    	{
                    	$("#errorImage").text("");
                    	isValid=false;
                    	}
                    else{
    	                if($.inArray(image, ['png','jpg','jpeg']) == -1)
    	                {
    	                    $("#errorImage").text("Invalid File type");
    	                        isValid=false;
    	                }
    	                else{
    	                    $("#errorImage").text("");
    	                }
                    }
    	                $("form").submit(function(e){
    	              if(isValid==true)
    	              {
    	              console.log("here");
    	              e.currentTarget.submit();
    	              }
    	              else{
    	                console.log("here not submit");
    	                e.preventDefault();
    	              }
    	            });
    	            })
    	        });
     </script>
 <style>
.error
{
color: red;
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
          <div class="container" style="margin-top: 80px;width: 500px;align-items: center;margin-left: 550px;">
<h3>Add Category</h3>
<hr>
<span>${message}</span>
<form method="post">
<div class="form-group row">
<input class="form-control" type="text" name="name" maxlength="30" id="name" required="required" autofocus="autofocus" placeholder="Enter Category Name">
<span id="errorName" class="error"></span>
</div>
<div class="form-group row">
<input class="form-control" type="file" name="image" id="image" accept="image/*"  required="required" placeholder="Enter Image">
            <label style="font-weight: bold;">Only png/jpg/jpeg allowed</label>
            <span id="errorImage" class="error"></span>
</div>
<div class="form-group row">
<textarea class="form-control" name="description" cols="5" id="description" rows="2" maxlength="200" style="width: 500px;resize: none;" placeholder="Enter Description" required="required"></textarea>
 <span id="errorDescription" class="error"></span>
 </div>
 <hr>
 <div style="margin-left: 50px">
<input class="btn btn-secondary" type="submit" id="submitButton" style="width: 400px">
</div>
</form>
</div>
</body>
</html>