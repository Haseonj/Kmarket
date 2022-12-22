<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		$('article > form').submit(function(){
			let cate = $('select[name=cate1] > option:selected').val();
			let title = $('input[name=title]').val();
			let content = $('textarea[name=content]').val();
			
			if(cate == '0'){
				alert('유형을 선택해 주십시오.');
				return false;
			}else if(title == ''){
				alert('제목을 입력해 주십시오.');
				return false;
			}else if(content == ''){
				alert('내용을 입력해 주십시오.');
				return false;
			}
		});
	});
</script>
                <article>
                    <form action="#" method="post">
                    <input type="hidden" name="group" value="${group}">
                    <input type="hidden" name="cate" value="${cate}">
                    <input type="hidden" name="uid" value="${sessMember.uid}">
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                    <select name="cate1" id="#">
                                        <option value="0">1차 선택</option>
                                        <option value="service">고객서비스</option>
                                        <option value="safe">안전거래</option>
                                        <option value="danger">유해상품</option>
                                        <option value="prize">이벤트당첨</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" placeholder="제목을 입력합니다."></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="content" id="#" cols="30" rows="10" placeholder="내용을 입력합니다."></textarea></td>
                            </tr>
                        </table>
                        <div>
                            <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&type=list">취소하기</a>
                            <input type="submit" class="btnSubmit" value="등록하기"/>
                        </div>
                    </form>
                </article>
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>