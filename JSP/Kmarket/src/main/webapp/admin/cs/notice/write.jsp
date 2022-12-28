<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../_header.jsp"/>
<script>
	$(function(){
		$('article > form').submit(function(){
			let cate1 = $('select[name=type1] > option:selected').val();
			let title = $('input[name=title]').val();
			let content = $('textarea[name=content]').val();
			
			if(cate1 == 'all'){
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
<section id="admin-cs-write">
                <nav>
                    <h3>공지사항 작성</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
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
				                       <option value="all">전체</option>
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
                            <a href="/Kmarket/admin/cs/notice/list.do?cate1=${cate1}&pg=1">취소하기</a>
                            <input type="submit" class="btnSubmit" value="등록하기"/>
                        </div>
                    </form>
                </article>
            </section>
        </main>
<jsp:include page="../../_footer.jsp"/>