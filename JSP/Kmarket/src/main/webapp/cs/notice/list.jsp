<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="notice">
        <nav>
            <div>
                <p>
                    홈<span>></span>공지사항
                </p>
            </div>
        </nav>
        <section class="list">
            <aside>
                <h2>공지사항</h2>
                <ul>
                    <li class="${cate1 eq 'all' ? 'on' : 'off'}"><a href="/Kmarket/cs/notice/list.do?cate1=all&pg=1">전체</a></li>
                    <li class="${cate1 eq 'service' ? 'on' : 'off'}"><a href="/Kmarket/cs/notice/list.do?cate1=service&pg=1">고객서비스</a></li>
                    <li class="${cate1 eq 'safe' ? 'on' : 'off'}"><a href="/Kmarket/cs/notice/list.do?cate1=safe&pg=1">안전거래</a></li>
                    <li class="${cate1 eq 'danger' ? 'on' : 'off'}"><a href="/Kmarket/cs/notice/list.do?cate1=danger&pg=1">위해상품</a></li>
                    <li class="${cate1 eq 'prize' ? 'on' : 'off'}"><a href="/Kmarket/cs/notice/list.do?cate1=prize&pg=1">이벤트당첨</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <h1>전체</h1>
                    <h2>공지사항 전체 내용입니다.</h2>
                </nav>
                <table>
                    <tbody>
                    <c:forEach var="notice" items="${notice}">
                        <tr>
                            <td><a href="/Kmarket/cs/notice/view.do?cate1=${cate1}&no=${notice.no}&pg=${currentPage}">${notice.title}</a></td>
                            <td>${notice.rdate.substring(2,10)}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="page">
                    <c:if test="${pageGroupStart > 1}">
                    	<a href="/Kmarket/cs/notice/list.do?cate1=${cate1}&pg=${pageGroupStart - 1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    	<a href="/Kmarket/cs/notice/list.do?cate1=${cate1}&pg=${i}" class="num ${currentPage == i ? 'on' : 'off'}">${i}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">
                    	<a href="/Kmarket/cs/notice/list.do?cate1=${cate1}&pg=${pageGroupEnd + 1}" class="next">다음</a>
                    </c:if>
                </div>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>