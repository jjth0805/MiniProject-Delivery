<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Smart Delivery System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
    <link rel="stylesheet" href="<c:url value='/resources/fonts/icomoon/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/magnific-popup.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/fonts/flaticon/font/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/aos.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    
</head>

<c:if test = "${requestScope.signupResult==true}">
    <script>
        alert('회원가입 성공');
</script>
</c:if>

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

<div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(resources/images/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="row align-items-center justify-content-center text-center">
			<div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
			<h1 class="text-white font-weight-light text-uppercase font-weight-bold">WE DELIVER SMART</h1>
				<c:choose>
					<c:when test="${sessionScope.userId==null}">
						<p>
							<a href="<c:url value='/membership/signupForm'/>" class="btn btn-primary py-3 px-5 text-white">Register Now!</a><br></br>
							<a href="<c:url value='/membership/loginForm'/>">Log In</a>
						</p>
					</c:when>
					<c:otherwise>
						<h2 class="text-white font-weight-light text-uppercase">Welcome ${sessionScope.userId} !</h2><br>
						<p>
                            <a href="<c:url value='/deliveryInfo/deliveryCheck'/>" class="btn btn-primary py-3 px-5 text-white">Tracking</a>
							<a href="<c:url value='/board/getBoardList'/>" class="btn btn-primary py-3 px-5 text-white">Notice</a> 
                            <a href="<c:url value='/customer/getCustomerBoardList'/>" class="btn btn-primary py-3 px-5 text-white">Customer</a>
						</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

	<div class="site-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-5 ml-auto mb-5 order-md-2" data-aos="fade">
					<img src="resources/images/img_1.jpg" alt="Image" class="img-fluid rounded">
				</div>
					<div class="col-md-6 order-md-1" data-aos="fade">
						<div class="text-left pb-1 border-primary mb-4">
							<h2 class="text-primary">Our Service</h2>
						</div>
							<p>국내 택배회사 배송 추적 시스템 
								<br>현재 71개사 택배사 추적 가능
								<br>Tracking을 이용해 택배를 확인하세요
								<br>추가적인 공지는 Notice을 확인하세요
								<br>에러 및 건의 사항은 Customer에 글을 남겨 주세요
							</p>
					
					<p class="mb-5"></p>
					<div class="row">
						<div class="col-md-12 mb-md-5 mb-0 col-lg-6">
							<div class="unit-4">
								<div class="unit-4-icon mb-3 mr-4">
									<span class="text-primary flaticon-frontal-truck"></span>
								</div>
									<div>
										<h3>국내 택배 배송 추적</h3>
											<p>71개사 택배 추적 기능</p>
											<p class="mb-0">
												<a href="<c:url value='/deliveryInfo/deliveryCheck'/>">배송추적 바로가기</a>
										</p>
									</div>
								</div>
							</div>
						<div class="col-md-12 mb-md-5 mb-0 col-lg-6">
							<div class="unit-4">
								<div class="unit-4-icon mb-3 mr-4">
									<span class="text-primary flaticon-travel"></span>
								</div>
								<div>
									<h3>국제택배 배송 추적</h3>
									<p>추후 업데이트 예정</p>
									<p class="mb-0">
										<a href="#">배송 추적 바로가기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
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
<script src="<c:url value='/resources/js/aos.js'/>"></script>
<script src="<c:url value='/resources/js/main.js'/>"></script>
</body>
</html>