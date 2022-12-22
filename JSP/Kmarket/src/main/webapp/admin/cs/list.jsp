<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
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
	});
</script>            
                <article>
                    <select name="type" id="cate1">
                        <option value="0">유형선택</option>
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
	                            <td><input type="checkbox" name="chk"></td>
	                            <td>${pageStartNum = pageStartNum - 1}</td>
	                            <td>고객서비스</td>
	                            <td><a href="#">${article.title}</a></td>
	                            <td>120</td>
	                            <td>${article.rdate.substring(2, 10)}</td>
	                            <td>
	                                <a href="#">[삭제]</a><br/>
	                                <a href="#">[수정]</a>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <a href="#" class="delete">선택삭제</a>
                    <a href="#" class="write">작성하기</a>
                    <div>
                        <a href="#" class="prev">이전</a>
                        <a href="#" class="on">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#" class="next">다음</a>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>