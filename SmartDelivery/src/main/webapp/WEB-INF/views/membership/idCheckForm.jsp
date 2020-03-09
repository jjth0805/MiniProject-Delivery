<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>ID checkForm</title>
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
    
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>
<script>
	function closeFunc(){
	    close();
		}
    function submitId(){
        var useridDoc = opener.document.getElementById("userId");
        var signupBtnDoc = opener.document.getElementById("signupBtn");
        useridDoc.value = "${userId}";
        signupBtnDoc.removeAttribute("disabled");
        close();
        }
    function idCheck(){
        var reg = /^(?=.*?[a-z])(?=.*?[0-9]).{4,15}$/;
        var checkId = $("#userId").val();
        if(checkId.trim().length==0){
            $("#idMsg").text("");
            return false;
        }else if(reg.test(checkId) == false){
            $("#idMsg").text("아이디는 공백없고 영문 소문자 5자 이상 15자 이하여야 하며 숫자를 포함해야 합니다")
            return false;
        }else{
            console.log("통과");
            $("#idMsg").text("");
            return true;
        }
    }
</script>
</head>
<body>
	<form action="<c:url value='/membership/checkid'/>" method="post" onsubmit="return idCheck()">
    
        <div class="col-md-6 mb-3 mb-md-0">
	       <label class="text-black" for="userId">ID 확인</label>
				<input type="text" id="userId" name="userId" onkeyup="idCheck()" value="${userId}" class="form-control" required="required">
				<input type="submit" value="중복확인" class="btn btn-primary py-2 px-4 text-white">
				<input type="button" id="btn" value="사용" onclick="submitId()" disabled="disabled" class="btn btn-primary py-2 px-4 text-white">
				<input type="button" value="닫기" onclick="closeFunc()" class="btn btn-primary py-2 px-4 text-white"><br><br>
                <span style="color:red" id = "idMsg"></span>
        </div>
	</form>
	<c:choose>
		<c:when test="${checkResult == true}">
			<p>사용가능한 아이디 입니다</p>
			<script>
				document.getElementById("btn").removeAttribute("disabled");
			</script>
		</c:when>
		<c:when test="${checkResult == false}">
			<p>중복된 아이디 입니다</p>
		</c:when>
	</c:choose>

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
