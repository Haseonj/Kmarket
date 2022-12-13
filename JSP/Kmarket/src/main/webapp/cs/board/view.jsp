<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
                <nav>
                    <h2 class="title">
                    <c:if test="${group eq 'faq'}">
                    <span>Q.</span>
                    </c:if>
                    [가입] 가입 문의내용</h2>
                    <c:if test="${group eq 'qna'}">
                    <span>has*****</span>
                    </c:if>
                    <span class="date">2022.12.07</span>
                </nav>
                <div class="content">
                    <p>
                        개인회원에서 법인회원(사업자 회원)으로 전환은 불가하므로
                        법인회원(사업자 회원) 전환은 신규 가입으로 진행을 해야 합니다.
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
                <a href="/Kmarket/cs/board/list.do?group=${group}&cate=${cate}&type=list" class="btnList">목록보기</a>
            </article>
        </section>
</section>
<jsp:include page="../_footer.jsp"/>