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
        <section class="view">
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
                    <h2 class="title">[${vo.cate2}] ${vo.title}</h2>
                    <span>${vo.uid.substring(0, 5)}<c:forEach begin="6" end="${vo.uid.length()}" step="1">*</c:forEach></span>
                    <span class="date">${vo.rdate.substring(2,10)}</span>
                </nav>
                <div class="content">
                    <p>
                        ${vo.content}
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
                <a href="/Kmarket/cs/qna/list.do?cate1=${cate1}&pg=${pg}" class="btnList">목록보기</a>
            </article>
        </section>
</section>
<jsp:include page="../_footer.jsp"/>