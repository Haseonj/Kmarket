<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../_header.jsp"/>
<script>
	$(function(){
		
		$('select[name=type1]').change(function(){
			let cate1 = $('select[name=type1] > option:selected').val();
			
			let user = ['가입', '탈퇴', '회원정보', '로그인'];
			let event = ['쿠폰/할인혜택', '포인트', '제휴', '이벤트'];
			let order = ['상품', '결제', '구매내역', '영수증/증빙'];
			let shipping = ['배송상태/기간', '배송정보확인/변경', '해외배송', '당일배송', '해외직구'];
			let cancel = ['반품신청/철회', '반품정보확인/변경', '교환 AS신청/철회', '교환정보확인/변경', '취소신청/철회', '취소확인/환불정보'];
			let travel = ['여행/숙박', '항공'];
			let safe = ['서비스 이용규칙 위반', '지식재산권침해', '법령 및 정책위반 상품', '게시물 정책위반', '직거래/외부거래유도', '표시광고', '청소년 위해상품/이미지'];
			let none = ['상세유형 선택'];
			
			let cate2;
			
			if(cate1 == 'user'){
				cate2 = user;
			}else if(cate1 == 'event'){
				cate2 = event;
			}else if(cate1 == 'order'){
				cate2 = order;
			}else if(cate1 == 'shipping'){
				cate2 = shipping;
			}else if(cate1 == 'cancel'){
				cate2 = cancel;
			}else if(cate1 == 'travel'){
				cate2 = travel;
			}else if(cate1 == 'safe'){
				cate2 = safe;
			}else{
				cate2 = none;
			}
			
			$('select[name=type2]').empty();
			
			if(cate2 != 'none'){
				for(let i = 0; i < cate2.length; i++){
					let html = $("<option>"+cate2[i]+"</option>");
					$('select[name=type2]').append(html);
				}
			}else{
				let html = $("<option>"+cate2+"</option>");
			}
			
		});
		
		$('select[name=type2]').change(function(){
			let cate2 = $('select[name=type2] > option:selected').val();
			console.log(cate2);
		});
		
		$('article > form').submit(function(){
			let group = '${group}';
			let cate = $('select[name=type1] > option:selected').val();
			let title = $('input[name=title]').val();
			let content = $('textarea[name=content]').val();
			
			if(group == 'notice'){
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
			}else{
				if(cate == '0'){
					alert('유형을 선택해 주십시오.');
					return false;
				}else if(cate2 == '0'){
					alert('상세유형을 선택해 주십시오.');
					return false;
				}else if(title == ''){
					alert('제목을 입력해 주십시오.');
					return false;
				}else if(content == ''){
					alert('내용을 입력해 주십시오.');
					return false;
				}
			}
			return true;
		});
	});
</script>
<section id="admin-cs-write">
                <nav>
                    <h3>자주묻는질문 작성</h3>
                    <p>
                        HOME > 고객센터 > <strong>자주묻는질문</strong>
                    </p>
                </nav>
                <article>
                    <form action="#" method="post">
                    <input type="hidden" name="uid" value="${sessMember.uid}">
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                 	<select name="type1">
					                   	<option value="0">1차선택</option>
					                   	<option value="user">회원</option>
					                   	<option value="event">쿠폰/이벤트</option>
					                   	<option value="order">주문/결제</option>
					                   	<option value="shipping">배송</option>
					                   	<option value="cancel">취소/반품/교한</option>
					                   	<option value="travel">여행/숙박/항공</option>
					                   	<option value="safe">안전거래</option>
				                   	</select>
				                   	<select name="type2">
				                   		<option>2차선택</option>
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
                            <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&cate2=${cate2}&type=list&pg=1">취소하기</a>
                            <input type="submit" class="btnSubmit" value="등록하기"/>
                        </div>
                    </form>
                </article>
            </section>
        </main>
<jsp:include page="../../_footer.jsp"/>