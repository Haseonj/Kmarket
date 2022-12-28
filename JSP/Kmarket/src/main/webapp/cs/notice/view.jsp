<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
        <section class="view">
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
                    <h2 class="title">${vo.title}</h2>
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
                <a href="/Kmarket/cs/notice/list.do?cate1=${cate1}&pg=${pg}" class="btnList">목록보기</a>
            </article>
        </section>
</section>
<jsp:include page="../_footer.jsp"/>