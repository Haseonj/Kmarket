<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
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
		
		// notice 카테고리별 조회
		$('select[name=cate1]').change(function(){
			let cate1 = $('select[name=cate1] > option:selected').val();
			let group = $('input[name=group]').val();
			let type = $('input[name=type]').val();
			
			location.href = "/Kmarket/admin/cs/list.do?group="+group+"&cate="+cate1+"&type="+type;

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
							location.href = '/Kmarket/admin/cs/list.do?group='+group+'&cate='+cate+'&type='+type;
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
				
				$.ajax({
					url: '/Kmarket/admin/cs/delete.do',
					method: 'post',
					data: {'no' : no},
					dataType: 'json',
					success: function(data){
						alert('삭제되었습니다.');
						location.href = '/Kmarket/admin/cs/list.do?group='+group+'&cate='+cate+'&type='+type;
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
                        <option value="0">전체</option>
                        <option value="service" ${cate eq 'service' ? 'selected' : ''}>고객서비스</option>
                        <option value="safe" ${cate eq 'safe' ? 'selected' : ''}>안전거래</option>
                        <option value="danger" ${cate eq 'danger' ? 'selected' : ''}>유해상품</option>
                        <option value="prize" ${cate eq 'prize' ? 'selected' : ''}>이벤트당첨</option>
                    </select>
                    <table>
                        <tr>
                            <th><input type="checkbox" class="all"></th>
                            <th>번호</th>
                            <th>유형</th>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <th>관리</th>
                        </tr>
                        <c:forEach var="article" items="${articles}">
	                        <tr>
	                            <td><input type="checkbox" name="chk" value="${article.no}"></td>
	                            <td>${pageStartNum = pageStartNum - 1}</td>
	                            <td>${article.cate1}</td>
	                            <td><a href="/Kmarket/admin/cs/view.do?group=${group}&cate=${cate}&type=view&no=${article.no}&pg=${pg}">${article.title}</a></td>
	                            <td>${article.hit}</td>
	                            <td>${article.rdate.substring(2, 10)}</td>
	                            <td>
	                                <a href="#" class="delete">[삭제]</a><br/>
	                                <a href="#">[수정]</a>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <a href="#" class="chkDelete">선택삭제</a>
                    <a href="/Kmarket/admin/cs/write.do?group=${group}&cate=${cate}&type=write" class="write">작성하기</a>
                    <div>
                    <c:if test="${pageGroupStart > 1}">
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&type=list&pg=${pageGroupStart - 1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&type=list&pg=${i}" class="${currentPage == i ? 'on' : 'off'}">${i}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">    
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&type=list&pg=${pageGroupEnd + 1}" class="next">다음</a>
                    </c:if>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>