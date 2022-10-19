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
    <style><%@include file="/WEB-INF/views/CdacProjectLoginPage.css"%></style> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                        <a class="nav-link" href="<spring:url value='/login'/>">Login/SignUp</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                  </ul>
              </div>
          </nav>
          </header>
            <body>
            <div class="conatiner text-center" style="border: 1px solid black;max-width: 900px;height: 240px;display:block;margin: auto;margin-top: 15%;background-color:rgba(252, 252, 252, 0.877);box-shadow:10px 10px 5px #aaaaaa;" id="OuterBox">
              <div style="padding-top: 12px;">
                <label style="font-family: 'Times New Roman', Times, serif;font-size: x-large;">Login Using Password</label>
               <br> <lable style="color: red">${message}</lable>
              </div>
              <hr>
              <form style="max-width: 300px; margin: auto; padding-top: 15px;" method="post">
                <div class="form-group row" style="border: 3px solid black; height: 50px;border-radius: 2px;">
                  <input type="password"  name="password" placeholder="Password" id="password" required autofocus style="width: 270px;;margin-left: 5px;border: none;outline: none;font-size: large;background-color:rgba(252, 252, 252, 0.877);">
              </div>
              <div class="mt-4">
              <input type="submit" class="button" value="Submit"  style="background-color: #1a73e8;border-radius: 2px; width: 150px;font-weight: bold;color: white;"></input>
            </div>
              </form>
            </div>
</body>
</html>