<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../_header.jsp"/>
<script>
	$(function(){
		// 게시글 삭제
		$('div > .delete').click(function(){
			let isDelete = confirm('정말 삭제 하시겠습니까?');
			if(isDelete){
				let no = '${faq.no}';
				let cate = '${faq.cate1}';
				let cate2 = '${faq.cate2}';
				let pg = '${pg}';
				
				$.ajax({
					url: '/Kmarket/admin/cs/faq/delete.do',
					method: 'post',
					data: {'no' : no},
					dataType: 'json',
					success: function(data){
						alert('삭제되었습니다.');
						location.href = '/Kmarket/admin/cs/faq/list.do?cate1='+cate1+'&cate2='+cate2+'&pg='+pg;
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
                    <h3>자주묻는질문 보기</h3>
                    <p>
                        HOME > 고객센터 > <strong>자주묻는질문</strong>
                    </p>
                </nav>
                <article>
                    <table>
                        <tr>
                            <td>유형</td>
                            <td>${faq.c1Name} - ${faq.cate2}</td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td>${faq.title}</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <p>${faq.content}</p>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <a href="#" class="delete">삭제</a>
                        <a href="/Kmarket/admin/cs/faq/modify.do?cate1=${faq.cate1}&cate2=${faq.cate2}&no=${faq.no}&pg=${pg}" class="modify">수정</a>
                        <a href="/Kmarket/admin/cs/faq/list.do?cate1=${cate1}&cate2=${cate2}&pg=${pg}" class="list">목록</a>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../../_footer.jsp"/>