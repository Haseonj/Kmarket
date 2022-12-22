<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${type eq 'list'}">
<section id="admin-cs-list">
</c:if>
<c:if test="${type eq 'write'}">
<section id="admin-cs-write">
</c:if>
<c:if test="${type eq 'view'}">
<section id="admin-cs-view">
</c:if>
                <nav>
                    <h3>
                    <c:if test="${group eq 'notice'}">
                    	공지사항
                   	</c:if>
                    <c:if test="${group eq 'faq'}">
                    	자주묻는질문
                   	</c:if>
                    <c:if test="${group eq 'qna'}">
                    	고객문의
                   	</c:if>
                    <c:if test="${type eq 'list'}"> 
                    	목록
                    </c:if>
                    <c:if test="${type eq 'write'}"> 
                    	작성
                    </c:if>
                    <c:if test="${type eq 'view'}"> 
                    	보기
                    </c:if>
                    </h3>
                    <p>
                        HOME > 고객센터 >
                        <c:if test="${group eq 'notice'}">
                        	<strong>공지사항</strong>
                        </c:if>
                        <c:if test="${group eq 'faq'}">
                        	<strong>자주묻는질문</strong>
                        </c:if>
                        <c:if test="${group eq 'qna'}">
                        	<strong>고객문의</strong>
                        </c:if>
                    </p>
                </nav>