<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(function(){
		$('select[name=type1]').change(function(){
			let cate1 = $('select[name=type1] > option:selected').val();
			console.log("cate1 : " + cate1);
			let cate2;
			/*
			let user = ['가입','탈퇴','회원정보','로그인'];
			let event = ['쿠폰/할인혜택','포인트','제휴','이벤트'];
			let order = ['상품','결제','구매내역','영수증/증빙'];
			let shipping = ['배송상태/기간','배송정보확인/변경','해외배송','당일배송','해외직구'];
			let cancel = ['반품신청/철회','반품정보확인/변경','교환 AS신청/철회','교환정보확인/변경','취소신청/철회','취소확인/환불정보'];
			let travel = ['여행/숙박','항공'];
			let safe = ['서비스 이용규칙 위반','지식재산권침해','법령 및 정책위반 상품','게시물 정책위반','직거래/외부거래유도','표시광고','청소년 위해상품/이미지'];
			
			if(cate1 == '1'){
				cate2 = user;
			}else if(cate1 == '2'){
				cate2 = event;
			}else if(cate1 == '3'){
				cate2 = order;
			}else if(cate1 == '4'){
				cate2 = shipping;
			}else if(cate1 == '5'){
				cate2 = cancel;
			}else if(cate1 == '6'){
				cate2 = travel;
			}else{
				cate2 = safe; 
			}
			
			$('select[name=type2]').show();
			$('select[name=type2]').empty();
			
			for(let i = 0; i < cate2.length; i++){
				html = $("<option value="+[i]+">"+cate2[i]+"</option>");
				$('select[name=type2]').append(html);
			}
			*/
			
			$.ajax({
				url: '/Kmarket/cs/board/write.do',
				method: 'post',
				type: {'cate1': cate1},
				dataType: 'json',
				success: function(data){
					$('select[name=type2]').show();
					$('select[name=type2]').empty();

					console.log(data);
					for(let cate2 of data){
						let html = $("<option value="+data.cate2+">"+data.c2Name+"</option>");
						$('select[name=type2]').append(html);
					}
				}
			});
		});
	});
</script>
            <article>
                <form action="#">
                    <table>
                        <tbody>
                            <tr>
                                <td>문의유형</td>
                                <td>
                                    <select name="type1">
                                        <option value="0">선택</option>
                                        <c:forEach var="cate1" items="${cate1}">
                                        <option value="${cate1.cate1}">${cate1.c1Name}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="type2" style="display: none;">
                                		<option value="0">선택</option>
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