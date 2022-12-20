<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<section id="cs">
    <div class="notice">
        <nav>
            <div>
                <p>
                    홈<span>></span>공지사항
                </p>
            </div>
        </nav>
        <c:if test="${type eq 'list'}">
        	<section class="list">
        </c:if>
        <c:if test="${type eq 'write'}">
        	<section class="write">
        </c:if>
        <c:if test="${type eq 'view'}">
        	<section class="view">
        </c:if>
            <aside>
                <h2>공지사항</h2>
                <ul>
                    <li class="${cate eq 'all' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=notice&cate=all&type=list">전체</a></li>
                    <li class="${cate eq 'service' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=notice&cate=service&type=list">고객서비스</a></li>
                    <li class="${cate eq 'safe' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=notice&cate=safe&type=list">안전거래</a></li>
                    <li class="${cate eq 'danger' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=notice&cate=danger&type=list">위해상품</a></li>
                    <li class="${cate eq 'prize' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=notice&cate=prize&type=list">이벤트당첨</a></li>
                </ul>
            </aside>
            <article>
            <c:if test="${type eq 'list'}">
                <nav>
                <c:if test="${cate eq 'all'}">
                    <h1>전체</h1>
                    <h2>공지사항 전체 내용입니다.</h2>
                </c:if>
                <c:if test="${cate eq 'service'}">
                    <h1>고객서비스</h1>
                    <h2>공지사항 고객서비스 내용입니다.</h2>
                </c:if>
                <c:if test="${cate eq 'safe'}">
                    <h1>안전거래</h1>
                    <h2>공지사항 안전거래 내용입니다.</h2>
                </c:if>
                <c:if test="${cate eq 'danger'}">
                    <h1>위해상품</h1>
                    <h2>공지사항 위해상품 내용입니다.</h2>
                </c:if>
                <c:if test="${cate eq 'prize'}">
                    <h1>이벤트당첨</h1>
                    <h2>공지사항 이벤트당첨 내용입니다.</h2>
                </c:if>
                </nav>
			</c:if>