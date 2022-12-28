<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="qna">
        <nav>
            <div>
                <p>
                    홈<span>></span>문의하기
                </p>
            </div>
        </nav>
        <section class="list">
            <aside>
                <h2>문의하기</h2>
                <ul>
                    <li class="${cate1 eq 'user' ? 'on' : 'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=user&pg=1">회원</a></li>
                    <li class="${cate1 eq 'event' ? 'on' : 'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=event&pg=1">쿠폰/이벤트</a></li>
                    <li class="${cate1 eq 'order' ? 'on' : 'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=order&pg=1">주문/결제</a></li>
                    <li class="${cate1 eq 'shipping' ? 'on' : 'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=shipping&pg=1">배송</a></li>
                    <li class="${cate1 eq 'cancel' ? 'on' : 'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=cancel&pg=1">취소/반품/교환</a></li>
                    <li class="${cate1 eq 'travel' ? 'on' : 'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=travel&pg=1">여행/숙박/항공</a></li>
                    <li class="${cate1 eq 'safe' ? 'on' : 'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=safe&pg=1">안전거래</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <h1>회원</h1>
                    <h2>회원관련 문의 내용입니다.</h2>
                </nav>
                <table>
                    <tbody>
                    <c:forEach var="articles" items="${articles}">
                        <tr>
                            <td><a href="/Kmarket/cs/qna/view.do?cate1=${cate1}&no=${articles.no}&pg=${currentPage}">[${articles.cate2}] ${articles.title}</a></td>
                            <td>
                            	<c:choose>
	                            	<c:when test="${articles.comment == 0}">
	                            		<p>검토중</p>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<p class="answer">답변완료</p>
	                            	</c:otherwise>
                            	</c:choose>
                            </td>
                            <td>${articles.uid.substring(0, 5)}<c:forEach begin="6" end="${articles.uid.length()}" step="1">*</c:forEach></td>
                            <td>${articles.rdate.substring(2, 10)}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="page">
                    <c:if test="${pageGroupStart > 1}">
                    	<a href="/Kmarket/cs/qna/list.do?cate1=${cate1}&pg=${pageGroupStart - 1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    	<a href="/Kmarket/cs/qna/list.do?cate1=${cate1}&pg=${i}" class="num ${currentPage == i ? 'on' : 'off'}">${i}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">
                    	<a href="/Kmarket/cs/qna/list.do?cate1=${cate1}&pg=${pageGroupEnd + 1}" class="next">다음</a>
                    </c:if>
                </div>
                <a href="/Kmarket/cs/qna/write.do?cate1=${cate1}&pg=1" class="btnWrite">문의하기</a>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>