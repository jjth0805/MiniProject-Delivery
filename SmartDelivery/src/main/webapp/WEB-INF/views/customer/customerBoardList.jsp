<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Page</title>
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
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: center;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
p {
    color: red;
    font-weight: bold;
    font-size: 25px;
    text-align: center;
}
</style>
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>
<script>
$(function(){
    $("#searchBtn").on("click",function(){
    var item = $("#searchItem").val();
    var keyword = $("#searchKeyword").val();
        console.log(keyword);
        $.ajax({
            type : "get",
            url : "<c:url value='/customer/customerBoardSearch'/>",
            data :
                {
                searchItem : item, searchKeyword : keyword
                },
            success : function(data){
                console.log(data);
                var searchData = "";
                if(data.length==0){
                    searchData += ("<p>"+"검색결과가 없습니다"+"<p>");
                }
                else
                {
               $.each(data, function(index, item){
                    searchData += ('<tr>');              
                    searchData += ('<td>'+item.boardNum+'</td>');                  
                    searchData += ('<td><a href="<c:url value="/customer/customerBoardRead?boardNum='+item.boardNum+'"/>">'+item.title+'<a></td>');                    
                    searchData += ('<td>'+item.userId+'</td>');                   
                    searchData += ('<td>'+item.hit+'</td>');                    
                    searchData += ('<td>'+item.inputdate+'</td>');                    
                    searchData += ('</tr>'); 
                   });
                    }
                $("#tbody").html(searchData);
                }
            });
        });
});
</script>
<c:choose>
        <c:when test="${requestScope.deleteResult==true}">
            <script >alert("삭제성공");</script>
        </c:when>
        <c:when test="${requestScope.deleteResult==false}">
            <script >alert("삭제실패");</script>
        </c:when>
        <c:when test="${requestScope.writeResult==true}">
            <script>alert("등록성공");</script>
        </c:when>
        <c:when test="${requestScope.writeResult==false}">
            <script>alert("등록실패");</script>
        </c:when>
</c:choose>
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
        <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Customer</h1>
            </div>
        </div>
    </div>
</div>

    <div class="col-xs-12 col-md-8">
        <form action="<c:url value='/customer/getCustomerBoardList'/>" method="get">
            <select name = "searchItem" id="searchItem">
                <option value="userId" selected="selected">작성자</option>
                <option value="title">제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchKeyword" id="searchKeyword">
            <input type="button" value="검색" id="searchBtn">
        </form>
    </div>
    <div class="col-xs-6 col-md-4">
        <a href="<c:url value='/customer/customerBoardWriteForm'/>">
            글쓰기<img src="<c:url value='/resources/images/delivery_car.png'/>" width="50px" height="50px">
        </a>
    </div>
        
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody id=tbody>
        <c:forEach items = "${requestScope.list}" var = "customer">
        <tr>
            <td>${customer.boardNum}</td>
            <td id="title"><a href="<c:url value='/customer/customerBoardRead?boardNum=${customer.boardNum}'/>">${customer.title}</a></td>
            <td>${customer.userId}</td>
            <td>${customer.hit}</td>
            <td>${customer.inputdate}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

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