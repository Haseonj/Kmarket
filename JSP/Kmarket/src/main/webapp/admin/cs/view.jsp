<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		// 답변 등록
		$('div > .answer').click(function(){
			let cate = '${cate}';
			let cate2 = '${vo.cate2}';
			let group = '${group}';
			let pg = '${pg}';
			let uid = '${sessMember.uid}';
			let answer = $('textarea[name=answer]').val();
			let parent = '${vo.no}';
			
			let jsonData = {
					'uid': uid,
					'answer': answer,
					'parent': parent
			};
			
			$.ajax({
				url: '/Kmarket/admin/cs/insertAnswer.do',
				method: 'get',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					if(data.result == 1){
						location.href = "/Kmarket/admin/cs/view.do?group=qna&cate="+cate+"&cate2="+cate2+"&type=view&no="+parent+"&pg="+pg;
					}
				}
			});
		});
		
		// 게시글 삭제
		$('div > .delete').click(function(){
			let isDelete = confirm('정말 삭제 하시겠습니까?');
			if(isDelete){
				let no = '${vo.no}';
				let cate = '${vo.c1Name}';
				let cate2 = '${vo.cate2}';
				let group = '${group}';
				let pg = '${pg}';
				let type = $('input[name=type]').val();
				
				
				$.ajax({
					url: '/Kmarket/admin/cs/delete.do',
					method: 'post',
					data: {'no' : no},
					dataType: 'json',
					success: function(data){
						alert('삭제되었습니다.');
						location.href = '/Kmarket/admin/cs/list.do?group='+group+'&cate='+cate+'&cate2='+cate2+'&type=list&pg='+pg;
					}
				});
				
			}else{
				return false
			}
		});
	});
</script>
                <article>
                    <table>
                        <tr>
                            <td>유형</td>
                            <td>${vo.cate1}
                            <c:if test="${group eq 'faq' or group eq 'qna'}">
                            - ${vo.cate2}
                            </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td>${vo.title}</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <p>${vo.content}</p>
                            </td>
                        </tr>
                        <c:if test="${group eq 'qna'}">
                        <tr>
                        	<td>답변</td>
                        	<c:choose>
                        	<c:when test="${vo.comment == 0}">
                        		<td><textarea name="answer" rows="10" cols="0"></textarea></td>
                        	</c:when>
                        	<c:otherwise>
                        		<td><p>${answer.content}</p></td>
                        	</c:otherwise>
                        	</c:choose>
                        </tr>
                        </c:if>
                    </table>
                    <div>
                        <a href="#" class="delete">삭제</a>
                        <c:if test="${group eq 'notice' or group eq 'faq'}">
                        <a href="/Kmarket/admin/cs/modify.do?group=${group}&cate=${vo.c1Name}&cate2=${vo.cate2}&type=modify&pg=${pg}&no=${vo.no}" class="modify">수정</a>
                        </c:if>
                        <c:if test="${group eq 'qna' and vo.comment == 0}">
                        <a href="#" class="answer">답변등록</a>
                        </c:if>
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&cate2=${cate2}&type=list&pg=${pg}" class="list">목록</a>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>