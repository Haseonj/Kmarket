<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../_header.jsp"/>
<script>
	$(function(){
		let isCategory = false;
		let isTitle = false;
		let isContent = false;
		let isCategory2 = false;
		
		$('select[name=type1]').change(function(){
			
			let cate1 = $('select[name=type1] > option:selected').val();
			let cate2;
			
			$.ajax({
				url: '/Kmarket/cs/board/category.do',
				method: 'get',
				data: {'cate1': cate1},
				dataType: 'json',
				success: function(data){
					$('select[name=type2]').empty();
					let html;
					
					if(data == ""){
						html = $("<option value="+0+">2차선택</option>");
						$('select[name=type2]').append(html);
					}

					for(cate2 of data){
						html = $("<option>"+cate2.cate2+"</option>");
						$('select[name=type2]').append(html);
					}
					
					cate2 = $('select[name=type2] > option:selected').val();
					
				}
				
				
			});
		});
		
		$('article > form').submit(function(){
			
			// 수정된 정보
			let changedCate = $('select[name=type1] > option:selected').val();
			let changedCate2 = $('select[name=type2] > option:selected').val();
			let changedTitle = $('input[name=title]').val();
			let changedContent = $('textarea[name=content]').val();
			
			// 원본 정보
			let selectedCate ='${faq.cate1}';
			let selectedCate2 ='${faq.cate2}';
			let selectedTitle = '${faq.title}';
			let selectedContent = '${faq.content}';
			
			
			// 카테고리 변경유무
			if(changedCate != selectedCate){
				isCategory = true;
			}else{
				isCategory = false;
			}
			
			if(changedCate2 != selectedCate2){
				isCategory2 = true;
			}else{
				isCategory2 = false;
			}
			
			
			// 제목 변경 유무
			if(changedTitle != selectedTitle){
				isTitle = true;
			}
			
			// 내용 변경 유무
			if(changedContent != selectedContent){
				isContent = true;
			}
			
			// 전체 변경 유무
			if(isCategory || isCategory2 || isTitle || isContent){
				// 하나라도 변경 시 등록 가능 (카테고리 선택란 제외)
				if(changedCate == 'all'){
					alert('1차 유형을 선택해 주십시오.');
					return false;
				}else if(changedCate2 == 'all'){
					alert('2차 유형을 선택해 주십시오.');
					return false;
				}else{
					console.log(changedCate);
					console.log(changedCate2);
					// 게시글 수정 마지막 확인
					let isModifyOk = confirm('정말 변경 하시겠습니까?');
					if(isModifyOk){
						return true;
					}else{
						return false;
					}
				}
			}else{
				alert('게시글을 수정 후 등록해 주십시오.');
				return false;
			}
		});
	});
</script>
<section id="admin-cs-modify">
                <nav>
                    <h3>자주묻는질문 수정</h3>
                    <p>
                        HOME > 고객센터 > <strong>자주묻는질문</strong>
                    </p>
                </nav>
                <article>
                    <form action="#" method="post">
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                   <select name="type1">
					                   	<option value="all">1차선택</option>
					                   	<option value="user" ${cate1 eq 'user' ? 'selected' : ''}>회원</option>
					                   	<option value="event" ${cate1 eq 'event' ? 'selected' : ''}>쿠폰/이벤트</option>
					                   	<option value="order" ${cate1 eq 'order' ? 'selected' : ''}>주문/결제</option>
					                   	<option value="shipping" ${cate1 eq 'shipping' ? 'selected' : ''}>배송</option>
					                   	<option value="cancel" ${cate1 eq 'cancel' ? 'selected' : ''}>취소/반품/교한</option>
					                   	<option value="travel" ${cate1 eq 'travel' ? 'selected' : ''}>여행/숙박/항공</option>
					                   	<option value="safe" ${cate1 eq 'safe' ? 'selected' : ''}>안전거래</option>
				                   </select>
				                   <select name="type2">
					                   	<option value="all">2차선택</option>
					                 	<c:if test="${cate1 eq 'user'}">
					                 	<option ${cate2 eq '가입' ? 'selected' : ''}>가입</option>
					                 	<option ${cate2 eq '탈퇴' ? 'selected' : ''}>탈퇴</option>
					                 	<option ${cate2 eq '회원정보' ? 'selected' : ''}>회원정보</option>
					                 	<option ${cate2 eq '로그인' ? 'selected' : ''}>로그인</option>
					                 	</c:if>
					                 	<c:if test="${cate1 eq 'event'}">
					                 	<option ${cate2 eq '쿠폰/할인혜택' ? 'selected' : ''}>쿠폰/할인혜택</option>
					                 	<option ${cate2 eq '포인트' ? 'selected' : ''}>포인트</option>
					                 	<option ${cate2 eq '제휴' ? 'selected' : ''}>제휴</option>
					                 	<option ${cate2 eq '이벤트' ? 'selected' : ''}>이벤트</option>
					                 	</c:if>
					                 	<c:if test="${cate eq 'order'}">
					                 	<option ${cate2 eq '상품' ? 'selected' : ''}>상품</option>
					                 	<option ${cate2 eq '결제' ? 'selected' : ''}>결제</option>
					                 	<option ${cate2 eq '구매내역' ? 'selected' : ''}>구매내역</option>
					                 	<option ${cate2 eq '영수증/증빙' ? 'selected' : ''}>영수증/증빙</option>
					                 	</c:if>
					                 	<c:if test="${cate1 eq 'shipping'}">
					                 	<option ${cate2 eq '배송상태/시간' ? 'selected' : ''}>배송상태/시간</option>
					                 	<option ${cate2 eq '배송정보확인/변경' ? 'selected' : ''}>배송정보확인/변경</option>
					                 	<option ${cate2 eq '해외배송' ? 'selected' : ''}>해외배송</option>
					                 	<option ${cate2 eq '당일배송' ? 'selected' : ''}>당일배송</option>
					                 	<option ${cate2 eq '해외직구' ? 'selected' : ''}>해외직구</option>
					                 	</c:if>
					                 	<c:if test="${cate1 eq 'cancel'}">
					                 	<option ${cate2 eq '반품신청/철회' ? 'selected' : ''}>반품신청/철회</option>
					                 	<option ${cate2 eq '반품정보확인/변경' ? 'selected' : ''}>반품정보확인/변경</option>
					                 	<option ${cate2 eq '교환 AS신청/철회' ? 'selected' : ''}>교환 AS신청/철회</option>
					                 	<option ${cate2 eq '교환정보확인/변경' ? 'selected' : ''}>교환정보확인/변경</option>
					                 	<option ${cate2 eq '취소신청/철회' ? 'selected' : ''}>취소신청/철회</option>
					                 	<option ${cate2 eq '취소확인/환불정보' ? 'selected' : ''}>취소확인/환불정보</option>
					                 	</c:if>
					                 	<c:if test="${cate1 eq 'travel'}">
					                 	<option ${cate2 eq '여행/숙박' ? 'selected' : ''}>여행/숙박</option>
					                 	<option ${cate2 eq '항공' ? 'selected' : ''}>항공</option>
					                 	</c:if>
					                 	<c:if test="${cate1 eq 'safe'}">
					                 	<option ${cate2 eq '서비스 이용규칙 위반' ? 'selected' : ''}>서비스 이용규칙 위반</option>
					                 	<option ${cate2 eq '지식재산권침해' ? 'selected' : ''}>지식재산권침해</option>
					                 	<option ${cate2 eq '법령 및 정책위반 상품' ? 'selected' : ''}>법령 및 정책위반 상품</option>
					                 	<option ${cate2 eq '게시물 정책위반' ? 'selected' : ''}>게시물 정책위반</option>
					                 	<option ${cate2 eq '직거래/외부거래유도' ? 'selected' : ''}>직거래/외부거래유도</option>
					                 	<option ${cate2 eq '표시광고' ? 'selected' : ''}>표시광고</option>
					                 	<option ${cate2 eq '청소년 위해상품/이미지' ? 'selected' : ''}>청소년 위해상품/이미지</option>
					                 	</c:if>
				                   </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" value="${faq.title}"></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="content" id="#" cols="30" rows="10" placeholder="내용을 입력합니다.">${faq.content}</textarea></td>
                            </tr>
                        </table>
                        <div>
                            <a href="/Kmarket/admin/cs/faq/view.do?cate1=${cate1}&cate2=${cate2}&pg=${pg}&no=${faq.no}">취소하기</a>
                            <input type="submit" class="btnSubmit" value="등록하기"/>
                        </div>
                    </form>
                </article>
            </section>
        </main>
<jsp:include page="../../_footer.jsp"/>