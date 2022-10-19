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
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style><%@include file="/WEB-INF/views/CdacProjectLoginPage.css"%></style> 

    <script>
      var mouse_is_inside = false;

$(document).ready(function()
{
    $('#phone').hover(function(){ 
        mouse_is_inside=true; 
    }, function(){ 
        mouse_is_inside=false; 
    });

    $("body").click(function(){ 
        if(! mouse_is_inside) 
        {
          $("#country-code").css('border','2px solid black');
          $("#country-code").css('border-radius','2px');
        }
        else{
          $("#country-code").css('border','3px solid rgb(192, 88, 56)');
          $("#country-code").css('border-radius','8px');
        }
    });
});

$(document).on('keyup change', '#phone', function(){
    var value = $("#phone").val();
    if(value.length>9 && !isNaN(value)) {
    $('.button').removeAttr('disabled');
    $(".button").css('background-color','#1a73e8');
    $(".button").css("cursor", "pointer");
    }
    else{
      $('.button').attr('disabled', true); 
      $(".button").css('background-color','rgba(179, 179, 196, 0.85)');
      $(".button").css("cursor", "not-allowed");
    }
});


      
    </script>
</head>
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
                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value='/login'/>">Login/SignUp</a>
                </li>
              </ul>
          </div>
      </nav>
      </header>
        <body>
        <div class="conatiner text-center" style="border: 1px solid black;max-width: 900px;height: 220px;display:block;margin: auto;margin-top: 15%;background-color:rgba(252, 252, 252, 0.877);box-shadow:10px 10px 5px #aaaaaa;" id="OuterBox">
          <div style="padding-top: 12px;">
            <label style="font-family: 'Times New Roman', Times, serif;font-size: x-large;">Enter phone number to Login/Sign-Up</label>
          </div>
          <hr>
          <form style="max-width: 300px; margin: auto; padding-top: 15px;" method="post">
            <div class="form-group row" id="country-code" style="border: 3px solid black; height: 50px;border-radius: 2px;">
              <input type="tel"  name="number" placeholder="Phone Number" id="phone" maxlength="10" required style="width: 270px;;margin-left: 35px;border: none;outline: none;font-size: large;background-color:rgba(252, 252, 252, 0.877);">
          </div>
          <div class="mt-4">
          <input type="submit" class="button" value="Submit"  style="background-color: rgba(179, 179, 196, 0.85);border-radius: 2px; width: 150px;font-weight: bold;color: white;cursor: not-allowed;" disabled></input>
        </div>
          </form>
        </div>
   <footer class="bottom" role="contentinfo" style="background-color:whitesmoke;height: 386px;margin-top: 200px" >  
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