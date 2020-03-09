<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
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
    
<c:if test = "${requestScope.loginResult==false}">
    <script>
        alert('아이디나 비밀번호가 일치하지 않습니다');
</script>
</c:if>

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
                                <li><a href="<c:url value='/customer/getCustomerBoardList'/>">Customer</a></li>
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
                    <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Log In</h1>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
          <div class="col-md-7 mb-5">

			<form action="<c:url value='/membership/login'/>" method="post" class="p-5 bg-white">

				<div class="row form-group">
					<div class="col-md-6 mb-3 mb-md-0">
						<label class="text-black font-weight-bold" for="userId">ID</label> <input
							type="text" name="userId" class="form-control"
							autofocus="autofocus" required="required">
					</div>
					<div class="col-md-6">
						<label class="text-black font-weight-bold" for="userPw">Password</label> <input type="password" name="userPw" class="form-control" required="required">
					</div>
				</div>

				<div class="row form-group">
					<div class="col-md-12">
						<input type="submit" value="로그인" id="loginBtn" class="btn btn-primary py-2 px-4 text-white">
					</div>
				</div>
			</form>

  
          </div>
          <div class="col-md-5">
            
            <div class="p-4 mb-3 bg-white">
            <p class="mb-0 font-weight-bold"><strong>For more information please contact us through these followings</strong></p>
              <p class="mb-0 font-weight-bold">Address</p>
              <p class="mb-4">서울특별시 강남구 삼성동 159 코엑스 상사전시관 4층 ICT센터</p>

              <p class="mb-0 font-weight-bold">Phone</p>
              <p class="mb-4">+82 10-5045-8442</p>

              <p class="mb-0 font-weight-bold">Email Address</p>
              <p class="mb-0">jjth0805@gmail.com</p>

            </div>
            
          </div>
        </div>
    
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