<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./_header.jsp"/>
<script>
	
	$(function(){
		$('input[name=allCk]').change(function(){
			var checked = $(this).is(':checked');
			
			if(checked){
				$('input[name=cartlist]').prop('checked', true).change();
			}else{
				$('input[name=cartlist]').prop('checked', false).change();				
			}
				
		});
		
		$('input[name=del]').click(function(){
			var checkBoxArr = [];
			
			$('input:checkbox[name=cartlist]:checked').each(function(){
				checkBoxArr.push($(this).val());
				console.log(checkBoxArr);
			}); 			
			
			let jsonData = {"checkBoxArr":checkBoxArr};
			console.log('here1 : '+jsonData);
			
			$.ajax({
				url:'/Kmarket/product/deletecart.do',
				method:'post',
				traditional: true,
				data:jsonData,				
				dataType:'json',
				success:function(data){
					console.log('here2');
					alert('장바구니에서 상품이 삭제되었습니다');
					location.href = '/Kmarket/product/cart.do';
				}
			});
		});
		
		$(document).on('change', 'input[name=cartlist]', function(){
			////////////////////////
			// 전체합계 집계
			////////////////////////
						
			// 상품수 계산
			var checked  = $(this).is(':checked');
			let counttotal = Number($('#totalCount').text());
			let pricetotal = Number($('#totalPrice').text());
			let discounttotal = Number($('#totalDiscount').text());
			let deliverytotal = Number($('#totalDelivery').text());
			let salepricetotal = Number($('#totalSalePrice').text());
			let pointtotal = Number($('#totalPoint').text());
			
			let count  = Number($(this).parents('tr').find('.count').text());			
			console.log('count : ' + count);
			let price  = Number($(this).parents('tr').find('.price').text());
			console.log('price : '+price);
			let discount  = Number($(this).parents('tr').find('.discount').text());
			console.log('discount : '+discount);
			let delivery = $(this).parents('tr').find('.delivery').text();
			let total = Number($(this).parents('tr').find('.pricetotal').text());
			let point = Number($(this).parents('tr').find('.point').text());
			
			if(checked){
				// 체크했을 때
				counttotal = counttotal + count;
				pricetotal = pricetotal + (price * count);
				discounttotal = discounttotal + (price * discount * count/100);
				
				console.log('1.counttotal : ' + counttotal);
				console.log('1.pricetotal : ' + pricetotal);
				console.log('1.discounttotal : ' + discounttotal);
				
				if(delivery == '무료배송'){
					delivery = 0;
					deliverytotal = deliverytotal + delivery;
					salepricetotal = salepricetotal + total + deliverytotal;
					console.log('1.salepricetotal : '+salepricetotal);
				}else{
					delivery = Number(delivery);
					console.log('1.delivery : '+delivery);
					deliverytotal = deliverytotal + delivery;
					console.log('1.deliverytotal : '+deliverytotal);
					salepricetotal = salepricetotal + total + deliverytotal;
					console.log('1.salepricetotal : '+salepricetotal);
				}
				pointtotal = pointtotal + point;
			}else{
				// 체크해제 했을때
				counttotal = counttotal - count;
				pricetotal = pricetotal - (price * count);
				discounttotal = discounttotal - (price * discount * count/100);
				
				console.log('2.counttotal : ' + counttotal);
				console.log('2.pricetotal : ' + pricetotal);
				console.log('2.discounttotal : ' + discounttotal);
				
				if(delivery == '무료배송'){
					delivery = 0;
					deliverytotal = deliverytotal - delivery;
					salepricetotal = salepricetotal - total - deliverytotal;
					console.log('2.salepricetotal : '+salepricetotal);
				}else{
					delivery = Number(delivery);
					deliverytotal = deliverytotal - delivery;
					salepricetotal = salepricetotal - total - deliverytotal;
					console.log('2.salepricetotal : '+salepricetotal);
				}
				pointtotal = pointtotal - point;
			}
			$('#totalCount').text(counttotal);
			$('#totalPrice').text(pricetotal.toLocaleString("ko-KR"));
			$('#totalDiscount').text(discounttotal.toLocaleString("ko-KR"));
			$('#totalDelivery').text(deliverytotal.toLocaleString("ko-KR"));
			$('#totalSalePrice').text(salepricetotal.toLocaleString("ko-KR"));
			$('#totalPoint').text(pointtotal.toLocaleString("ko-KR"));
			
			// 상품금액 계산
			// 할인금액 계산
			// 배송비 계산
			// 포인트 계산
			// 전체주문금액 계산
			
		});
		
		$('input[name=submitorder]').click(function(e){
			e.preventDefault();
			
			if(confirm('주문페이지로 이동하시겠습니까?')){
				
				let checkBoxArr = [];
				let cartNos = [];
				console.log('here1');
				
				$('input:checkbox[name=cartlist]:checked').each(function(){
					console.log('here2');
								
					let tr = $(this).parents('tr');
					let cartNo = $(this).val();
					let thumb1 = tr.find('.thumb1 > img').attr('alt');
					let prodName = tr.find('.prodName').text();
					let descript = tr.find('.descript').text();
					let count = tr.find('.count').text();
					let price = tr.find('.price').text();
					let discount = tr.find('.discount').text();
					let point = tr.find('.point').text();
					let delivery = tr.find('.delivery').text();
					let pricetotal = tr.find('.pricetotal').text();
					
					let jsonData = {
							"thumb1": thumb1,
							"prodName": prodName,
							"descript":descript,
							"count":count,
							"price":price,
							"discount":discount,
							"point":point,
							"delivery":delivery,
							"pricetotal":pricetotal
					};
					
					
					checkBoxArr.push(jsonData);					
					cartNos.push(cartNo);
				}); 
				
				console.log('here3 : ' + checkBoxArr.length);
				console.log('here4 : ' + JSON.stringify(checkBoxArr));
				console.log('here4 : ' + JSON.stringify(cartNos));
				
				sessionStorage.setItem("sessOrder", JSON.stringify(checkBoxArr));
				sessionStorage.setItem("sessCartNo", JSON.stringify(cartNos));
				location.href = '/Kmarket/product/order.do';
				
				console.log('here5');
				
			}else{
				return;
			}
			
		});
	});
</script>
    <!-- 장바구니 페이지 시작 -->
    <section class="cart">
      
      <!-- 제목, 페이지 네비게이션 -->
      <nav>
        <h1>장바구니</h1>
        <p>
          HOME > <span>${sessMember.uid}</span> > <strong>장바구니</strong>
        </p>
      </nav>
                    
      <form action="#">
        <!-- 장바구니 목록 -->
        <table>
          <thead>
            <tr>
              <th><input type="checkbox" name="allCk"></th>
              <th>상품명</th>
              <th>총수량</th>
              <th>판매가</th>
              <th>할인</th>
              <th>포인트</th>
              <th>배송비</th>
              <th>소계</th>
            </tr>
          </thead>
          <tbody>
            <tr class="empty">
              <td colspan="7">장바구니에 상품이 없습니다.</td>
            </tr>
            <c:forEach var="cart" items="${carts}">
            	<tr class="notempty">
	              <td><input type="checkbox" name="cartlist" id="ck" value="${cart.cartNo}"></td>
	              <td>
	                <article>
	                  <a href="#" class="thumb1"><img src="http://3.39.231.136:8080/Kmarket/file/${cart.thumb1}" alt="${cart.thumb1}"></a>
	                  <div>
	                    <h2><a href="#" class="prodName">${cart.prodName}</a></h2>
	                    <p class="descript">${cart.descript}</p>
	                  </div>
	                </article>
	              </td>
	              <td class="count">${cart.count}</td>
	              <td class="price">${cart.price}</td>
	              <td><span class="discount">${cart.discount}</span>%</td>
	              <td class="point">${cart.point}</td>
	              <c:choose>
	              	 <c:when test="${cart.delivery eq 0}">
		              	<td class="delivery">무료배송</td>
		             </c:when>
		             <c:otherwise>
		             	<td class="delivery">${cart.delivery}</td>
		             </c:otherwise>  
	              </c:choose>
	              <td class="pricetotal">${cart.total}</td>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
        <input type="button" name="del" value="선택삭제">

        <!-- 장바구니 전체합계 -->
        <div class="total">
          <h2>전체합계</h2>
          <table border="0">
            <tr>
              <td>상품수</td>
              <td id="totalCount">0</td>
            </tr>
            <tr>
              <td>상품금액</td>
              <td id="totalPrice">0</td>
            </tr>
            <tr>
              <td>할인금액</td>
              <td id="totalDiscount">0</td>
            </tr>
            <tr>
              <td>배송비</td>
              <td id="totalDelivery">0</td>
            </tr>              
            <tr>
              <td>포인트</td>
              <td id="totalPoint">0</td>
            </tr>
            <tr>
              <td>전체주문금액</td>
              <td id="totalSalePrice">0</td>
            </tr>
          </table>
          <input type="submit" name="submitorder" value="주문하기">    
        </div>

      </form>

    </section>
    <!-- 장바구니 페이지 끝 -->
</main>
<jsp:include page="./_footer.jsp"/>