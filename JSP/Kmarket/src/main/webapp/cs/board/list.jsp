<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		$('.more').click(function(){
			console.log("more");
			
			$('.more').hide();
			$('.faq > .list > article > div > ul > li:nth-child(n+4)').show();
		});
	});
</script>
			<c:if test="${group eq 'qna' or group eq 'notice'}">
                <table>
                    <tbody>
                        <tr>
<<<<<<< Updated upstream
                            <td><a href="/Kmarket/cs/board/view.do?group=${group}&cate=${cate}&type=view">[가입] 가입 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[탈퇴] 탈퇴 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[회원정보] 회원정보 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[로그인] 회원정보 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[로그인] 회원정보 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[로그인] 회원정보 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[회원정보] 회원정보 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[회원정보] 회원정보 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[탈퇴] 회원정보 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
                        </tr>
                        <tr>
                            <td><a href="./view.html">[탈퇴] 회원정보 문의내용</a></td>
                            <td>has*****</td>
                            <td>2022.12.07</td>
=======
                            <td><a href="/Kmarket/cs/board/view.do?group=${group}&cate=${cate}&type=view&no=${articles.no}&pg=${currentPage}">[${articles.cate2}] ${articles.title}</a></td>
                            <td>${articles.uid.substring(0, 5)}<c:forEach begin="6" end="${articles.uid.length()}" step="1">*</c:forEach></td>
                            <td>${articles.rdate.substring(2, 10)}</td>
>>>>>>> Stashed changes
                        </tr>
                    </tbody>
                </table>
                <div class="page">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="num on">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="next">다음</a>
                </div>
              	<c:if test="${group eq 'qna'}">
                <a href="/Kmarket/cs/board/write.do?group=${group}&cate=${cate}&type=write" class="btnWrite">문의하기</a>
                </c:if>
            </c:if>
            <c:if test="${group eq 'faq'}">
            <c:forEach var="cate2" items="${cate2}">
                <div>
                    <h3>${cate2.cate2}</h3>
                    <ul>
                    <c:forEach var="articles" items="${articles}">
                    	<c:if test="${cate2.cate2 eq articles.cate2}">
                        	<li><a href="/Kmarket/cs/board/view.do?group=${group}&cate=${cate}&type=view"><span>Q.</span>${articles.title}</a></li>
                    	</c:if>
                    </c:forEach>
                        <li class="more${cate2.cate2Count}"><a href="#">더보기</a></li>
                    </ul>
                </div>
			</c:forEach>
            </c:if>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>