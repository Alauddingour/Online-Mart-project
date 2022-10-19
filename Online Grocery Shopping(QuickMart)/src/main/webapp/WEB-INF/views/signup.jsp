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
    <title>SignUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <style><%@include file="/WEB-INF/views/CdacProjectLoginPage.css"%></style> 

    <script>
      $(function()
      {
        $("#next").click(function()
        {
          var checkAll=true;
          var isValid=true;
          var firstName=$("#firstName").val();
          var lastName=$("#lastName").val();
          var email=$("#email").val();
          var password=$("#password").val();
          var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
          var passwordRegex=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/
          if((firstName=="" || firstName==null)  && (lastName==""|| lastName==null ) && (email=="" || email==null) && (password=="" || password==null))
          {
            $("#firstName").focus();
            var checkAll=false;
            isValid=false;
          }
          else{
          if(firstName=="" || firstName==null || !firstName.match('^[a-zA-Z]{3,16}$') && checkAll==true)
          {
            $("#firstName").focus();
            $("#errorFirstname").text("Invalid First Name");
            isValid=false;
            var validFirstName=false;
          }
          else{
            validFirstName=true;
            $("#errorFirstname").text("");
          }
          if(lastName=="" || lastName==null || !lastName.match('^[a-zA-Z]{2,10}$') && checkAll==true)
          {
            if(validFirstName==true)
            {
            $("#lastName").focus();
            $("#errorLastname").text("Invalid Last Name");
            isValid=false;
            var validLastName=false;
          }
            else{
              $("#errorLastname").text("");
            }
          }
          else{
            validLastName=true;
            $("#errorLastname").text("");
          }

         if(email=="" || email==null || !email.match(regex) && checkAll==true)
          {
            if(validFirstName==true && validLastName==true)
            {
            $("#email").focus();
            $("#errorEmail").text("Invalid Email");
            isValid=false;
            var validEmail=false;
            }
            else{
              $("#errorEmail").text("");
            }
          }
          else{
            validEmail=true;
            $("#errorEmail").text("");
          }
          if(password=="" || password==null || !password.match(passwordRegex) && checkAll==true)
          {
            if(validFirstName==true && validLastName==true && validEmail==true)
            {
            $("#password").focus();
            $("#errorPassword").text("1 Capital,1 Small and 1 Number");
            isValid=false;
            }
            else{
              $("#errorPassword").text("");
            }
          }
        }

          if(isValid==true)
          {
            $("#errorFirstname").text("");
            $("#errorLastname").text("");
            $("#errorEmail").text("");
            $("#errorPassword").text("");
          $("#cardActive").css({"visibility": "hidden", "position": "absolute","top":"9999px"});
          $("#card").css({"visibility": "visible", "position": "static"});
          }
          else{
            $("#card").css({"visibility": "hidden", "position": "absolute","top":"9999px"});
          $("#cardActive").css({"visibility": "visible", "position": "static"});
          }
        });

        $("#previous").click(function()
        {
          $("#card").css({"visibility": "hidden", "position": "absolute","top":"9999px"});
          $("#cardActive").css({"visibility": "visible", "position": "static"});
        });

        
        $("#submitButton").click(function()
        {
          var checkAll2=true;
          var isValid2=true;
          var address=$("#address").val();
          var city=$("#city").val();
          var state=$("#state").val();
          var pinCode=$("#pin").val();
          var pinCodeRegex=/^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$/
          var addressRegex=/^[a-zA-Z0-9,/.\-\s]{10,150}$/

          if((address=="" || address==null)&&(city=="" ||city==null)&&(state=="" || state==null)&&(pinCode=="" || pinCode==null))
          {
            $("#address").focus();
            isValid2=false;
            checkAll2=false;
          }
          else{
            if(address=="" || address==null || !address.match(addressRegex)  && checkAll2==true)
            {
              $("#address").focus();
              $("#errorAddress").text("Invalid Address");
              var validAddress=false;
              isValid2=false;
            }
            else{
              $("#errorAddress").text("");
              validAddress=true;
            }
            if(city=="" ||city==null || !city.match('^[a-zA-Z]{2,16}$') && checkAll2==true)
            {
              if(validAddress==true)
              {
                $("#city").focus();
                $("#errorCity").text("Invalid City Name");
                var validCity=false;
                isValid2=false;
              }
              else{
                $("#errorCity").text("");
              }
            }
            else{
              $("#errorCity").text("");
              validCity=true;
            }
            if(state=="" || state==null || !state.match('^[a-zA-Z]{2,16}$') && checkAll2==true)
            {
              if(validAddress==true && validCity==true)
              {
                $("#state").focus();
                $("#errorState").text("Invalid State Name");
                var validState=false;
                isValid2=false;
              }
              else{
                $("#errorState").text("");
              }
            }
            else{
              $("#errorState").text("");
              validState=true;
            }
            if(pinCode=="" || pinCode==null || !pinCode.match(pinCodeRegex) && checkAll2==true)
            {
              if(validAddress==true && validCity==true && validState==true)
              {
                $("#pin").focus();
                $("#errorPin").text("Invalid Pin Code");
                isValid2=false;
              }
              else{
                $("#errorPin").text("");
              }
            }
          }
            $("form").submit(function(e){
              if(isValid2==true)
              {
              console.log("here");
            $("#errorPin").text("");
           e.currentTarget.submit();
              }
              else{
                console.log("here not submit");
            e.preventDefault();
              }
            });
        });
      });
    </script>
</head>
<style>
  #card
  {
    visibility: hidden;
    position: absolute;
    top: -9999px;
  }
  #cardActive
  {
    visibility: visible;
    position: static;
  }
  .error
  {
    color: red;
    font-size: medium;
    margin-left: 60px;
  }
  
</style>
<body >
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
  <div class="conatiner text-center" id="cardActive" style="border: 1px solid black;max-width: 900px;height: 500px;display:block;margin: auto;margin-top: 10%;background-color:rgba(252, 252, 252, 0.877);box-shadow:10px 10px 5px #aaaaaa;">
    <div>
      <label style="font-family: 'Times New Roman', Times, serif;font-size: x-large;">Sign-Up</label><br>
      <label style="font-weight: bold;">Step 1</label>
    </div>
    <hr>
    <form style="max-width: 300px; margin: auto; padding-top: 15px;" method="post"  id="formSubmit">
      <div class="step">
        <div class="form-group row">
            <label style="font-weight: bolder;font-size: 15px;">First Name</label>
            <input type="text" class="form-control" name="firstName" style="width: 200px;border-radius: 5px;margin-left: 20%;" id="firstName" autofocus>
            <span id="errorFirstname" class="error"></span>
        </div>
        <div class="form-group row">
            <label style="font-weight: bolder;font-size: 15px;">Last Name</label>
            <input type="text" class="form-control" name="lastName" style="width: 200px;border-radius: 5px;margin-left: 20%;" id="lastName" required>
            <span id="errorLastname" class="error"></span>
        </div>
        
        <div class="form-group row">
        <label style="font-weight: bolder;font-size: 15px;" >Email</label>
        <input type="email" class="form-control" name="email" style="width: 200px;border-radius: 5px;margin-left: 20%;" required id="email">
        <span id="errorEmail" class="error"></span>
        </div>
        <div class="form-group row">
            <label style="font-weight: bolder;font-size: 15px;" >Password</label>
            <input type="password" class="form-control" name="password" style="width: 200px;border-radius: 5px;margin-left: 20%;" id="password">
            <span id="errorPassword" class="error"></span>
            </div>
        <div class="form-group row">
            <label style="font-weight: bolder;font-size: 15px;" >Phone Number</label>
            <input type="text" class="form-control" value="${number}" name="number" style="width: 200px;border-radius: 5px;margin-left: 20%;" readonly>
            </div>
            <input type="hidden" name="role" value="CUSTOMER">
        </div>
        <div class="mt-4">
          <input type="button" id="next" value="Next">
        </div>
   </div>
      <div class="conatiner text-center" id="card" style="border: 1px solid black;max-width: 900px;height: 450px;display:block;margin: auto;margin-top: 10%;background-color:rgba(252, 252, 252, 0.877);box-shadow:10px 10px 5px #aaaaaa;">
        <div>
          <label style="font-family: 'Times New Roman', Times, serif;font-size: x-large;">Sign-Up</label><br>
          <label style="font-weight: bold;">Step 2</label>
        </div>
        <hr>
<div class="step">
  <div class="form-group row">
    <label style="font-weight: bolder;font-size: 15px;" >Address</label>
    <textarea name="address"  cols="5" id="address" maxlength="150" rows="2" style="width: 300px;margin-left: 34%;resize: none;"></textarea>
    <span id="errorAddress" class="error"></span>
    </div>
    <div class="form-group row">
      <label style="font-weight: bolder;font-size: 15px;" >City</label>
      <input type="text" class="form-control" name="city" id="city" style="width: 200px;border-radius: 5px;margin-left: 39%;">
      <span id="errorCity" class="error"></span>
      </div>
      <div class="form-group row">
        <label style="font-weight: bolder;font-size: 15px;" >State</label>
        <input type="text" class="form-control" name="state" id="state" style="width: 200px;border-radius: 5px;margin-left: 39%;">
        <span id="errorState" class="error"></span>
        </div>
        <div class="form-group row">
          <label style="font-weight: bolder;font-size: 15px;" >Pin Code</label>
          <input type="text" class="form-control" name="pin" id="pin" maxlength="6" style="width: 200px;border-radius: 5px;margin-left: 39%;">
          <span id="errorPin" class="error"></span>
          </div>
    <div class="mt-4">
      <input type="button" id="previous" value="Previous" style="margin-right: 3px;">
    <input type="submit" class="btn-primary" value="Submit" id="submitButton" style="background-color: #1a73e8;border-radius: 2px; width: 100px;margin-left: 3px;"></input>
  </div>
</div>
</div>
    </form>
  </div>
  </body>
</html>
</body>
</html>