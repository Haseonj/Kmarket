<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		let isCate1Ok = false;
		let isCate2Ok = false;
		let isTitleOk = false;
		let isContentOk = false;
		
		$('input[name=title]').focusout(function(){
			
			let title = $('input[name=title]').val();
			
			if(title == ''){
				isTitleOk = false;
			}else{
				isTitleOk = true;
			}
		});
		
		$('textarea[name=content]').focusout(function(){
			
			let content = $('textarea[name=content]').val();
			
			if(content == ''){
				isContentOk = false;
			}else{
				isContentOk = true;
			}
		});
		
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
						html = $("<option value="+0+">상세유형 선택</option>");
						$('select[name=type2]').append(html);
					}

					for(cate2 of data){
						html = $("<option value="+cate2.cate2+">"+cate2.c2Name+"</option>");
						$('select[name=type2]').append(html);
					}
					
					cate2 = $('select[name=type2] > option:selected').val();
					
				}
				
				
			});
			
			if(cate1 == '0'){
				isCate1Ok = false;
			}else{
				isCate1Ok = true;
			}
			
			if(cate2 == '0'){
				isCate2Ok = false;
			}else{
				isCate2Ok = true;
			}
		});
		
		
		$('article > form').submit(function(){
			
			if(!isCate1Ok){
				alert('문의 유형을 선택해 주십시오.');
				return false;
			}
			
			if(!isCate2Ok){
				alert('상세 유형을 선택해 주십시오.');
				return false;
			}
			
			if(!isTitleOk){
				alert('제목을 작성해 주십시오.');
				return false;
			}
			
			if(!isContentOk){
				alert('내용을 작성해 주십시오.');
				return false;
			}
			
			return true;
			
		});
	});
</script>
                <form action="/Kmarket/cs/board/write.do" method="post">
                    <table>
                        <tbody>
                            <tr>
                                <td>문의유형</td>
                                <td>
                                    <select name="type1">
                                        <option value="0">문의유형 선택</option>
                                        <c:forEach var="cate1" items="${cate1}">
                                        <option value="${cate1.cate1}">${cate1.c1Name}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="type2">
                                		<option value="0">상세유형 선택</option>
                                	</select>
                                </td>
                            </tr>
                            <tr>
                                <td>문의제목</td>
                                <td>
                                    <input type="text" name="title" placeholder="제목을 입력하세요.">
                                </td>
                            </tr>
                            <tr>
                                <td>문의내용</td>
                                <td>
                                    <textarea name="content"  placeholder="내용을 입력하세요."></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <a href="/Kmarket/cs/board/list.do?group=${group}&cate=${cate}&type=list" class="btnList">취소하기</a>
                        <input type="submit" class="btnSubmit" value="등록하기">
                    </div>
                </form>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>