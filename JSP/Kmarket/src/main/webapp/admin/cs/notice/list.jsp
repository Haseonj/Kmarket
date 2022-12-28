<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../_header.jsp"/>
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
		
		
		// 1차 카테고리별 조회
		$('select[name=type1]').change(function(){
			let cate1 = $('select[name=type1] > option:selected').val();
			
			location.href = "/Kmarket/admin/cs/notice/list.do?cate1="+cate1+"&pg=1";

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
					let cate1 = $('select[name=type1] > option:selected').val();
					let pg = '${pg}';
					let checked = [];
					// 체크박스 정보 삽입
					$('input[name=chk]:checked').each(function(){
						checked.push($(this).val());
					});
					
					$.ajax({
						url: '/Kmarket/admin/cs/notice/delete.do',
						method: 'post',
						traditional: true,
						data: {'checked' : checked},
						dataType: 'json',
						success: function(data){
							alert('삭제되었습니다.');
							location.href = '/Kmarket/admin/cs/notice/list.do?&cate1='+cate1+'&pg='+pg;
						}
					});
				}else{
					return false;
				}
			}
		});
		
		// 게시글 삭제 (관리)
		$('td > .delete').click(function(){
			let isDelete = confirm('정말 삭제 하시겠습니까?');
			if(isDelete){
				let no = $(this).parent().parent().children(1).children(1).val();
				let cate1 = $('select[name=type1] > option:selected').val();
				let pg = '${pg}';
				
				
				$.ajax({
					url: '/Kmarket/admin/cs/notice/delete.do',
					method: 'post',
					data: {'no' : no},
					dataType: 'json',
					success: function(data){
						alert('삭제되었습니다.');
						location.href = '/Kmarket/admin/cs/notice/list.do?cate1='+cate1+'&pg='+pg;
					}
				});
				
			}else{
				return false
			}
		});
	});
</script>     
<section id="admin-cs-list">
                <nav>
                    <h3>공지사항 목록</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article>
                	<input type="hidden" name="group" value="${group}">
                	<input type="hidden" name="type" value="${type}">
                    <select name="type1">
                        <option value="all">전체</option>
                        <option value="service" ${cate1 eq 'service' ? 'selected' : ''}>고객서비스</option>
                        <option value="safe" ${cate1 eq 'safe' ? 'selected' : ''}>안전거래</option>
                        <option value="danger" ${cate1 eq 'danger' ? 'selected' : ''}>유해상품</option>
                        <option value="prize" ${cate1 eq 'prize' ? 'selected' : ''}>이벤트당첨</option>
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
                        <c:forEach var="notice" items="${notice}">
	                        <tr>
	                            <td><input type="checkbox" name="chk" value="${notice.no}"></td>
	                            <td>${pageStartNum = pageStartNum - 1}</td>
	                            <td>${notice.c1Name}</td>
	                            <td class="title"><a href="/Kmarket/admin/cs/notice/view.do?cate1=${notice.cate1}&no=${notice.no}&pg=${pg}">${notice.title}</a></td>
	                            <td>${notice.hit}</td>
	                            <td>${notice.rdate.substring(2, 10)}</td>
	                            <td>
	                                <a href="#" class="delete">[삭제]</a><br/>
	                                <a href="/Kmarket/admin/cs/notice/modify.do?cate1=${cate1}&no=${notice.no}&pg=${pg}">[수정]</a>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <a href="#" class="chkDelete">선택삭제</a>
                    <a href="/Kmarket/admin/cs/notice/write.do?cate1=${cate1}&pg=1" class="write">작성하기</a>
                    <div>
                    <c:if test="${pageGroupStart > 1}">
                        <a href="/Kmarket/admin/cs/notice/list.do?cate1=${cate1}&pg=${pageGroupStart - 1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                        <a href="/Kmarket/admin/cs/notice/list.do?cate1=${cate1}&pg=${i}" class="${currentPage == i ? 'on' : 'off'}">${i}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">    
                        <a href="/Kmarket/admin/cs/notice/list.do?cate1=${cate1}&pg=${pageGroupEnd + 1}" class="next">다음</a>
                    </c:if>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../../_footer.jsp"/>