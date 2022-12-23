<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./_header.jsp"/>
<script>
	$(function(){
		
		let sessOrder = JSON.parse(sessionStorage.getItem("sessOrder"));
		let sessCartNo = JSON.parse(sessionStorage.getItem("sessCartNo"));
		console.log(sessOrder);
		console.log(sessCartNo);
		
		let ordCount = Object.keys(sessOrder).length;
		let ordPrice = 0;
		let ordDiscount = 0;
		let ordDelivery = 0;
		let ordPoint = 0;
		
		for(let order of sessOrder){
			
			let tr = "<tr>"
			    tr += "<td><article><a href='#'><img src='http://3.39.231.136:8080/Kmarket/file/"+order.thumb1+"'></a>";
				tr += "<div><h2><a href='#'>"+order.prodName+"</a></h2>"
				tr += "<p>"+order.descript+"</p></div></article></td>"
				tr += "<td>"+order.count+"</td>"
				tr += "<td>"+order.price+"</td>"
				tr += "<td>"+order.discount+"%</td>"
				tr += "<td>"+order.delivery+"</td>"
				tr += "<td>"+order.pricetotal+"</td>"
				tr += "</tr>"
			
			$('.productlist').append(tr);	
				
			let count = Number(order.count);
			let price = Number(order.price) * count;
			let discount = Number(order.discount);
			let discountprice = discount * price / 100;
			let delivery = 0;
			if(order.delivery == '무료배송'){
				delivery = 0;	
			}else{
				delivery = Number(order.delivery);
			}
			let point = Number(order.point);
			
			ordPrice += price;
			ordDiscount += discountprice;
			ordDelivery += delivery;
			ordPoint += point;
		}
		let ordTotal = ordPrice - ordDiscount + ordDelivery;
		
		console.log(ordPrice);
		console.log(ordDiscount);
		console.log(ordDelivery);
		console.log(ordTotal);
		
		
		
		$('#ordCount').append(ordCount+"건");
		$('#ordPrice').append(ordPrice.toLocaleString("ko-KR")+"원");
		$('#ordDiscount').append("-"+ordDiscount.toLocaleString("ko-KR")+"원");
		$('#ordDelivery').append(ordDelivery.toLocaleString("ko-KR")+"원");
		$('#ordTotPrice').append(ordTotal.toLocaleString("ko-KR")+"원");
		
		$('input[name=ordCount]').val(ordCount);
		$('input[name=ordPrice]').val(ordPrice);
		$('input[name=ordDiscount]').val(ordDiscount);
		$('input[name=ordDelivery]').val(ordDelivery);
		$('input[name=ordTotPrice]').val(ordTotal);
		$('input[name=savePoint]').val(ordPoint);
		
		for(let cart of sessCartNo){
			let input = "<input type='hidden' name='cartNo' value='"+cart+"'>";
			
			$('input[name=ordTotPrice]').after(input);
			console.log(cart);
		}
		
		
		
		
		$(document).on('click', 'input[name=usingpoint]', function(){
			
			
			let recentpoint = '${recentpoint}';
			
			if(recentpoint < 5000){
				$('input[name=usingpoint]').attr("disabled",true);
			}else{
				let usedPoint = Number($('input[name=point]').val());
				
				console.log('usedPoint : ' + usedPoint);
				
				$('#ordPoint').empty();
				$('#ordPoint').append("-"+usedPoint);
				
				let ordTotPrice = ordTotal - usedPoint;
				console.log('ordTotPrice2 : ' + ordTotPrice);
				
								
				$('#ordTotPrice').empty();
				$('#ordTotPrice').append(ordTotPrice+"원");
				$('input[name=ordTotPrice]').val(ordTotPrice);
			}
			
			
		});
	});
</script>
    <!-- 주문 페이지 시작-->
    <section class="order">
      
      <!-- 제목, 페이지 네비게이션 -->
      <nav>
        <h1>주문결제</h1>
        <p>
          HOME > 장바구니 > <strong>주문결제</strong>
        </p>
      </nav>

      <form action="/Kmarket/product/order.do" method="post">
	      <input type="hidden" name="ordPrice" value="">
	      <input type="hidden" name="ordCount" value="">
	      <input type="hidden" name="ordDiscount" value="">
	      <input type="hidden" name="ordDelivery" value="">
	      <input type="hidden" name="savePoint" value="">
	      <input type="hidden" name="ordTotPrice" value="">
	      
      
        <!-- 주문 상품 목록 -->                  
        <table class="productlist">
          <tr>
            <th>상품명</th>
            <th>총수량</th>
            <th>판매가</th>
            <th>할인</th>
            <th>배송비</th>
            <th>소계</th>
          </tr>
          
            <tr class="empty">
              <td colspan="7">장바구니에 상품이 없습니다.</td>
            </tr>
            
			<c:forEach var="product" items="${carts}">
			 	<tr>
	              <td>
	                <article>
	                  <a href="#"><img src="http://3.39.231.136:8080/Kmarket/file/${product.thumb1}" alt=""></a>
	                  <div>
	                    <h2><a href="#">${product.prodName}</a></h2>
	                    <p>${product.descript}</p>
	                  </div>
	                </article>
	              </td>
	              <td>${product.count}</td>
	              <td>${product.price}</td>
	              <td>${product.discount}%</td>
	              <c:choose>
	              	<c:when test="${product.delivery eq 0}">
	              		<td>무료배송</td>	
	              	</c:when>
	              	<c:otherwise>
	              		<td>${product.delivery}원</td>
	              	</c:otherwise>
	              </c:choose>
	              <td>${product.total}</td>
	            </tr>
			</c:forEach>
        </table>                 
        
        <!-- 최종 결제 정보 -->
        <div class="final">
          <h2>최종결제 정보</h2>
			<table border="0">
	            <tr>
	              <td>총</td>
	              <td id="ordCount"></td>
	            </tr>
	            <tr>
	              <td>상품금액</td>
	              <td id="ordPrice"></td>
	            </tr>
	            <tr>
	              <td>할인금액</td>
	              <td id="ordDiscount"></td>
	            </tr>
	            <tr>
	              <td>배송비</td>
	              <td id="ordDelivery"></td>
	            </tr>
	            <tr>
	              <td>포인트 할인</td>
	              <td id="ordPoint">0</td>
	            </tr>
	            <tr>
	              <td>전체주문금액</td>
	              <td id="ordTotPrice"></td>
	            </tr>                            
          </table>
          <input type="submit" name="ordercomplete" value="결제하기">
        </div>
          
        <!-- 배송정보 -->
        <article class="delivery">
          <h1>배송정보</h1>                          
          <table>
            <tr>
              <td>주문자</td>
              <td><input type="text" name="orderer" /></td>
            </tr>
            <tr>
              <td>휴대폰</td>
              <td>
                <input type="text" name="hp" />
                <span>- 포함 입력</span>
              </td>
            </tr>
            <tr>
              <td>우편번호</td>
              <td>
                <input type="text" name="zip"/>
                <input type="button" value="검색"/>
              </td>
            </tr>
            <tr>
              <td>기본주소</td>
              <td>
                <input type="text" name="addr1"/>
              </td>
            </tr>
            <tr>
              <td>상세주소</td>
              <td>
                <input type="text" name="addr2"/>
              </td>
            </tr>
          </table>
        </article>

        <!-- 할인정보 -->
        <article class="discount">
          <h1>할인정보</h1>

          <div>
            <p>현재 포인트 : <span>${recentpoint}</span>점</p>
            <label>
                <input type="text" name="point" />점
                <input type="button" name="usingpoint" value="적용"/>
            </label>
            <span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
          </div>
        </article>

        <!-- 결제방법 -->
        <article class="payment">
            <h1>결제방법</h1>
            <div>
                <span>신용카드</span>
                <p>
                    <label><input type="radio" name="payment" value="1"/>신용카드 결제</label>
                    <label><input type="radio" name="payment" value="2"/>체크카드 결제</label>                                
                </p>
            </div>
            <div>
                <span>계좌이체</span>
                <p>
                    <label><input type="radio" name="payment" value="3"/>실시간 계좌이체</label>
                    <label><input type="radio" name="payment" value="4"/>무통장 입금</label>                                
                </p>
            </div>
            <div>
                <span>기타</span>
                <p>
                    <label><input type="radio" name="payment" value="5"/>휴대폰결제</label>
                    <label>
                        <input type="radio" name="payment" value="6"/>카카오페이
                        <img src="../img/ico_kakaopay.gif" alt="카카오페이"/>
                    </label>                                
                </p>
            </div>
        </article>

        <!-- 경고 -->
        <article class="alert">
          <ul>
              <li><span>케이마켓의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 케이마켓 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.</span></li>
              <li><span>케이마켓 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.</span></li>
              <li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다.</span></li>
          </ul>
        </article>
     
      </form>
      
    </section>
    <!-- 주문 페이지 끝-->
</main>
<jsp:include page="./_footer.jsp"/>