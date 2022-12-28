<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>케이마켓::관리자</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="/Kmarket/admin/css/admin.css">
    <script src="/Kmarket/admin/js/gnb.js"></script>
    
</head>
<body>
    <div id="admin-wrapper">
        
        <header>
            <div>
                <a href="/Kmarket/admin/index.do" class="logo"><img src="/Kmarket/admin/img/admin_logo.png" alt="admin_logo"></a>
                <p>
                    <span>${sessMember.name}님 반갑습니다.</span>
                    <a href="/Kmarket/index.do">HOME |</a>
                    <a href="/Kmarket/member/logout.do">로그아웃 |</a>
                    <a href="/Kmarket/cs/index.do">고객센터</a>
                </p>
            </div>
        </header>
        <main>
    <aside>
        <ul id="gnb">
            <li>
                <a href="#"><i class="fa fa-cogs"></i>환경설정</a>
                <ol>
                    <li><a href="#">기본환경설정</a></li>
                    <li><a href="#">배너관리</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fa fa-store"></i>상점관리</a>
                <ol>
                    <li><a href="#">판매자현황</a></li>
                    <li><a href="#">재고관리</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fa fa-users"></i>회원관리</a>
                <ol>
                    <li><a href="#">회원현황</a></li>
                    <li><a href="#">포인트관리</a></li>
                    <li><a href="#">비회원관리</a></li>
                    <li><a href="#">접속자집계</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-box-open"></i>상품관리</a>
                <ol>
                    <li><a href="/Kmarket/admin/product/list.do">상품목록</a></li>
                    <li><a href="/Kmarket/admin/product/register.do">상품등록</a></li>
                    <li><a href="#">재고관리</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fa fa-credit-card"></i>주문관리</a>
                <ol>
                    <li><a href="#">주문현황</a></li>
                    <li><a href="#">매출관리</a></li>
                    <li><a href="#">결제관리</a></li>
                    <li><a href="#">배송관리</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fa fa-pencil-square-o"></i>고객센터</a>
                <ol>
                    <li><a href="/Kmarket/admin/cs/notice/list.do?cate1=all&pg=1">공지사항</a></li>
                    <li><a href="/Kmarket/admin/cs/faq/list.do?cate1=all&pg=1">자주묻는질문</a></li>
                    <li><a href="/Kmarket/admin/cs/qna/list.do?cate1=all&pg=1">고객문의</a></li>
                </ol>
            </li>
        </ul>
    </aside>