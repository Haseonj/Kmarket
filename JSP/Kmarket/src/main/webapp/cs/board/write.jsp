<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
            <article>
                <form action="#">
                    <table>
                        <tbody>
                            <tr>
                                <td>문의유형</td>
                                <td>
                                    <select name="type">
                                        <option value="0">선택</option>
                                        <option>가입</option>
                                        <option>탈퇴</option>
                                        <option>회원정보</option>
                                        <option>로그인</option>
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