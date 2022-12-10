<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"></jsp:include>
<script>
	$(function(){
		
		$(document).on('change', 'select[name=prodCate1]', function(){
			
			let cate1 = $('select[name=prodCate1] > option:selected').val();
			
			let brand = ['브랜드 여성의류', '브랜드 남성의류', '브랜드 진/캐쥬얼', '브랜드 신발/가방', '브랜드 쥬얼리/시계', '브랜드 아웃도어'];
			let fashion = ['여성의류','남성의류','언더웨어','신발','가방/잡화','쥬얼리/시계','화장품/향수','바디/헤어'];
			let kids = ['출산/육아','장난감/완구','유아동 의류','유아동 신발/잡화'];
			let food = ['신선식품','가공식품','건강식품','커피/음료','생필품','바디헤어'];
			let home = ['가구/DIY','침구/커튼','조명/인테리어','생활용품','주방용품','문구/사무용품','사무기기','악기/취미','반려동물용품'];
			let computer =['노트북/PC','모니터/프린터','PC주변기기','모바일/태블릿','카메라','게임','영상가전','주방가전','계절가전','생활/미용가전','음향가전','건강가전'];
			let sports = ['스포츠의류/운동화','휘트니스/수영','구기/라켓','골프','자전거/보드/기타레저','캠핑/낚시','등산/아웃도어','건강/의료용품','건강식품','렌탈서비스'];
			let car = ['자동차용품','공구/안전/산업용품'];
			let trv = ['여행/항공권','도서/음반/e교육','공연티켓','e쿠폰','상품권'];
			
			let cate2;
			
			if(cate1 == '10'){
				cate2 = brand;
			}else if(cate1 == '11'){
				cate2 = fashion;
			}else if(cate1 == '12'){
				cate2 = kids;
			}else if(cate1 == '13'){
				cate2 = food;
			}else if(cate1 == '14'){
				cate2 = home;
			}else if(cate1 == '15'){
				cate2 = computer;
			}else if(cate1 == '16'){
				cate2 = sports;
			}else if(cate1 == '17'){
				cate2 = car;
			}else{
				cate2 = trv;
			}
			
			$('.cate2').empty();
			
			for(let i = 0; i < cate2.length; i++){
				let html = $("<option value="+[10+i]+">"+cate2[i]+"</option>");
				$('.cate2').append(html);
			}
			
		});
	});
</script>
<main>
    <aside>
        <ul id="gnb">
            <li>
                <a href="#"><i class="fa fa-cogs"></i>환경설정</a>
                <ol>
                    <li><a href="#">기본환경설정</a></li>
                    <li><a href="#">배너관리</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fa fa-store"></i>상점관리</a>
                <ol>
                    <li><a href="#">판매자현황</a></li>
                    <li><a href="#">재고관리</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fa fa-users"></i>회원관리</a>
                <ol>
                    <li><a href="#">회원현황</a></li>
                    <li><a href="#">포인트관리</a></li>
                    <li><a href="#">비회원관리</a></li>
                    <li><a href="#">접속자집계</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-box-open"></i>상품관리</a>
                <ol>
                    <li><a href="#">상품현황</a></li>
                    <li><a href="#">상품등록</a></li>
                    <li><a href="#">재고관리</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fa fa-credit-card"></i>주문관리</a>
                <ol>
                    <li><a href="#">주문현황</a></li>
                    <li><a href="#">매출관리</a></li>
                    <li><a href="#">결제관리</a></li>
                    <li><a href="#">배송관리</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fa fa-pencil-square-o"></i>게시판관리</a>
                <ol>
                    <li><a href="#">게시판현황</a></li>
                    <li><a href="#">고객문의</a></li>
                </ol>
            </li>
        </ul>
    </aside>
    <section id="admin-product-register">
        <nav>
            <h3>상품등록</h3>
            <p>
                HOME > 상품관리 > <strong>상품등록</strong>
            </p>
        </nav>
        <!-- 상품등록 컨텐츠 시작 -->
        <article>
            <form action="/Kmarket/admin/product/register.do" method="post" enctype="multipart/form-data">
                <!-- 상품분류 -->
                <section>
                    <h4>상품분류</h4>
                    <p>기본분류는 반드시 선택하셔야 합니다. 하나의 상품에 1개의
                        분류를 지정 합니다.
                    </p>
                    <table>
                        <tbody>
                            <tr>
                                <td>1차 분류</td>
                                <td>
                                    <select name="prodCate1">
                                        <option value="cate0">1차 분류 선택</option>
                                        <c:forEach var="category" items="${categories}">
                                        	<option value="${category.cate1}">${category.c1Name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>2차 분류</td>
                                <td>
                                    <select name="prodCate2" class="cate2">
                                        <option value="11">2차 분류 선택</option>
                                        <c:forEach var="category2" items="${cate2}">
                                        	<option value="${category2.cate2}">${category2.c2Name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <!-- 기본정보 -->
                <section>
                    <h4>기본정보</h4>
                    <p>기본정보는 반드시 입력해야 합니다.</p>
                    <table>
                        <tbody>
                            <tr>
                                <td>상품명</td>
                                <td><input type="text" name="prodName"></td>
                            </tr>
                            <tr>
                                <td>기본설명</td>
                                <td>
                                    <span>상품명 하단에 상품에 대한 추가적인 설명이 필요한 경우에 입력</span>
                                    <input type="text" name="descript">
                                </td>
                            </tr>
                            <tr>
                                <td>제조사</td>
                                <td><input type="text" name="company"></td>
                            </tr>
                            <tr>
                                <td>판매자</td>
                                <td><input type="text" name="seller"></td>
                            </tr>
                            <tr>
                                <td>판매가격</td>
                                <td><input type="text" name="price">원</td>
                            </tr>
                            <tr>
                                <td>할인율</td>
                                <td>
                                    <span>0을 입력하면 할인율 없음</span>
                                    <input type="text" name="discount">원
                                </td>
                            </tr>
                            <tr>
                                <td>포인트</td>
                                <td>
                                    <span>0을 입력하면 포인트 없음</span>
                                    <input type="text" name="point">점
                                </td>
                            </tr>
                            <tr>
                                <td>재고수량</td>
                                <td><input type="text" name="stock">개</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>
                                    <span>0을 입력하면 배송비 무료</span>
                                    <input type="text" name="delivery">원
                                </td>
                            </tr>
                            <tr>
                                <td>상품 썸네일</td>
                                <td>
                                    <span>크기 190 x 190, 상품 목록에 출력될 이미지 입니다.</span>
                                    <input type="file" name="thumb1">
                                    <span>크기 230 x 230, 상품 메인에 출력될 이미지 입니다.</span>
                                    <input type="file" name="thumb2">
                                    <span>크기 456 x 456, 상품 상세에 출력될 이미지 입니다.</span>
                                    <input type="file" name="thumb3">
                                </td>
                            </tr>
                            <tr>
                                <td>상세 상품정보</td>
                                <td>
                                    <span>
                                        크기 가로 940px 높이 제약없음, 크기 최대 1MB,
                                        상세페이지 상품정보에 출력될 이미지 입니다.
                                    </span>
                                    <input type="file" name="detail">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <!-- 상품정보 제공 고시 -->
                <section>
                    <h4>상품정보 제공고시</h4>
                    <p>
                        [전자상거래에 관한 상품정보 제공에 관한 고시] 항목에
                        의거 등록해야 되는 정보입니다.
                    </p>
                    <table>
                        <tbody>
                            <tr>
                                <td>상품상태</td>
                                <td><input type="text" name="status" value="새상품"></td>
                            </tr>
                            <tr>
                                <td>부가세 면세여부</td>
                                <td><input type="text" name="duty" value="과세상품"></td>
                            </tr>
                            <tr>
                                <td>영수증발행</td>
                                <td><input type="text" name="receipt" value="발행가능 - 신용카드 전표, 온라인 현금영수증"></td>
                            </tr>
                            <tr>
                                <td>사업자구분</td>
                                <td><input type="text" name="bizType" value="사업자 판매자"></td>
                            </tr>
                            <tr>
                                <td>원산지</td>
                                <td><input type="text" name="origin" value="국내산"></td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <input type="submit" value="등록하기">
            </form>
        </article>
        <p class="ico alert">
            <strong>Warning!</strong>
            전자상거래 등에서의 상품 등의 정보제공에 관한 고시에 따라 총
            35개 상품군에 대해 상품 특성 등을 양식에 따라 입력할 수 있습니다.
        </p>
        <!-- 상품등록 컨텐츠 끝 -->
    </section>
</main>
<jsp:include page="../_footer.jsp"/>