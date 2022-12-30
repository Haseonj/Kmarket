<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>케이마켓::대한민국 1등 온라인 쇼핑몰</title>
    <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="./css/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.bxslider').bxSlider({
                auto: false,
                autoControls: true,
                stopAutoOnClick: true,
                pager: true,
                slideWidth: 985
            });
        });
        $(function(){
            var best = $('aside > .best');

            $(window).scroll(function(){
                var t = $(this).scrollTop();

                if(t > 620){
                    best.css({
                        position: "fixed",
                        top: "0"
                    });
                }else{
                    best.css({position: "static"});
                }
            });
            
            // 추천별 스크롤 이동
            $('.goHit').click(function(e){
            	e.preventDefault();
            	let offset = $('.hit').offset();
            	$('html').animate({scrollTop : offset.top}, 500);
            });
            $('.goRec').click(function(e){
            	e.preventDefault();
            	let offset = $('.recommend').offset();
            	$('html').animate({scrollTop : offset.top}, 500);
            });
            $('.goNew').click(function(e){
            	e.preventDefault();
            	let offset = $('.new').offset();
            	$('html').animate({scrollTop : offset.top}, 500);
            });
            $('.goHot').click(function(e){
            	e.preventDefault();
            	let offset = $('.hot').offset();
            	$('html').animate({scrollTop : offset.top}, 500);
            });
            $('.goDis').click(function(e){
            	e.preventDefault();
            	let offset = $('.discount').offset();
            	$('html').animate({scrollTop : offset.top}, 500);
            });
            
            // 최상단 이동
            $('#top').click(function(){
            	$('html').scrollTop(0);
            });
        });
        
    </script>
</head>
<body>
    <div id="wrappre">
        <header>
            <div class="top">
                <div>
			       <c:choose>
			       		<c:when test="${empty sessMember.uid}">
			       			<a href="/Kmarket/member/login.do">로그인</a>
			           		<a href="/Kmarket/member/join.do">회원가입</a>
			           </c:when>
			           <c:when test="${not empty sessMember.uid}">
			           		<span>${sessMember.name}님 반갑습니다.</span>
			           		<c:choose>
			           		<c:when test="${sessMember.level ge 5}">
			           		<a href="/Kmarket/admin/index.do">관리자</a>
			           		</c:when>
			           		</c:choose>
			           		<a href="/Kmarket/member/logout.do">로그아웃</a>
			          	 	<a href="#">마이페이지</a>
			          	 	<a href="/Kmarket/product/cart.do"><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;장바구니</a>
			           </c:when>
			       </c:choose>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="/Kmarket/"><img src="./img/header_logo.png" alt="로고"></a>
                    <form action="#">
                        <input type="text" name="search">
                        <button>
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="menu">
                <div>
                    <ul>
                        <li><a href="#" class="goHit">히트상품</a></li>
                        <li><a href="#" class="goRec">추천상품</a></li>
                        <li><a href="#" class="goNew">최신상품</a></li>
                        <li><a href="#" class="goHot">인기상품</a></li>
                        <li><a href="#" class="goDis">할인상품</a></li>
                    </ul>
                    <ul>
                        <li><a href="/Kmarket/cs/notice/list.do?cate1=all">공지사항</a></li>
                        <li><a href="/Kmarket/cs/faq/list.do?cate1=user">자주묻는질문</a></li>
                        <li><a href="/Kmarket/cs/qna/list.do?cate1=user">문의하기</a></li>
                        <li><a href="/Kmarket/cs/index.do">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <main>
            <aside>
                <ul class="category">
            <li><i class="fa fa-bars" aria-hidden="true"></i>카테고리</li>
            <li>
                <a href="#"><i class="fas fa-shopping-bag"></i>브랜드패션</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=10&cate2=10">브랜드 여성의류</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=10&cate2=11">브랜드 남성의류</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=10&cate2=12">브랜드 진/캐쥬얼</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=10&cate2=13">브랜드 신발/가방</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=10&cate2=14">브랜드 쥬얼리/시계</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=10&cate2=15">브랜드 아웃도어</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-tshirt"></i>패션의류·잡화·뷰티</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=11&cate2=10">여성의류</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=11&cate2=11">남성의류</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=11&cate2=12">언더웨어</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=11&cate2=13">신발</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=11&cate2=14">가방/잡화</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=11&cate2=15">쥬얼리/시계</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=11&cate2=16">화장품/향수</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=11&cate2=17">바디/헤어</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-baby-carriage"></i>유아동</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=12&cate2=10">출산/육아</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=12&cate2=11">장난감/완구</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=12&cate2=12">유아동 의류</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=12&cate2=13">유아동 신발/잡화</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-utensils"></i>식품·생필품</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=13&cate2=10">신선식품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=13&cate2=11">가공식품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=13&cate2=12">건강식품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=13&cate2=13">커피/음료</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=13&cate2=14">생필품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=13&cate2=15">바디/헤어</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-home"></i>홈데코·문구·취미·반려</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=10">가구DIY</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=11">침구/커튼</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=12">조명/인테리어</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=13">생활용품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=14">주방용품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=15">문구/사무용품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=16">사무기기</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=17">악기/취미</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=14&cate2=18">반려동물용품</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-tv"></i>컴퓨터·디지털·가전</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=10">노트북/PC</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=11">모니터/프린터</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=12">PC주변기기</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=13">모바일/태블릿</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=14">카메라</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=15">게임</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=16">영상가전</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=17">주방가전</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=18">계절가전</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=19">생활/미용가전</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=20">음향가전</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=15&cate2=21">건강가전</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-running"></i>스포츠·건강·렌탈</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=10">스포츠의류/운동화</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=11">휘트니스/수영</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=12">구기/라켓</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=13">골프</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=14">자전거/보드/기타레저</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=15">캠핑/낚시</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=16">등산/아웃도어</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=17">건강/의료용품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=18">건강식품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=16&cate2=19">렌탈서비스</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-car"></i>자동차·공구</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=17&cate2=10">자동차용품</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=17&cate2=11">공구/안전/산업용품</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-book"></i>여행·도서·티켓·e쿠폰</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?cate1=18&cate2=10">여행/항공권</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=18&cate2=11">도서/음반/e교육</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=18&cate2=12">공연티켓</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=18&cate2=13">e쿠폰</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=18&cate2=14">상품권</a></li>
                </ol>
            </li>
            </ul>
                <article class="best" style="position: static;">
                    <h1><i class="fas fa-crown"></i>베스트상품</h1>
                    <ol>
                    <c:forEach var="bests" items="${bests}" varStatus="i">
                        <li>
                            <a href="/Kmarket/product/view.do?pg=${pg}&cate1=${bests.prodCate1}&cate2=${bests.prodCate2}&prodNo=${bests.prodNo}">
                                <div class="thumb">
                                    <i>${i.count}</i>
                                    <img src="http://3.39.231.136:8080/Kmarket/file/${bests.thumb1}" alt="item1">
                                </div>
                                <h2>${bests.prodName}</h2>
                                <div class="org_price">
                                    <del><fmt:formatNumber value="${bests.price}" pattern="#,###"/></del>
                                    <span>${bests.discount}%</span>
                                </div>
                                <div class="dis_price">
                                    <ins><fmt:formatNumber value="${bests.saleprice}" pattern="#,###"/></ins>
                                </div>
                            </a>
                        </li>
					</c:forEach>
                    </ol>
                </article>
            </aside>
            <section>
                <!-- 슬라이더 영역 -->
                <section class="slider">
                    <ul class="bxslider">
                        <li>
                            <a href="#"><img src="./img/slider_item1.jpg" alt="item5"></a>
                        </li>
                        <li>
                            <a href="#"><img src="./img/slider_item2.jpg" alt="item5"></a>
                        </li>
                        <li>
                            <a href="#"><img src="./img/slider_item3.jpg" alt="item5"></a>
                        </li>
                        <li>
                            <a href="#"><img src="./img/slider_item4.jpg" alt="item5"></a>
                        </li>
                        <li>
                            <a href="#"><img src="./img/slider_item5.jpg" alt="item5"></a>
                        </li> 
                    </ul>
                </section>
                <!-- 히트상품 영역 -->
                <section class="hit">
                    <h3><span>히트상품</span></h3>
                   	<c:forEach var="hit" items="${hits}">
                    <article>
                        <a href="/Kmarket/product/view.do?pg=${pg}&cate1=${hit.prodCate1}&cate2=${hit.prodCate2}&prodNo=${hit.prodNo}">
                            <div class="thumb">
                                <img src="http://3.39.231.136:8080/Kmarket/file/${hit.thumb1}" alt="t1">
                            </div>
                            <h2>${hit.prodName}</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del><fmt:formatNumber value="${hit.price}" pattern="#,###"/></del>
                                <span>${hit.discount}%</span>
                            </div>
                            <div class="dis_price">
                                <ins><fmt:formatNumber value="${hit.saleprice}" pattern="#,###"/></ins>
                                <c:choose>
                                <c:when test="${hit.delivery == '0'}">
                                	<span class="free">무료배송</span>
                                </c:when>
                                <c:otherwise>
                                	<span>배송비 <fmt:formatNumber value="${hit.delivery}" pattern="#,###"/></span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        </a>
                    </article>
                    </c:forEach>
                </section>
                <!-- 추천상품 영역 -->
                <section class="recommend">
                    <h3><span>추천상품</span></h3>
                    <c:forEach var="recommend" items="${recs}">
                    <article>
                        <a href="/Kmarket/product/view.do?pg=${pg}&cate1=${recommend.prodCate1}&cate2=${recommend.prodCate2}&prodNo=${recommend.prodNo}">
                            <div class="thumb">
                                <img src="http://3.39.231.136:8080/Kmarket/file/${recommend.thumb1}" alt="t1">
                            </div>
                            <h2>${recommend.prodName}</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del><fmt:formatNumber value="${recommend.price}" pattern="#,###"/></del>
                                <span>${recommend.discount}%</span>
                            </div>
                            <div class="dis_price">
                                <ins><fmt:formatNumber value="${recommend.saleprice}" pattern="#,###"/></ins>
                                <c:choose>
                                <c:when test="${recommend.delivery == '0'}">
                                	<span class="free">무료배송</span>
                                </c:when>
                                <c:otherwise>
                                	<span>배송비 <fmt:formatNumber value="${recommend.delivery}" pattern="#,###"/></span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        </a>
                    </article>
                    </c:forEach>
                </section>
                <!-- 최신상품 영역 -->
                <section class="new">
                    <h3><span>최신상품</span></h3>
                    <c:forEach var="latest" items="${latests}">
                    <article>
                        <a href="/Kmarket/product/view.do?pg=${pg}&cate1=${latest.prodCate1}&cate2=${latest.prodCate2}&prodNo=${latest.prodNo}">
                            <div class="thumb">
                                <img src="http://3.39.231.136:8080/Kmarket/file/${latest.thumb1}" alt="t1">
                            </div>
                            <h2>${latest.prodName}</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del><fmt:formatNumber value="${latest.price}" pattern="#,###"/></del>
                                <span>${latest.discount}%</span>
                            </div>
                            <div class="dis_price">
                                <ins><fmt:formatNumber value="${latest.saleprice}" pattern="#,###"/></ins>
                                <c:choose>
                                <c:when test="${latest.delivery == '0'}">
                                	<span class="free">무료배송</span>
                                </c:when>
                                <c:otherwise>
                                	<span>배송비 <fmt:formatNumber value="${latest.delivery}" pattern="#,###"/></span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        </a>
                    </article>
                    </c:forEach>
                </section>
                <!-- 인기상품 영역 -->
                <section class="hot">
                    <h3><span>인기상품</span></h3>
                   	<c:forEach var="hot" items="${hots}">
                    <article>
                        <a href="/Kmarket/product/view.do?pg=${pg}&cate1=${hot.prodCate1}&cate2=${hot.prodCate2}&prodNo=${hot.prodNo}">
                            <div class="thumb">
                                <img src="http://3.39.231.136:8080/Kmarket/file/${hot.thumb1}" alt="t1">
                            </div>
                            <h2>${hot.prodName}</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del><fmt:formatNumber value="${hot.price}" pattern="#,###"/></del>
                                <span>${hot.discount}%</span>
                            </div>
                            <div class="dis_price">
                                <ins><fmt:formatNumber value="${hot.saleprice}" pattern="#,###"/></ins>
                                <c:choose>
                                <c:when test="${hot.delivery == '0'}">
                                	<span class="free">무료배송</span>
                                </c:when>
                                <c:otherwise>
                                	<span>배송비 <fmt:formatNumber value="${hot.delivery}" pattern="#,###"/></span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        </a>
                    </article>
                    </c:forEach>
                </section>
                <!-- 할인상품 영역 -->
                <section class="discount">
                    <h3><span>할인상품</span></h3>
                    <c:forEach var="discount" items="${dis}">
                    <article>
                        <a href="/Kmarket/product/view.do?pg=${pg}&cate1=${discount.prodCate1}&cate2=${discount.prodCate2}&prodNo=${discount.prodNo}">
                            <div class="thumb">
                                <img src="http://3.39.231.136:8080/Kmarket/file/${discount.thumb1}" alt="t1">
                            </div>
                            <h2>${discount.prodName}</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del><fmt:formatNumber value="${discount.price}" pattern="#,###"/></del>
                                <span>${discount.discount}%</span>
                            </div>
                            <div class="dis_price">
                                <ins><fmt:formatNumber value="${discount.saleprice}" pattern="#,###"/></ins>
                                <c:choose>
                                <c:when test="${discount.delivery == '0'}">
                                	<span class="free">무료배송</span>
                                </c:when>
                                <c:otherwise>
                                	<span>배송비 <fmt:formatNumber value="${discount.delivery}" pattern="#,###"/></span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        </a>
                    </article>
                    </c:forEach>
                </section>
            </section>
        </main>
        <footer>
            <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">전자금융거래약관</a></li>
            </ul>
            <div>
                <p><img src="./img/footer_logo.png" alt="로고"></p>
                <p>
                    <strong>(주)KMARKET</strong>
                    <br>
                    부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                    <br>
                    대표이사 : 홍길동
                    <br>
                    사업자등록번호 : 220-81-83676 사업자정보확인
                    <br>
                    통신판매업신고 : 강남 10630호 Fax : 02-589-8842
                </p>
                <p>
                    <strong>고객센터</strong>
                    <br>
                    Tel : 1234-5678 (평일 09:00~18:00)
                    <br>
                    스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)
                    <br>
                    경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층
                    <br>
                    Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr
                </p>
            </div>
        </footer>
        <button type="button" id="top">상단이동</button>
    </div> 
</body>
</html>