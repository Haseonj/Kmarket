<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
			<c:if test="${group eq 'qna' or group eq 'notice'}">
                <table>
                    <tbody>
                    <c:forEach var="articles" items="${articles}">
                        <tr>
                            <td><a href="/Kmarket/cs/board/view.do?group=${group}&cate=${cate}&type=view">[${articles.cate2}] ${articles.title}</a></td>
                            <td>${articles.uid}</td>
                            <td>${articles.rdate.substring(2, 10)}</td>
                        </tr>
                    </c:forEach>
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
                <div>
                    <h3>가입</h3>
                    <ul>
                        <li><a href="/Kmarket/cs/board/view.do?group=${group}&cate=${cate}&type=view"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                        <li><a href="./view.html"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                        <li><a href="./view.html"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                        <li><a href="./view.html"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                        <li><a href="./view.html"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                        <li class="more"><a href="#">더보기</a></li>
                    </ul>
                </div>
                <div>
                    <h3>탈퇴</h3>
                    <ul>
                        <li><a href="./view.html"><span>Q.</span>회원탈퇴 후 재가입이 가능한가요?</a></li>
                        <li><a href="./view.html"><span>Q.</span>회원탈퇴 후 재가입이 가능한가요?</a></li>
                        <li><a href="./view.html"><span>Q.</span>회원탈퇴 후 재가입이 가능한가요?</a></li>
                        <li><a href="./view.html"><span>Q.</span>회원탈퇴 후 재가입이 가능한가요?</a></li>
                        <li><a href="./view.html"><span>Q.</span>회원탈퇴 후 재가입이 가능한가요?</a></li>
                        <li class="more"><a href="#">더보기</a></li>
                    </ul>
                </div>
                <div>
                    <h3>회원정보</h3>
                    <ul>
                        <li><a href="./view.html"><span>Q.</span>회원정보를 수정하고 싶어요.</a></li>
                        <li><a href="./view.html"><span>Q.</span>회원정보를 수정하고 싶어요.</a></li>
                        <li><a href="./view.html"><span>Q.</span>회원정보를 수정하고 싶어요.</a></li>
                        <li><a href="./view.html"><span>Q.</span>회원정보를 수정하고 싶어요.</a></li>
                        <li><a href="./view.html"><span>Q.</span>회원정보를 수정하고 싶어요.</a></li>
                        <li class="more"><a href="#">더보기</a></li>
                    </ul>
                </div>
                <div>
                    <h3>로그인</h3>
                    <ul>
                        <li><a href="./view.html"><span>Q.</span>로그인에 문제가 있어요.</a></li>
                        <li><a href="./view.html"><span>Q.</span>로그인에 문제가 있어요.</a></li>
                        <li><a href="./view.html"><span>Q.</span>로그인에 문제가 있어요.</a></li>
                        <li><a href="./view.html"><span>Q.</span>로그인에 문제가 있어요.</a></li>
                        <li><a href="./view.html"><span>Q.</span>로그인에 문제가 있어요.</a></li>
                        <li class="more"><a href="#">더보기</a></li>
                    </ul>
                </div>
            </c:if>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>