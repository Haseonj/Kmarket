<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<section id="cs">
    <div class="faq">
        <nav>
            <div>
                <p>
                    홈<span>></span>자주묻는 질문
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
                <h2>자주묻는 질문</h2>
                <ul>
                    <li class="${cate eq 'user' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=faq&cate=user&type=list">회원</a></li>
                    <li class="${cate eq 'event' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=faq&cate=event&type=list">쿠폰/이벤트</a></li>
                    <li class="${cate eq 'order' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=faq&cate=order&type=list">주문/결제</a></li>
                    <li class="${cate eq 'shipping' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=faq&cate=shipping&type=list">배송</a></li>
                    <li class="${cate eq 'cancel' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=faq&cate=cancel&type=list">취소/반품/교환</a></li>
                    <li class="${cate eq 'travel' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=faq&cate=travel&type=list">여행/숙박/항공</a></li>
                    <li class="${cate eq 'safe' ? 'on' : 'off'}"><a href="/Kmarket/cs/board/list.do?group=faq&cate=safe&type=list">안전거래</a></li>
                </ul>
            </aside>            
            <article>
		    <c:if test="${type eq 'list'}">
                <nav>
                <c:if test="${cate eq 'user'}">
                    <h1>회원</h1>
                    <h2>가장 자주 묻는 질문입니다.</h2>
				</c:if>
                <c:if test="${cate eq 'event'}">
                    <h1>쿠폰/이벤트</h1>
                    <h2>가장 자주 묻는 질문입니다.</h2>
				</c:if>
                <c:if test="${cate eq 'order'}">
                    <h1>주문/결제</h1>
					<h2>가장 자주 묻는 질문입니다.</h2>
				</c:if>
                <c:if test="${cate eq 'shipping'}">
                    <h1>배송</h1>
					<h2>가장 자주 묻는 질문입니다.</h2>
				</c:if>
                <c:if test="${cate eq 'cancel'}">
                    <h1>취소/반품/교환</h1>
					<h2>가장 자주 묻는 질문입니다.</h2>
				</c:if>
                <c:if test="${cate eq 'travel'}">
                    <h1>여행/숙박/항공</h1>
					<h2>가장 자주 묻는 질문입니다.</h2>
				</c:if>
                <c:if test="${cate eq 'safe'}">
                    <h1>안전거래</h1>
                    <h2>가장 자주 묻는 질문입니다.</h2>
				</c:if>
                </nav>
			</c:if>