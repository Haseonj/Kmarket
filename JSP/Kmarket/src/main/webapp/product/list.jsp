<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./_header.jsp"/>
<script>
	
	
	$(function(){
		
		$(document).on('click', '#highsold', function(e){
			e.preventDefault();
			var highsold = document.getElementById('highsold');
			
			let cate1 = '${vo.cate1}';
			let cate2 = '${vo.cate2}';
			
			let jsonData = {"cate1":cate1, "cate2":cate2};
			
			$.ajax({
				url:'/Kmarket/product/productsort1.do',
				method:'post',
				data:jsonData,
				dataType:'json',
				success:function(data){
					highsold.classList.add('on');
				}
			});
		});
	});
</script>
    <section class="list">
        <!--제목, 페이지 네비게이션-->
        <nav>
            <h1>상품목록</h1>
            <p>HOME > <span>${vo.c1Name}</span> > <strong>${vo.c2Name}</strong></p>
        </nav>

        <!--정렬 메뉴-->
        <ul class="sort">
            <li><a href="#" id="highsold">판매많은순</a></li>
            <li><a href="#" id="lowprice">낮은가격순</a></li>
            <li><a href="#" id="highprice">높은가격순</a></li>
            <li><a href="#" id="highrating">평점높은순</a></li>
            <li><a href="#" id="highreview">후기많은순</a></li>
            <li><a href="#" id="new">최근등록순</a></li>
        </ul>

        <!--상품목록-->
        <table border="0">
            <c:forEach var="product" items="${products}">
            	<tr>
                <td><a href="#" class="thumb"><img src="http://3.39.231.136:8080/Kmarket/file/${product.thumb1}" alt="상품이미지"></a></td>
                <td>
                    <h3 class="name">${product.prodName}</h3>
                    <a href="#" class="desc">${product.descript}</a>
                </td>
                <td>
                    <ul>
                    	<c:choose>
                    		<c:when test="${product.discount gt 0}">
                    			<li><ins class="dis-price">${product.price * (100-product.discount) * 0.01}</ins></li>
		                        <li>
		                            <del class="org-price">${product.price}</del>
		                            <span class="discount">${product.discount}%</span>
		                        </li>	
                    		</c:when>
                    		<c:otherwise>
		                        <li>
		                            <del class="dis-price">${product.price}</del>
		                        </li>
                    		</c:otherwise>
                    	</c:choose>
                        
                        <c:choose>
                        	<c:when test="${product.delivery eq 0}">
	                        	<li><span class="free-delivery">무료배송</span></li>
	                        </c:when>
	                        <c:otherwise>
	                        	<li><span>배송비 ${product.delivery}</span></li>
	                        </c:otherwise>
                        </c:choose>
                    </ul>
                </td>
                <td>
                    <h4 class="seller"><i class="fas fa-home"></i>&nbsp;${product.seller}</h4>
                    <h5 class="badge power">판매자등급</h5>
                    <h6 class="rating star1">상품평</h6>
                </td>
            </tr>
            </c:forEach>
        </table>
        <div class="paging">
        	<c:if test="${pageGroupStart gt 1}">
        		<span class="prev"><a href="/Kmarket/product/list.do?pg=${pageGroupStart - 1}"><&nbsp;이전</a></span>
        	</c:if>
        	<span class="num">
			<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                <a href="/Kmarket/product/list.do?pg=${i}" class="${currentPage eq i?'on':'off'}">${i}</a>
			</c:forEach>
			</span>            
            <c:if test="${pageGroupEnd lt lastPageNum}">
            	<span class="next"><a href="/Kmarket/product/list.do?pg=${pageGroupEnd + 1}">다음&nbsp;></a></span>
            </c:if>
        </div>
    </section>
</main>
<jsp:include page="./_footer.jsp"/>