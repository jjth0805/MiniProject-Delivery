<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</head>
<title>Delivery Tracking</title>

<style>
#tekbeCompnayList {
    width: 460px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #000000;
    border: 1px solid #006fff;
    border-radius: 3px;
}
#invoiceNumberText {
    width: 400px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #000000;
    border: 1px solid #006fff;
    border-radius: 3px;
}

#tekbeCompnayName, #invoiceNumber{
  color:black; 
  font-weight: bold; 
  margin-right: 20px;
  font-size: 18px;
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
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

$(document).ready(function(){
    var myKey = "dCCag0anwOVTJcAInksuBQ"; // sweet tracker받은 무료 KEY 하루 1000건 조회가능
        // 택배사 목록 조회 company-api
        $.ajax({
            type:"GET",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
                    
                var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
                console.log(CompanyArray); 
                
                var myData="<option>select the company</option>";
                $.each(CompanyArray,function(key,value) {
                    myData +=('<option value='+value.Code+'>' +value.Name + '</option>');
                    });
                $("#tekbeCompnayList").html(myData);
            }
        });

        // 배송정보와 배송추적 tracking-api
        $("#myButton1").click(function() {
            var t_code = $('#tekbeCompnayList option:selected').attr('value');
            var t_invoice = $('#invoiceNumberText').val();
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                    console.log(data);
                    var myInvoiceData = "";
                    if(data.status == false){
                        myInvoiceData += ('<p>'+data.msg+'<p>');
                    }
                    else
                    {
							myInvoiceData += ('<tr>');              
							myInvoiceData += ('<th>'+"보내는사람"+'</th>');                  
							myInvoiceData += ('<th>'+data.senderName+'</th>');                  
							myInvoiceData += ('</tr>');     
							myInvoiceData += ('<tr>');              
							myInvoiceData += ('<th>'+"제품정보"+'</th>');                   
							myInvoiceData += ('<th>'+data.itemName+'</th>');                    
							myInvoiceData += ('</tr>');     
							myInvoiceData += ('<tr>');              
							myInvoiceData += ('<th>'+"송장번호"+'</th>');                   
							myInvoiceData += ('<th>'+data.invoiceNo+'</th>');                   
							myInvoiceData += ('</tr>');     
							myInvoiceData += ('<tr>');              
							myInvoiceData += ('<th>'+"받는사람 주소"+'</th>');                   
							myInvoiceData += ('<th>'+data.receiverAddr+'</th>');                    
							myInvoiceData += ('</tr>');                                     
                    }
                    $("#myPtag").html(myInvoiceData)
                    
                    var trackingDetails = data.trackingDetails;
                    
                    var myTracking="";
                    var header ="";
                    header += ('<tr>');
                    header += ('<th>'+"시간"+'</th>');
                    header += ('<th>'+"장소"+'</th>');
                    header += ('<th>'+"유형"+'</th>');
                    header += ('<th>'+"택배 기사 전화번호"+'</th>');
                    header += ('<th>'+"물류 센터  전화번호"+'</th>');
                    header += ('</tr>')
                    
                    $.each(trackingDetails,function(key,value) {
                   myTracking += ('<tr>');             
                   myTracking += ('<td>'+value.timeString+'</td>');
                   myTracking += ('<td>'+value.where+'</td>');
                   myTracking += ('<td>'+value.kind+'</td>');
                   myTracking += ('<td>'+value.telno2+'</td>');
                   myTracking += ('<td>'+value.telno+'</td>');                     
                   myTracking += ('</tr>');                                    
                });
              $("#myPtag2").html(header+myTracking);
            }
        });
    });
});
</script>

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
                                                <li><a href="<c:url value='/membership/loginForm'/>">Log In</a></li>
                                                <li><a href="<c:url value='/memberhip/singupForm'/>">Sign Up</a></li>
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

    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(../resources/images/hero_bg_1.jpg);"
        data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row align-items-center justify-content-center text-center">

                <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
                <br></br>
                    <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Track Your Item!</h1><br>
                    <span id="tekbeCompnayName" class="text-white font-wight light">Company</span>
                    <select id="tekbeCompnayList" name="tekbeCompnayList"></select><br/><br/>
					<span id="invoiceNumber" class="text-white font-wight light">Invoice Number</span>
					<input type="text" id="invoiceNumberText" name="invoiceNumberText"><br/><br/>
					<button id="myButton1" class="btn btn-primary py-3 px-5 text-white">Confirm</button>
                </div>
            </div>
        </div>
    </div>
<br></br>
	<div>
		<table id="myPtag"></table>
	</div>
	<br />
	<div>
		<table id="myPtag2"></table>
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