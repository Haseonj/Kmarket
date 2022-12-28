<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../_header.jsp"/>
<script>
	$(function(){
		// 답변 등록
		$('div > .answer').click(function(){
			let cate1 = '${qna.cate1}';
			let cate2 = '${qna.cate2}';
			let pg = '${pg}';
			let uid = '${sessMember.uid}';
			let answer = $('textarea[name=answer]').val();
			let parent = '${qna.no}';
			
			let jsonData = {
					'uid': uid,
					'answer': answer,
					'parent': parent
			};
			
			$.ajax({
				url: '/Kmarket/admin/cs/qna/reply.do',
				method: 'get',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					if(data.result == 1){
						location.href = "/Kmarket/admin/cs/qna/view.do?cate1="+cate1+"&cate2="+cate2+"&no="+parent+"&pg="+pg;
					}
				}
			});
		});
		
		// 게시글 삭제
		$('div > .delete').click(function(){
			let isDelete = confirm('정말 삭제 하시겠습니까?');
			if(isDelete){
				let no = '${qna.no}';
				let cate1 = '${qna.cate1}';
				let cate2 = '${qna.cate2}';
				let pg = '${pg}';
				
				$.ajax({
					url: '/Kmarket/admin/cs/qna/delete.do',
					method: 'post',
					data: {'no' : no},
					dataType: 'json',
					success: function(data){
						alert('삭제되었습니다.');
						location.href = '/Kmarket/admin/cs/qna/list.do?cate1='+cate1+'&cate2='+cate2+'&pg='+pg;
					}
				});
				
			}else{
				return false
			}
		});
	});
</script>
<section id="admin-cs-view">
                <nav>
                    <h3>고객문의 보기</h3>
                    <p>
                        HOME > 고객센터 > <strong>고객문의</strong>
                    </p>
                </nav>
                <article>
                    <table>
                        <tr>
                            <td>유형</td>
                            <td>${qna.c1Name} - ${qna.cate2}</td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td>${qna.title}</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <p>${qna.content}</p>
                            </td>
                        </tr>
                        <tr>
                        	<td>답변</td>
                        	<c:choose>
                        	<c:when test="${qna.comment == 0}">
                        		<td><textarea name="answer" rows="10" cols="0"></textarea></td>
                        	</c:when>
                        	<c:otherwise>
                        		<td><p>${reply.content}</p></td>
                        	</c:otherwise>
                        	</c:choose>
                        </tr>
                    </table>
                    <div>
                        <a href="#" class="delete">삭제</a>
                        <c:if test="${qna.comment == 0}">
	                        <a href="#" class="answer">답변등록</a>
                        </c:if>
                        <a href="/Kmarket/admin/cs/qna/list.do?&cate1=${cate1}&cate2=${cate2}&pg=${pg}" class="list">목록</a>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../../_footer.jsp"/>