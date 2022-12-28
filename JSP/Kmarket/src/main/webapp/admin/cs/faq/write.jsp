<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../_header.jsp"/>
<script>
	$(function(){
		
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
						html = $("<option value="+0+">2차선택</option>");
						$('select[name=type2]').append(html);
					}

					for(cate2 of data){
						html = $("<option>"+cate2.cate2+"</option>");
						$('select[name=type2]').append(html);
					}
					
					cate2 = $('select[name=type2] > option:selected').val();
					
					console.log(cate2);
					
				}
				
				
			});
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