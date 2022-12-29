<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>케이마켓 고객센터</title>
    <link rel="shortcut icon" type="image/x-icon" href="/Kmarket/img/favicon.ico">
    <link rel="stylesheet" href="/Kmarket/css/common.css"/>
    <link rel="stylesheet" href="/Kmarket/cs/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <c:choose>
			       		<c:when test="${empty sessMember.uid}">
			       			<a href="/Kmarket/member/login.do">로그인</a>
			           		<a href="/Kmarket/member/join.do">회원가입</a>
			           </c:when>
			           <c:when test="${not empty sessMember.uid}">
			           		<span>${sessMember.name}님 반갑습니다.</span>
			           		<c:choose>
			           		<c:when test="${sessMember.level ge 5}">
			           		<a href="/Kmarket/admin/index.do">관리자</a>
			           		</c:when>
			           		</c:choose>
			           		<a href="/Kmarket/member/logout.do">로그아웃</a>
			          	 	<a href="#">마이페이지</a>
			          	 	<a href="/Kmarket/product/cart.do"><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;장바구니</a>
			           </c:when>
			       </c:choose>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="/Kmarket/cs/index.do"><img src="../img/logo.png" alt="로고">고객센터</a>
                </div>
            </div>
        </header>