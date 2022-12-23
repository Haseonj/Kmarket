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
<c:if test="${type eq 'modify'}">
<section id="admin-cs-modify">
</c:if>
                <nav>
                    <h3>공지사항
                    <c:if test="${type eq 'list'}"> 
                    	목록
                    </c:if>
                    <c:if test="${type eq 'write'}"> 
                    	작성
                    </c:if>
                    <c:if test="${type eq 'view'}"> 
                    	보기
                    </c:if>
                    <c:if test="${type eq 'modify'}"> 
                    	수정
                    </c:if>
                    </h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>