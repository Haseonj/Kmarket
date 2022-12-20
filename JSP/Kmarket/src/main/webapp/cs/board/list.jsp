<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		for(let i = 1; i < 8; i++){
			$('.more'+i+'').click(function(){
				$('.more'+i+'').hide();
				$('.simple'+i+'').show();
				$('#cs > .faq > .list > article > div > div > .ul'+i+'').css('height','auto');
			});
			$('.simple'+i+'').click(function(){
				$('.simple'+i+'').hide();
				$('.more'+i+'').show();
				$('#cs > .faq > .list > article > div > div > .ul'+i+'').css('height','171px');
			});
		}
	});
</script>
			<c:if test="${group eq 'qna' or group eq 'notice'}">
                <table>
                    <tbody>
                    <c:forEach var="articles" items="${articles}">
                        <tr>
                            <td>
	                            <a href="/Kmarket/cs/board/view.do?group=${group}&cate=${cate}&type=view&no=${articles.no}&pg=${currentPage}">
	                            <c:if test="${group eq 'qna'}">
	                            	[${articles.cate2}]
                            	</c:if> 
	                            	${articles.title}
	                            </a>
                            </td>
                            <td>${articles.uid.substring(0, 5)}<c:forEach begin="6" end="${articles.uid.length()}" step="1">*</c:forEach></td>
                            <td>${articles.rdate.substring(2, 10)}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="page">
                	<c:if test="${pageGroupStart > 1}">
                    	<a href="/Kmarket/cs/board/list.do?group=${group}&cate=${cate}&type=${type}&pg=${pageGroupStart - 1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    	<a href="/Kmarket/cs/board/list.do?group=${group}&cate=${cate}&type=${type}&pg=${i}" class="num ${currentPage == i ? 'on' : 'off'}">${i}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">
                    	<a href="/Kmarket/cs/board/list.do?group=${group}&cate=${cate}&type=${type}&pg=${pageGroupEnd + 1}" class="next">다음</a>
                    </c:if>
                </div>
              	<c:if test="${group eq 'qna'}">
                <a href="/Kmarket/cs/board/write.do?group=${group}&cate=${cate}&type=write" class="btnWrite">문의하기</a>
                </c:if>
            </c:if>
            <c:if test="${group eq 'faq'}">
            <c:forEach var="cate2" items="${cate2}">
                <div>
                    <h3>${cate2.cate2}</h3>
                    <div>
	                    <ul class="ul${cate2.cate2No}">
		                    <c:forEach var="articles" items="${articles}">
		                    	<c:if test="${cate2.cate2 eq articles.cate2}">
		                        	<li><a href="/Kmarket/cs/board/view.do?group=${group}&cate=${cate}&type=view&no=${articles.no}"><span>Q.</span>${articles.title}</a></li>
		                    	</c:if>
		                    </c:forEach>
	                    </ul>
	                    <button class="more${cate2.cate2No}">더보기</button>
	                    <button class="simple${cate2.cate2No}">간단히보기</button>
                    </div>
                </div>
			</c:forEach>
            </c:if>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>