<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		$('div > .delete').click(function(){
			let isDelete = confirm('정말 삭제 하시겠습니까?');
			if(isDelete){
				let no = '${vo.no}';
				let cate = '${cate}';
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
                    <table>
                        <tr>
                            <td>유형</td>
                            <td>${vo.cate1}</td>
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
                    </table>
                    <div>
                        <a href="#" class="delete">삭제</a>
                        <a href="/Kmarket/admin/cs/modify.do?group=${group}&cate=${vo.c1Name}&type=modify&no=${vo.no}">수정</a>
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&type=list&pg=${pg}">목록</a>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>