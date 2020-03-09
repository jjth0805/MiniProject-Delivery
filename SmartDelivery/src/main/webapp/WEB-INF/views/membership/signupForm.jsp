<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Delivery Signup Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
    <link rel="stylesheet" href="<c:url value='/resources/fonts/icomoon/style.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/magnific-popup.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.theme.default.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-datepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/fonts/flaticon/font/flaticon.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/css/aos.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    

<script>
    function idCheckForm(){
        open("<c:url value='/membership/idCheckForm'/>","_blank", "width=400, height=300");
        }
    function pwCheck(){
    	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    	var pw1 = $("#userPw1").val();
        var pw2 = $("#userPw2").val();
        if(pw1.trim().length == 0){
            $("#pwMsg").text("");
            return false;
        }else if(reg.test(pw1) == false){
        	$("#pwMsg").text("비밀번호는 공백없이 8자 이상이어야 하며, 숫자,대문자,소문자,특수문자를 모두 포함해야 합니다");
    	   return false;
        }else if(reg.test(pw1) == true && pw2.trim().length == 0){
        	$("#pwMsg").text("");
            return false;
        }else if(reg.test(pw1) == true && pw1 != pw2){
            $("#pwMsg").text("비밀번호가 일치하지 않습니다");
            return false;
        }else{
            console.log("통과");
            $("#pwMsg").text("");
            return true;
        }
    }
</script>
  </head>
  <body>
    <div class="site-wrap">

        <div class="site-mobile-menu">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>

        <header class="site-navbar py-3" role="banner">

            <div class="container">
                <div class="row align-items-center">

                    <div class="col-11 col-xl-2">
                        <h1 class="mb-0">
                            <a href="<c:url value='/'/>" class="text-white h2 mb-0">Smart Delivery System</a>
                        </h1>
                    </div>
                    <div class="col-12 col-md-10 d-none d-xl-block">
                        <nav class="site-navigation position-relative text-right" role="navigation">

                            <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                                <li><a href="<c:url value='/'/>">Home</a></li>
                                <li class="has-children"><a>Membership</a>
                                    <ul class="dropdown">
                                        <c:choose>
                                            <c:when test="${sessionScope.userId==null}">
                                                <li><a href="<c:url value='/membership/signupForm'/>">Sign Up</a></li>
                                                <li><a href="<c:url value='/membership/loginForm'/>">Log In</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a href="<c:url value='/membership/logout'/>">Log Out</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul></li>
                                <li><a href="<c:url value='/deliveryInfo/deliveryCheck'/>">Tracking</a></li>
                                <li><a href="<c:url value='/board/getBoardList'/>">Notice</a></li>
                                <li><a href="<c:url value='/deliveryInfo/deliveryCustomer'/>">Customer</a></li>
                            </ul>
                        </nav>
                    </div>

                    <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;">
                        <a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a>
                    </div>
                </div>
            </div>
        </header>
    </div>

    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(../resources/images/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
            <div
                class="row align-items-center justify-content-center text-center">

                <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
                    <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Sign Up</h1>
                </div>
            </div>
        </div>
    </div>
	<form action="<c:url value='/membership/signup'/>" method="post" class="p-5 bg-white" onsubmit="return pwCheck()">

		<div class="row form-group">
			<div class="col-md-6 mb-3 mb-md-0">
				<label class="text-black" for="userId">ID</label>
				    <input type="text" id="userId" name="userId" class="form-control" placeholder="중복을 확인하세요"required="required" readonly="readonly"> 
				    <input type="button" value="중복확인" onclick="idCheckForm()" class="btn btn-primary py-2 px-4 text-white">
			</div>
			<div class="col-md-6">
				<label class="text-black" for="userPw">Password</label> 
				    <input type="password" name="userPw" id="userPw1" onkeyup="pwCheck()" class="form-control" placeholder="숫자 및 영문 혼합 8자이상" required="required"> 
				<label class="text">Password 확인</label> 
				    <input type="password" id="userPw2" onkeyup="pwCheck()" class="form-control" placeholder="숫자 및 영문 혼합 8자이상" required="required">
				    <span style="color:red" id = "pwMsg"></span>
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-6">
				<label class="text-black" for="userEmail">Email</label>
				<input type="email" id ="userEmail" name="userEmail" class="form-control" required="required">
			</div>
		</div>
		
		<div class="row form-group">
			<div class="col-md-12">
				<input type="submit" value="회원가입 완료" id="signupBtn" class="btn btn-primary py-2 px-4 text-white" disabled="disabled">
			</div>
		</div>
	</form>
	
	 <footer class="site-footer">
       <p align="center">
       Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
       </p>
    </footer>
	
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-migrate-3.0.1.min.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/resources/js/popper.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='/resources/js/jquery.stellar.min.js'/>"></script>
<script src="<c:url value='/resources/js/jquery.countdown.min.js'/>"></script>
<script src="<c:url value='/resources/js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap-datepicker.min.js'/>"></script>
<script src="<c:url value='/resources/js/aos.js'/>"></script>

<script src="<c:url value='/resources/js/main.js'/>"></script>
</body>
</html>