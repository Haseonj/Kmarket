<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<section id="cs">
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
    <div class="faq">
        <nav>
            <div>
                <p>
                    홈<span>></span>자주묻는 질문
                </p>
            </div>
        </nav>
        <section class="list">
            <aside>
                <h2>자주묻는 질문</h2>
                <ul>
                    <li class="${cate1 eq 'user' ? 'on' : 'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=user">회원</a></li>
                    <li class="${cate1 eq 'event' ? 'on' : 'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=event">쿠폰/이벤트</a></li>
                    <li class="${cate1 eq 'order' ? 'on' : 'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=order">주문/결제</a></li>
                    <li class="${cate1 eq 'shipping' ? 'on' : 'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=shipping">배송</a></li>
                    <li class="${cate1 eq 'cancel' ? 'on' : 'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=cancel">취소/반품/교환</a></li>
                    <li class="${cate1 eq 'travel' ? 'on' : 'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=travel">여행/숙박/항공</a></li>
                    <li class="${cate1 eq 'safe' ? 'on' : 'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=safe">안전거래</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <h1>회원</h1>
                    <h2>가장 자주 묻는 질문입니다.</h2>
                </nav>
                <c:forEach var="cate2" items="${cate2}" varStatus="i">
                <div>
                    <h3>${cate2}</h3>
                    <div>
	                    <ul class="ul${i.count}">
		                    <c:forEach var="faq" items="${faq}">
		                    	<c:if test="${cate2 eq faq.cate2}">
		                        	<li><a href="/Kmarket/cs/faq/view.do?&cate1=${cate1}&no=${faq.no}"><span>Q.</span>${faq.title}</a></li>
		                    	</c:if>
		                    </c:forEach>
	                    </ul>
	                    <button class="more${i.count}">더보기</button>
	                    <button class="simple${i.count}">간단히보기</button>
                    </div>
                </div>
				</c:forEach>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>