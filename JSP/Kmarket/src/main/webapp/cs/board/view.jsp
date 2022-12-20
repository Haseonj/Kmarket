<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
                <nav>
                    <h2 class="title">
                    <c:if test="${group eq 'faq'}">
                    <span>Q.</span>
                    </c:if>
                    [${vo.cate2}] ${vo.title}</h2>
                    <c:if test="${group eq 'qna'}">
                    <span>${vo.uid.substring(0, 5)}<c:forEach begin="6" end="${vo.uid.length()}" step="1">*</c:forEach>
                    </span>
                    </c:if>
                    <span class="date">${vo.rdate.substring(2, 10)}</span>
                </nav>
                <div class="content">
                    <p>
                    	${vo.content}
                    	<br>
                    	<br>
                    </p>
                    <p>
                        ※ 피싱 관련 피해신고
                        <br>
                        <br>
                        ▶ 경찰청 사이버수사국 (국번없이)182 :
                        http://cyberbureau.police.go.kr
                        <br>
                        ▶ KISA 인터넷침해대응센터 (국번없이)118 :
                        http://www.krcert.or.kr
                        <br>
                        감사합니다.
                        <br>
                    </p>
                </div>
<<<<<<< Updated upstream
<<<<<<< Updated upstream
                <a href="/Kmarket/cs/board/list.do?group=${group}&cate=${cate}&type=list" class="btnList">목록보기</a>
=======
                <a href="/Kmarket/cs/board/list.do?group=${group}&cate=${vo.c1Name}&type=list" class="btnList">목록보기</a>
                <c:if test="${group eq 'qna'}">
                <a href="/Kmarket/cs/board/modify.do?group=${group}&cate=${vo.c1Name}&type=modify&pg=${pg}&no=${vo.no}" class="btnModify">수정하기</a>
                </c:if>
>>>>>>> Stashed changes
=======
                <a href="/Kmarket/cs/board/list.do?group=${vo.group}&cate=${cate}&type=list" class="btnList">목록보기</a>
                <c:if test="${group eq 'qna'}">
                <a href="/Kmarket/cs/board/modify.do?group=${vo.group}&cate=${vo.c1Name}&type=modify&pg=${pg}&no=${vo.no}" class="btnModify">수정하기</a>
                </c:if>
>>>>>>> Stashed changes
            </article>
        </section>
</section>
<jsp:include page="../_footer.jsp"/>