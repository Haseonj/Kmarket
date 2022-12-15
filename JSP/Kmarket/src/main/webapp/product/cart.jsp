<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./_header.jsp"/>
<script>
	
	$(function(){
		$('input[name=allCk]').click(function(){
			var checked = $('input[name=allCk]').is(':checked');
			
			if(checked){
				$('input:checkbox').prop('checked',true);
			}else{
				$('input:checkbox').prop('checked',false);
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
					location.href = '/Kmarket/product/cart.do?cate1=10&cate2=10';
				}
			});
		});
		
		$(document).on('click', 'input[name=cartlist]', function(){
			////////////////////////
			// 전체합계 집계
			////////////////////////
						
			// 상품수 계산
			var checked  = $(this).is(':checked');
			let counttotal = Number($('#totalCount').text());
			let count  = Number($(this).parents('tr').find('#count').text());			
			console.log('count : ' + count);
			
			if(checked){
				// 체크했을 때
				counttotal = counttotal + count;				
				console.log('1.counttotal : ' + counttotal);
				$('#totalCount').text(counttotal);
			}else{
				// 체크해제 했을때
				counttotal = counttotal - count;
				console.log('2.counttotal : ' + counttotal);
				$('#totalCount').text(counttotal);
			}
			
			
			// 상품금액 계산
			// 할인금액 계산
			// 배송비 계산
			// 포인트 계산
			// 전체주문금액 계산
			
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
            	<tr>
	              <td><input type="checkbox" name="cartlist" id="ck" value="${cart.prodNo}"></td>
	              <td>
	                <article>
	                  <a href="#"><img src="http://3.39.231.136:8080/Kmarket/file/${cart.thumb1}" alt=""></a>
	                  <div>
	                    <h2><a href="#">${cart.prodName}</a></h2>
	                    <p>${cart.descript}</p>
	                  </div>
	                </article>
	              </td>
	              <td id="count">${cart.count}</td>
	              <td id="price">${cart.price}</td>
	              <td id="discount">${cart.discount}%</td>
	              <td id="point">${cart.point}</td>
	              <c:choose>
	              	 <c:when test="${cart.delivery eq 0}">
		              	<td>무료배송</td>
		             </c:when>
		             <c:otherwise>
		             	<td id="delivery">${cart.delivery}</td>
		             </c:otherwise>  
	              </c:choose>
	              <td id="total">${cart.total}</td>
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
              <td>0</td>
            </tr>              
            <tr>
              <td>포인트</td>
              <td>0</td>
            </tr>
            <tr>
              <td>전체주문금액</td>
              <td>0</td>
            </tr>
          </table>
          <input type="submit" name="" value="주문하기">    
        </div>

      </form>

    </section>
    <!-- 장바구니 페이지 끝 -->
</main>
<jsp:include page="./_footer.jsp"/>