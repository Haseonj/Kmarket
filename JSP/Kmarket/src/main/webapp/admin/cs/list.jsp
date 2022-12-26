<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		let isGroup = '${group}';
		// 체크박스
		$('.all').click(function(){
			if($('.all').is(':checked')){
				$('input[name=chk]').prop('checked', true);
			}else{
				$('input[name=chk]').prop('checked', false);
			}
		});
		$('input[name=chk]').click(function(){
			let total = $('input[name=chk]').length;
			let checked = $('input[name=chk]:checked').length;
			
			if(total != checked){
				$('.all').prop('checked', false);
			}else{
				$('.all').prop('checked', true);
			}
		});
		
		
		// 1차 카테고리별 조회
		$('select[name=cate1]').change(function(){
			let cate1 = $('select[name=cate1] > option:selected').val();
			let group = $('input[name=group]').val();
			let type = $('input[name=type]').val();
			
			location.href = "/Kmarket/admin/cs/list.do?group="+group+"&cate="+cate1+"&cate2=0&type="+type+"&pg=1";

		});
		// 2차 카테고리별 조회
		$('select[name=cate2]').change(function(){
			let cate1 = $('select[name=cate1] > option:selected').val();
			let cate2 = $('select[name=cate2] > option:selected').val();
			let group = $('input[name=group]').val();
			let type = $('input[name=type]').val();
			
			location.href = "/Kmarket/admin/cs/list.do?group="+group+"&cate="+cate1+"&cate2="+cate2+"&type="+type+"&pg=1";

		});
		
		// 선택삭제
		$('article > .chkDelete').click(function(e){
			e.preventDefault();
			// 체크박스 선택유무
			if(!$('input[name=chk]').is(':checked')){
				alert('게시글을 선택해 주십시오.');
			}else{
				let isDelete = confirm('정말 삭제 하시겠습니까?');
				
				// 삭제의사 재확인
				if(isDelete){
					let cate = $('select[name=cate1] > option:selected').val();
					let group = $('input[name=group]').val();
					let type = $('input[name=type]').val();
					let pg = '${pg}';
					let checked = [];
					// 체크박스 정보 삽입
					$('input[name=chk]:checked').each(function(){
						checked.push($(this).val());
					});
					
					$.ajax({
						url: '/Kmarket/admin/cs/delete.do',
						method: 'post',
						traditional: true,
						data: {'checked' : checked},
						dataType: 'json',
						success: function(data){
							alert('삭제되었습니다.');
							location.href = '/Kmarket/admin/cs/list.do?group='+group+'&cate='+cate+'&type=list&pg='+pg;
						}
					});
				}else{
					return false;
				}
			}
		});
		
		$('td > .delete').click(function(){
			let isDelete = confirm('정말 삭제 하시겠습니까?');
			if(isDelete){
				let no = $(this).parent().parent().children(1).children(1).val();
				let cate = $('select[name=cate1] > option:selected').val();
				let group = $('input[name=group]').val();
				let type = $('input[name=type]').val();
				let pg = '${pg}';
				
				$.ajax({
					url: '/Kmarket/admin/cs/delete.do',
					method: 'post',
					data: {'no' : no},
					dataType: 'json',
					success: function(data){
						alert('삭제되었습니다.');
						location.href = '/Kmarket/admin/cs/list.do?group='+group+'&cate='+cate+'&type=list&pg='+pg;
					}
				});
				
			}else{
				return false
			}
		});
	});
</script>            
                <article>
                	<input type="hidden" name="group" value="${group}">
                	<input type="hidden" name="type" value="${type}">
                	
                    <select name="cate1" id="cate1">
                    <c:if test="${group eq 'notice'}">
                        <option value="0">전체</option>
                        <option value="service" ${cate eq 'service' ? 'selected' : ''}>고객서비스</option>
                        <option value="safe" ${cate eq 'safe' ? 'selected' : ''}>안전거래</option>
                        <option value="danger" ${cate eq 'danger' ? 'selected' : ''}>유해상품</option>
                        <option value="prize" ${cate eq 'prize' ? 'selected' : ''}>이벤트당첨</option>
                    </c:if>
                    <c:if test="${group eq 'faq' or group eq 'qna'}">
                    	<option value="0">1차선택</option>
                    	<option value="user" ${cate eq 'user' ? 'selected' : ''}>회원</option>
                    	<option value="event" ${cate eq 'event' ? 'selected' : ''}>쿠폰/이벤트</option>
                    	<option value="order" ${cate eq 'order' ? 'selected' : ''}>주문/결제</option>
                    	<option value="shipping" ${cate eq 'shipping' ? 'selected' : ''}>배송</option>
                    	<option value="cancel" ${cate eq 'cancel' ? 'selected' : ''}>취소/반품/교한</option>
                    	<option value="travel" ${cate eq 'travel' ? 'selected' : ''}>여행/숙박/항공</option>
                    	<option value="safe" ${cate eq 'safe' ? 'selected' : ''}>안전거래</option>
                    </c:if>
                    </select>
                    <c:if test="${group eq 'faq' or group eq 'qna'}">
                    <select name="cate2" id="cate2">
                    	<option value="0">2차선택</option>
                    	<c:if test="${cate eq 'user'}">
                    	<option ${cate2 eq '가입' ? 'selected' : ''}>가입</option>
                    	<option ${cate2 eq '탈퇴' ? 'selected' : ''}>탈퇴</option>
                    	<option ${cate2 eq '회원정보' ? 'selected' : ''}>회원정보</option>
                    	<option ${cate2 eq '로그인' ? 'selected' : ''}>로그인</option>
                    	</c:if>
                    	<c:if test="${cate eq 'event'}">
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
                    	<c:if test="${cate eq 'shipping'}">
                    	<option ${cate2 eq '배송상태/시간' ? 'selected' : ''}>배송상태/시간</option>
                    	<option ${cate2 eq '배송정보확인/변경' ? 'selected' : ''}>배송정보확인/변경</option>
                    	<option ${cate2 eq '해외배송' ? 'selected' : ''}>해외배송</option>
                    	<option ${cate2 eq '당일배송' ? 'selected' : ''}>당일배송</option>
                    	<option ${cate2 eq '해외직구' ? 'selected' : ''}>해외직구</option>
                    	</c:if>
                    	<c:if test="${cate eq 'cancel'}">
                    	<option ${cate2 eq '반품신청/철회' ? 'selected' : ''}>반품신청/철회</option>
                    	<option ${cate2 eq '반품정보확인/변경' ? 'selected' : ''}>반품정보확인/변경</option>
                    	<option ${cate2 eq '교환 AS신청/철회' ? 'selected' : ''}>교환 AS신청/철회</option>
                    	<option ${cate2 eq '교환정보확인/변경' ? 'selected' : ''}>교환정보확인/변경</option>
                    	<option ${cate2 eq '취소신청/철회' ? 'selected' : ''}>취소신청/철회</option>
                    	<option ${cate2 eq '취소확인/환불정보' ? 'selected' : ''}>취소확인/환불정보</option>
                    	</c:if>
                    	<c:if test="${cate eq 'travel'}">
                    	<option ${cate2 eq '여행/숙박' ? 'selected' : ''}>여행/숙박</option>
                    	<option ${cate2 eq '항공' ? 'selected' : ''}>항공</option>
                    	</c:if>
                    	<c:if test="${cate eq 'safe'}">
                    	<option ${cate2 eq '서비스 이용규칙 위반' ? 'selected' : ''}>서비스 이용규칙 위반</option>
                    	<option ${cate2 eq '지식재산권침해' ? 'selected' : ''}>지식재산권침해</option>
                    	<option ${cate2 eq '법령 및 정책위반 상품' ? 'selected' : ''}>법령 및 정책위반 상품</option>
                    	<option ${cate2 eq '게시물 정책위반' ? 'selected' : ''}>게시물 정책위반</option>
                    	<option ${cate2 eq '직거래/외부거래유도' ? 'selected' : ''}>직거래/외부거래유도</option>
                    	<option ${cate2 eq '표시광고' ? 'selected' : ''}>표시광고</option>
                    	<option ${cate2 eq '청소년 위해상품/이미지' ? 'selected' : ''}>청소년 위해상품/이미지</option>
                    	</c:if>
                    </select>
                    </c:if>
                    <table>
                        <tr>
                            <th><input type="checkbox" class="all"></th>
                            <th>번호</th>
                            <c:if test="${group eq 'notice'}">
                            <th>유형</th>
                            </c:if>
                            <c:if test="${group eq 'faq' or group eq 'qna'}">
                            <th>1차 유형</th>
                            <th>2차 유형</th>
                            </c:if>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <c:if test="${group eq 'notice' or group eq 'faq'}">
                            <th>관리</th>
                            </c:if>
                            <c:if test="${group eq 'qna'}">
                            <th>상태</th>
                            </c:if>
                        </tr>
                        <c:forEach var="article" items="${articles}">
	                        <tr>
	                            <td><input type="checkbox" name="chk" value="${article.no}"></td>
	                            <td>${pageStartNum = pageStartNum - 1}</td>
	                            <td>${article.cate1}</td>
	                            <c:if test="${group eq 'faq' or group eq 'qna'}">
	                            <td>${article.cate2}</td>
	                            </c:if>
	                            <td class="title"><a href="/Kmarket/admin/cs/view.do?group=${group}&cate=${cate}&cate2=${cate2}&type=view&no=${article.no}&pg=${pg}">${article.title}</a></td>
	                            <td>${article.hit}</td>
	                            <td>${article.rdate.substring(2, 10)}</td>
	                            <td>
	                            <c:if test="${group eq 'notice' or group eq 'faq'}">
	                                <a href="#" class="delete">[삭제]</a><br/>
	                                <a href="/Kmarket/admin/cs/modify.do?group=${group}&cate=${article.c1Name}&cate2=${article.cate2}&type=modify&no=${article.no}">[수정]</a>
                                </c:if>
                                <c:if test="${group eq 'qna'}">
                                	<c:if test="${group eq 'qna'}">
                                	검토중
                                	</c:if>
                                	<br>
                                	<c:if test="${group eq 'notice'}">
                                	답변완료
                                	</c:if>
                                </c:if>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <a href="#" class="chkDelete">선택삭제</a>
                    <a href="/Kmarket/admin/cs/write.do?group=${group}&cate=0&cate2=0&type=write" class="write">작성하기</a>
                    <div>
                    <c:if test="${pageGroupStart > 1}">
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&cate2=${cate2}&type=list&pg=${pageGroupStart - 1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&cate2=${cate2}&type=list&pg=${i}" class="${currentPage == i ? 'on' : 'off'}">${i}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">    
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&cate2=${cate2}&type=list&pg=${pageGroupEnd + 1}" class="next">다음</a>
                    </c:if>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>