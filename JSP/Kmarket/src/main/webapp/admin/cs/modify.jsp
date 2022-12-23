<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		let isCategory = false;
		let isTitle = false;
		let isContent = false;
		
		$('article > form').submit(function(){
			// 수정된 정보
			let changedCate = $('select[name=cate1] > option:selected').val();
			let changedTitle = $('input[name=title]').val();
			let changedContent = $('textarea[name=content]').val();
			
			// 원본 정보
			let selectedCate ='${vo.c1Name}';
			let selectedTitle = '${vo.title}';
			let selectedContent = $('input[name=selectedContent]').val();
			
			
			
			// 카테고리 변경유무
			if(changedCate != selectedCate){
				isCategory = true;
			}else{
				isCategory = false;
			}
			
			// 제목 변경 유무
			if(changedTitle != selectedTitle){
				isTitle = true;
			}
			
			// 내용 변경 유무
			if(changedContent != selectedContent){
				isContent = true;
			}
			
			// 전체 변경 유무
			if(isCategory || isTitle || isContent){
				// 하나라도 변경 시 등록 가능 (카테고리 선택란 제외)
				if(changedCate == '0'){
					alert('유형을 선택해 주십시오.');
					return false;
				}else{
					// 게시글 수정 마지막 확인
					let isModifyOk = confirm('정말 변경 하시겠습니까?');
					if(isModifyOk){
						return true;
					}else{
						return false;
					}
				}
			}else{
				alert('게시글을 수정 후 등록해 주십시오.');
				return false;
			}
		});
	});
</script>
                <article>
                    <form action="#" method="post">
                    <input type="hidden" name="group" value="${group}">
                    <input type="hidden" name="c1Name" value="${vo.c1Name}">
                    <input type="hidden" name="uid" value="${sessMember.uid}">
                    <input type="hidden" name="selectedContent" value="${vo.content}">
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                    <select name="cate1" id="#">
                                        <option value="0">1차 선택</option>
                                        <option value="service" ${vo.c1Name eq 'service' ? 'selected' : ''}>고객서비스</option>
                                        <option value="safe" ${vo.c1Name eq 'safe' ? 'selected' : ''}>안전거래</option>
                                        <option value="danger" ${vo.c1Name eq 'danger' ? 'selected' : ''}>유해상품</option>
                                        <option value="prize" ${vo.c1Name eq 'prize' ? 'selected' : ''}>이벤트당첨</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" value="${vo.title}"></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="content" id="#" cols="30" rows="10" placeholder="내용을 입력합니다.">${vo.content}</textarea></td>
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