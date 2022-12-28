<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../_header.jsp"/>
<script>
	$(function(){
		let isCategory = false;
		let isTitle = false;
		let isContent = false;
		let isCategory2 = false;
		
		
		$('article > form').submit(function(){
			// 수정된 정보
			let changedCate = $('select[name=type1] > option:selected').val();
			let changedTitle = $('input[name=title]').val();
			let changedContent = $('textarea[name=content]').val();
			
			// 원본 정보
			let selectedCate ='${notice.cate1}';
			let selectedTitle = '${notice.title}';
			let selectedContent = '${notice.content}';
			
			
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
					if(changedCate == 'all'){
						alert('유형을 선택해 주십시오.');
						return false;
					}else{
						// 게시글 수정 마지막 확인
						let isModifyOk = confirm('정말 변경 하시겠습니까?');
						if(!isModifyOk){
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
<section id="admin-cs-modify">
                <nav>
                    <h3>공지사항 수정</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article>
                    <form action="#" method="post">
                    <input type="hidden" name="no" value="${no}">
                    <input type="hidden" name="pg" value="${pg}">
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                   <select name="type1">
				                       <option value="all">전체</option>
				                       <option value="service" ${notice.cate1 eq 'service' ? 'selected' : ''}>고객서비스</option>
				                       <option value="safe" ${notice.cate1 eq 'safe' ? 'selected' : ''}>안전거래</option>
				                       <option value="danger" ${notice.cate1 eq 'danger' ? 'selected' : ''}>유해상품</option>
				                       <option value="prize" ${notice.cate1 eq 'prize' ? 'selected' : ''}>이벤트당첨</option>
				                   </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" value="${notice.title}"></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="content" id="#" cols="30" rows="10" placeholder="내용을 입력합니다.">${notice.content}</textarea></td>
                            </tr>
                        </table>
                        <div>
                            <a href="/Kmarket/admin/cs/notice/view.do?cate1=${cate1}&pg=${pg}&no=${notice.no}">취소하기</a>
                            <input type="submit" class="btnSubmit" value="등록하기"/>
                        </div>
                    </form>
                </article>
            </section>
        </main>
<jsp:include page="../../_footer.jsp"/>