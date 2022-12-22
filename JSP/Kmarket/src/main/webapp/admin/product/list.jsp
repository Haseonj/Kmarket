<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../_header.jsp"/>
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
		
		$('input:checkbox[name=prodlist]:checked').each(function(){
			checkBoxArr.push($(this).val());
			console.log(checkBoxArr);
		}); 			
		
		let jsonData = {"checkBoxArr":checkBoxArr};
		console.log('here1 : '+jsonData);
		
		$.ajax({
			url:'/Kmarket/admin/delete.do',
			method:'post',
			traditional: true,
			data:jsonData,				
			dataType:'json',
			success:function(data){
				console.log('here2');
				alert('장바구니에서 상품이 삭제되었습니다');
				location.href = '/Kmarket/admin/product/list.do';
			}
		});
	});
});
</script>
    <section id="admin-product-list">
        <nav>
            <h3>상품목록</h3>
            <p>
                HOME > 상품관리 > <strong>상품목록</strong>
            </p>
        </nav>
        <!-- 상품목록 컨텐츠 시작 -->
        <section>
            <div>
            <form>
                <select name="search">
                    <option value="prodName">상품명</option>
                    <option value="prodNo">상품코드</option>
                    <option value="company">제조사</option>
                    <option value="seller">판매자</option>
                </select>
                <input type="text" name="search2">
                <input type="submit" value="검색" name="searchbtn">
                </form>
            </div>
            <table>
                <tbody>
                    <tr>
                        <th><input type="checkbox" name="allCk"></th>
                        <th>이미지</th>
                        <th>상품코드</th>
                        <th>상품명</th>
                        <th>판매가격</th>
                        <th>할인율</th>
                        <th>포인트</th>
                        <th>재고</th>
                        <th>판매자</th>
                        <th>조회</th>
                        <th>관리</th>
                    </tr>
                    <c:forEach items="${adpd}" var="prod" begin="${start}" end="${start+9}">
                    <tr>
                        <td><input type="checkbox" name="prodlist" value="${prod.prodNo}"></td>
                        <td><img src="http://3.39.231.136:8080/Kmarket/file/${prod.thumb1}" alt="상품이미지"></td>
                        <td>${prod.prodNo}</td>
                        <td>${prod.prodName}</td>
                        <td>${prod.price}</td>
                        <td>${prod.discount}</td>
                        <td>${prod.point}</td>
                        <td>${prod.stock}</td>
                        <td>${prod.seller}</td>
                        <td>${prod.hit}</td>
                        <td>
                            <a href="#">[삭제]</a>
                            <a href="#">[수정]</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input type="button" value="선택삭제" name="del">
             <div class="paging">
        	<c:if test="${pageGroupStart gt 1}">
        		<span class="prev"><a href="/Kmarket/admin/product/list.do?pg=${pageGroupStart - 1}">이전</a></span>
        	</c:if>
        	<span class="num">
			<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                <a href="/Kmarket/admin/product/list.do?pg=${i}" class="${currentPage eq i?'on':'off'}">${i}</a>
			</c:forEach>
			</span>            
            <c:if test="${pageGroupEnd lt lastPageNum}">
            	<span class="next"><a href="/Kmarket/admin/product/list.do?pg=${pageGroupEnd + 1}">다음</a></span>
            </c:if>
        </div>
        </section>
        <p class="ico info">
            <strong>Tip!</strong>
            전자상거래 등에서의 상품 등의 정보제공에 관한 고시에 따라 총
            35개 상품군에 대해 상품 특성 등을 양식에 따라 입력할 수 있습니다.
        </p>
        <!-- 상품목록 컨텐츠 끝 -->
    </section>
</main>
<jsp:include page="../_footer.jsp"/>