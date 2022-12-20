<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./_header.jsp"/>
<script>
	function getTodayLabel() {
	    
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
	    
	    var today = new Date().getDay()+3;
	    console.log('today : ' + today);
	    
	    if(today >= 7){
	    	today = today % 7;
	    }
	    
	    var todayLabel = week[today];
	    console.log('todayLabel : ' + todayLabel);
	    
	    return todayLabel;
	}

	$(function(){
		
		let pricenum = Number($('input[name=num]').val());
		
		$('.decrease').click(function(){
			$('.total > span').empty();
			pricenum = Number($('input[name=num]').val()) - 1;
			$('input[name=num]').attr("value", pricenum);
			let price = pricenum * '${disprice}';
			$('.total > span').append(price);
		});
		$('.increase').click(function(){
			$('.total > span').empty();
			pricenum = Number($('input[name=num]').val()) + 1;
			$('input[name=num]').attr("value", pricenum);
			
			let price = pricenum * '${disprice}';
			$('.total > span').append(price);
		});
		
		const date = new Date();

		const month = date.getMonth() + 1;
		const day = date.getDate()+3;
	    
		const dateStr = '모레('+ getTodayLabel() +') ' + month + '/' + day + ' 도착예정';

		$('.arrival').append(dateStr);
		
		
		$(document).on('click', '.cart', function(){
			
			let uid = '${sessMember.uid}';
			console.log('here1 : ' + uid);
			
			
			if(uid == ''){
				alert('로그인 후 이용 가능합니다.');
			}else{
				let cate1 = '${vo.cate1}';
				let cate2 = '${vo.cate2}';
				let prodNo = '${product.prodNo}';
				let price = '${product.price}';

				let uid = '${sessMember.uid}'

				let discount = '${product.discount}';
				let point = '${product.point}';
				let delivery = '${product.delivery}';
				let total = pricenum * '${disprice}';
				
				console.log('here2 : ' + cate1);
				console.log('here3 : ' + cate2);
				console.log('here4 : ' + prodNo);
				
				let jsonData = {
					"uid":uid,
					"prodNo":prodNo,
					"count":pricenum,
					"price":price,
					"discount":discount,
					"point":point,
					"delivery":delivery,
					"total":total,
				};
				
				console.log('here5 : ' + jsonData);
				
				
				$.ajax({
					url:'/Kmarket/product/gocart.do',
					method:'post',
					data:jsonData,
					dataType:'json',
					success:function(data){
						if(data.result > 0){
							
							console.log('here6');
							
							if (confirm("장바구니로 이동하시겠습니까?")){
								console.log('here7');
								location.href = '/Kmarket/product/cart.do?cate1='+cate1+'&cate2='+cate2;
							}
							else{
								console.log('here8');
							    location.href = '/Kmarket/product/view.do?cate1='+cate1+'&cate2='+cate2+'&prodNo='+prodNo;
							}
						}
					}
				});
				
			}
			
		});
		$(document).on('click', '.order', function(){
			console.log('here2');
			
			let uid = '${sessMember.uid}';
			
			let prodNo = '${product.prodNo}';
			let pricenum = $('input[name=num]').val();
			
			console.log('prodNo : '+ prodNo);
			console.log('pricenum : '+ pricenum);
			
			if(uid == ''){
				alert('로그인 후 이용 가능합니다.');
			}else{				
				//location.href = '/Kmarket/product/order.do?prodNo='+prodNo+'&count='+pricenum;
				
				
				$.ajax({
					url:'/Kmarket/product/view.do',
					method:'POST',
					data: {"prodNo": prodNo, "count": pricenum},
					dataType:'json',
					success:function(data){
												
						console.log('here5');
						
						if(data.result > 0){
							console.log('here6');
							location.href = '/Kmarket/product/order.do';	
						}
						
					}
				});
				
			}
		});
	});
</script>
    <!--상품 상세페이지 시작-->
    <section class="view">
        <!--제목, 페이지 네비게이션-->
        <nav>
            <h1>상품보기</h1>
            <p>HOME > <span>${vo.c1Name}</span> > <strong>${vo.c2Name}</strong></p>
        </nav>

        <!--상품 전체 정보 내용-->
        <article class="info">
            <div class="image">
                <img src="http://3.39.231.136:8080/Kmarket/file/${product.thumb3}" alt="상품이미지">
            </div>
            <div class="summary">
                <nav>
                    <h1>${product.seller}</h1>
                    <h2>상품번호&nbsp;:&nbsp;<span>${product.prodNo}</span></h2>
                </nav>
                <nav>
                    <h3>상품명</h3>
                    <p>${product.descript}</p>
                    <c:choose>
                    	<c:when test="${product.score eq 1}">
                    		<h5 class="rating star1"><a href="#">상품평보기</a></h5>
                    	</c:when>
                    	<c:when test="${product.score eq 2}">
                    		<h5 class="rating star2"><a href="#">상품평보기</a></h5>
                    	</c:when>
                    	<c:when test="${product.score eq 3}">
                    		<h5 class="rating star3"><a href="#">상품평보기</a></h5>
                    	</c:when>
                    	<c:when test="${product.score eq 4}">
                    		<h5 class="rating star4"><a href="#">상품평보기</a></h5>
                    	</c:when>
                    	<c:otherwise>
                    		<h5 class="rating star5"><a href="#">상품평보기</a></h5>
                    	</c:otherwise>
                    </c:choose>
                </nav>
                <nav>
                	<c:choose>
                    	<c:when test="${product.discount gt 0}">
		                    <div class="org_price">
		                        <del>${product.price}</del>
		                        <span>${product.discount}%</span>
		                    </div>
		                    <div class="dis_price">
		                        <ins>${disprice}</ins>
		                    </div>
	                    </c:when>
                   		<c:otherwise>
                            <div class="dis_price">
                           		<ins>${product.price}</ins> 
                            </div>
                   		</c:otherwise>
                   	</c:choose>
                </nav>
                <nav>
	                <c:choose>
	                	<c:when test="${product.delivery eq 0}">
	                		<span class="delivery">무료배송</span>	
	                	</c:when>
	                	<c:otherwise>
	                		<span class="delivery">${product.delivery}원</span>	
	                	</c:otherwise>
	                </c:choose>
                    <span class="arrival"></span>
                    <span class="desc">본 상품은 국내배송만 가능합니다.</span>
                </nav>
                <nav>
                    <span class="card cardfree"><i>아이콘</i>무이자할부</span>&nbsp;&nbsp;
                    <span class="card cardadd"><i>아이콘</i>카드추가혜택</span>
                </nav>
                <nav>
                    <span class="origin">원산지-상세설명 참조</span>
                </nav>
                <img src="../img/vip_plcc_banner.png" alt="100원만 결제해도 1만원 적립!" class="banner" />
                
                <div class="count">
                    <button class="decrease">-</button>
                    <input type="text" name="num" value="1" readonly/>
                    <button class="increase">+</button>
                </div>
                
                <div class="total">
                    <span>${disprice}</span>
                    <em>총 상품금액 </em>
                </div>

                <div class="button">
                    <input type="button" class="cart"  value="장바구니"/>
                    <input type="button" class="order" value="구매하기"/>
                </div>
                
            </div>
        </article>
        <!-- 상품 정보 내용 -->
        <article class="detail">
            <nav>
                <h1>상품정보</h1>
            </nav>
            <!-- 상품상세페이지 이미지 -->
            <img src="http://3.39.231.136:8080/Kmarket/file/${product.detail}" alt="상세페이지1">
        </article>
        <!-- 상품 정보 제공 고시 내용 -->
        <article class="notice">
            <nav>
                <h1>상품 정보 제공 고시</h1>
                <p>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 등록된 정보입니다.</p>
            </nav>
            <table border="0">
                <tr>
                    <td>상품번호</td>
                    <td>${product.prodNo}</td>
                </tr>
                <tr>
                    <td>상품상태</td>
                    <td>${product.status}</td>
                </tr>
                <tr>
                    <td>부가세 면세여부</td>
                    <td>${product.duty}</td>
                </tr>
                <tr>
                    <td>영수증발행</td>
                    <td>${product.receipt}</td>
                </tr>
                <tr>
                    <td>사업자구분</td>
                    <td>${product.bizType}</td>
                </tr>
                <tr>
                    <td>브랜드</td>
                    <td>${product.company}</td>
                </tr>
                <tr>
                    <td>원산지</td>
                    <td>${product.origin}</td>
                </tr>
            </table>
            <table border="0">
                <tr>
                    <td>제품소재</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>색상</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>치수</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>제조자/수입국</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>제조국</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>취급시 주의사항</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>제조연월</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>품질보증기준</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>A/S 책임자와 전화번호</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                    <td>주문후 예상 배송기간</td>
                    <td>상세정보 직접입력</td>
                </tr>
                <tr>
                <td colspan="2">구매, 교환, 반품, 배송, 설치 등과 관련하여 추가비용, 제한조건 등의 특이사항이 있는 경우</td>
                </tr>
            </table>
            <p class="notice">
                소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고
                동법 제 18조 제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의
                환급이 3영업일을 넘게 지연된 경우, 소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조
                제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여 전상법 시행령으로 정하는 이율을 곱하여
                산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 아울러, 교환∙반품∙보증 및 결제대금의
                환급신청은 [나의쇼핑정보]에서 하실 수 있으며, 자세한 문의는 개별 판매자에게 연락하여 주시기 바랍니다.
            </p>
        </article>
        
        <!-- 상품 리뷰 내용 -->
        <article class="review">
            <nav>
                <h1>상품리뷰</h1>
            </nav>
            <ul>
                <li>
                    <div>
                        <h5 class="rating star4">상품평</h5>
                        <span>seo******	2018-07-10</span>
                    </div>
                    <h3>${product.prodName}</h3>
                    <p>
                        가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                        아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                        제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                    </p>
                </li>
                <li>
                    <div>
                        <h5 class="rating star4">상품평</h5>
                        <span>seo******	2018-07-10</span>
                    </div>
                    <h3>${product.prodName}</h3>
                    <p>
                        가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                        아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                        제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                    </p>
                </li>
                <li>
                    <div>
                        <h5 class="rating star4">상품평</h5>
                        <span>seo******	2018-07-10</span>
                    </div>
                    <h3>${product.prodName}</h3>
                    <p>
                        가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                        아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                        제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                    </p>
                </li>
                <li>
                    <div>
                        <h5 class="rating star4">상품평</h5>
                        <span>seo******	2018-07-10</span>
                    </div>
                    <h3>${product.prodName}</h3>
                    <p>
                        가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                        아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                        제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                    </p>
                </li>
                <li>
                    <div>
                        <h5 class="rating star4">상품평</h5>
                        <span>seo******	2018-07-10</span>
                    </div>
                    <h3>${product.prodName}</h3>
                    <p>
                        가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                        아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                        제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                    </p>
                </li>
            </ul>
            <div class="paging">
                <span class="prev"><a href="#"><&nbsp;이전</a></span>
                <span class="num">
                    <a href="#" class="on">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>
                </span>
                <span class="next"><a href="#">다음&nbsp;></a></span>
            </div>
        </article>
    </section>
</main>
<jsp:include page="./_footer.jsp"/>